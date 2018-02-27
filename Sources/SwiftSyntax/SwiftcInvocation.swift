//===------- SwiftcInvocation.swift - Utilities for invoking swiftc -------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
// This file provides the logic for invoking swiftc to parse Swift files.
//===----------------------------------------------------------------------===//

import Foundation
import Basic

#if os(macOS)
import Darwin
#elseif os(Linux)
import Glibc
#endif

/// The result of process execution, containing the exit status code,
/// stdout, and stderr
struct ProcessResult {
    /// The process exit code. A non-zero exit code usually indicates failure.
    let exitCode: Int

    /// The contents of the process's stdout as Data.
    let stdoutData: Data

    /// The contents of the process's stderr as Data.
    let stderrData: Data

    /// The contents of the process's stdout, assuming the data was UTF-8 encoded.
    var stdout: String {
        return String(data: stdoutData, encoding: .utf8)!
    }

    /// The contents of the process's stderr, assuming the data was UTF-8 encoded.
    var stderr: String {
        return String(data: stderrData, encoding: .utf8)!
    }

    /// Whether or not this process had a non-zero exit code.
    var wasSuccessful: Bool {
        return exitCode == 0
    }
}

/// Runs the provided executable with the provided arguments and returns the
/// contents of stdout and stderr as Data.
/// - Parameters:
///   - executable: The full file URL to the executable you're running.
///   - arguments: A list of strings to pass to the process as arguments.
/// - Returns: A ProcessResult containing stdout, stderr, and the exit code.
func run(_ executable: Foundation.URL, arguments: [String] = []) -> ProcessResult {
    let process = Process(arguments: [executable.path] + arguments)
    try! process.launch()
    let result = try! process.waitUntilExit()
    switch result.exitStatus {
    case .terminated(let code):
        return ProcessResult(exitCode: Int(code),
                             stdoutData: try! result.utf8Output().data(using: .utf8)!,
                             stderrData: try! result.utf8stderrOutput().data(using: .utf8)!)
    default:
        fatalError()
    }
}

enum InvocationError: Error {
    case couldNotFindSwiftc
    case couldNotFindSDK
    case abort(code: Int)
}

struct SwiftcRunner {
    /// Gets the `swiftc` binary packaged alongside this library.
    /// - Returns: The path to `swiftc` relative to the path of this library
    ///            file, or `nil` if it could not be found.
    /// - Note: This makes assumptions about your Swift installation directory
    ///         structure. Importantly, it assumes that the directory tree is
    ///         shaped like this:
    ///         ```
    ///         install_root/
    ///           - bin/
    ///             - swiftc
    ///           - lib/
    ///             - swift/
    ///               - ${target}/
    ///                 - libswiftSwiftSyntax.[dylib|so]
    ///         ```
    static func locateSwiftc() -> Foundation.URL? {
        let process = Process(arguments: ["which", "swiftc"])
        try! process.launch()
        let result = try! process.waitUntilExit()
        return Foundation.URL(fileURLWithPath: (try! result.utf8Output()).trimmingCharacters(in: .whitespacesAndNewlines))
    }

    #if os(macOS)
    /// The location of the macOS SDK, or `nil` if it could not be found.
    static let macOSSDK: String? = {
        let url = URL(fileURLWithPath: "/usr/bin/env")
        let result = run(url, arguments: ["xcrun", "--show-sdk-path"])
        guard result.wasSuccessful else { return nil }
        let toolPath = result.stdout.trimmingCharacters(in: .whitespacesAndNewlines)
        if toolPath.isEmpty { return nil }
        return toolPath
    }()
    #endif

    /// Internal static cache of the Swiftc path.
    static let _swiftcURL: Foundation.URL? = SwiftcRunner.locateSwiftc()

    /// The URL where the `swiftc` binary lies.
    let swiftcURL: Foundation.URL

    /// The source file being parsed.
    let sourceFile: Foundation.URL

    /// Creates a SwiftcRunner that will parse and emit the syntax
    /// tree for a provided source file.
    /// - Parameter sourceFile: The URL to the source file you're trying
    ///                         to parse.
    init(sourceFile: Foundation.URL) throws {
        guard let url = SwiftcRunner._swiftcURL else {
            throw InvocationError.couldNotFindSwiftc
        }
        self.swiftcURL = url
        self.sourceFile = sourceFile
    }

    /// Invokes swiftc with the provided arguments.
    func invoke() throws -> ProcessResult {
        var arguments = ["-frontend", "-emit-syntax"]
        arguments.append(sourceFile.path)
        #if os(macOS)
        guard let sdk = SwiftcRunner.macOSSDK else {
            throw InvocationError.couldNotFindSDK
        }
        arguments.append("-sdk")
        arguments.append(sdk)
        #endif
        return run(swiftcURL, arguments: arguments)
    }
}
