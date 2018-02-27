add_swift_library(swiftSwiftSyntax SHARED
  # This file should be listed the first.  Module name is inferred from the
  # filename.
  SwiftSyntax.swift
  AtomicCache.swift
  Diagnostic.swift
  DiagnosticConsumer.swift
  DiagnosticEngine.swift
  JSONDiagnosticConsumer.swift
  PrintingDiagnosticConsumer.swift
  RawSyntax.swift
  SourcePresence.swift
  SwiftcInvocation.swift
  Syntax.swift
  SyntaxData.swift
  SyntaxChildren.swift
  SyntaxCollections.swift.gyb
  SyntaxBuilders.swift.gyb
  SyntaxFactory.swift.gyb
  SyntaxKind.swift.gyb
  SyntaxNodes.swift.gyb
  SyntaxRewriter.swift.gyb
  TokenKind.swift.gyb
  Trivia.swift

  INSTALL_IN_COMPONENT swift-syntax
  TARGET_SDKS ALL_POSIX_PLATFORMS
  IS_STDLIB)
