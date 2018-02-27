// swift-tools-version:4.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSyntax",
    products: [
        .library(name: "SwiftSyntax", targets: ["SwiftSyntax"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0")
    ],
    targets: [
        .target(name: "SwiftSyntax", dependencies: ["Utility"]),
    ]
)
