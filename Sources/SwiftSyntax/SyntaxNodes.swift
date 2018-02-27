//// Automatically Generated From SyntaxNodes.swift.gyb.
//// Do Not Edit Directly!
//===------------ SyntaxNodes.swift - Syntax Node definitions -------------===//
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


/// A wrapper around a raw Syntax layout.
public struct UnknownSyntax: _SyntaxBase {
  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates an `UnknownSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }
}

public protocol DeclSyntax: Syntax {}

public protocol ExprSyntax: Syntax {}

public protocol StmtSyntax: Syntax {}

public protocol TypeSyntax: Syntax {}

public protocol PatternSyntax: Syntax {}


public struct UnknownDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `UnknownDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }


  /// Determines if two `UnknownDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: UnknownDeclSyntax, rhs: UnknownDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct UnknownExprSyntax: ExprSyntax, _SyntaxBase, Hashable {

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `UnknownExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }


  /// Determines if two `UnknownExprSyntax` nodes are equal to each other.
  public static func ==(lhs: UnknownExprSyntax, rhs: UnknownExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct UnknownStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `UnknownStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }


  /// Determines if two `UnknownStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: UnknownStmtSyntax, rhs: UnknownStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct UnknownTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `UnknownTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }


  /// Determines if two `UnknownTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: UnknownTypeSyntax, rhs: UnknownTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct UnknownPatternSyntax: PatternSyntax, _SyntaxBase, Hashable {

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `UnknownPatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }


  /// Determines if two `UnknownPatternSyntax` nodes are equal to each other.
  public static func ==(lhs: UnknownPatternSyntax, rhs: UnknownPatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


/// 
/// A CodeBlockItem is any Syntax node that appears on its own line inside
/// a CodeBlock.
/// 
public struct CodeBlockItemSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case item
    case semicolon
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `CodeBlockItemSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _item = raw[Cursor.syntax]
    precondition(_item.kind == .syntax,
                 "expected child of kind .syntax, " +
                 "got \(_item.kind)")
    let _semicolon = raw[Cursor.semicolonToken]
    guard let _semicolonTokenKind = _semicolon.tokenKind else {
      fatalError("expected token child, got \(_semicolon.kind)")
    }
    precondition([.semicolon].contains(_semicolonTokenKind),
      "expected one of [.semicolon] for 'semicolon' " + 
      "in node of kind codeBlockItem")
  }
#endif
  /// The underlying node inside the code block.
  public var item: Syntax {
    let child = data.cachedChild(at: Cursor.item)
    return makeSyntax(root: _root, data: child!) 
  }

  /// Returns a copy of the receiver with its `item` replaced.
  /// - param newChild: The new `item` to replace the node's
  ///                   current `item`, if present.
  public func withItem(
    _ newChild: Syntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.item)
    return CodeBlockItemSyntax(root: root, data: newData)
  }
  /// 
  /// If present, the trailing semicolon at the end of the item.
  /// 
  public var semicolon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.semicolon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `semicolon` replaced.
  /// - param newChild: The new `semicolon` to replace the node's
  ///                   current `semicolon`, if present.
  public func withSemicolon(
    _ newChild: TokenSyntax?) -> CodeBlockItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.semicolon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.semicolon)
    return CodeBlockItemSyntax(root: root, data: newData)
  }

  /// Determines if two `CodeBlockItemSyntax` nodes are equal to each other.
  public static func ==(lhs: CodeBlockItemSyntax, rhs: CodeBlockItemSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct CodeBlockSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftBrace
    case statements
    case rightBrace
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `CodeBlockSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftBrace = raw[Cursor.leftBraceToken]
    guard let _leftBraceTokenKind = _leftBrace.tokenKind else {
      fatalError("expected token child, got \(_leftBrace.kind)")
    }
    precondition([.leftBrace].contains(_leftBraceTokenKind),
      "expected one of [.leftBrace] for 'leftBrace' " + 
      "in node of kind codeBlock")
    let _statements = raw[Cursor.codeBlockItemList]
    precondition(_statements.kind == .codeBlockItemList,
                 "expected child of kind .codeBlockItemList, " +
                 "got \(_statements.kind)")
    let _rightBrace = raw[Cursor.rightBraceToken]
    guard let _rightBraceTokenKind = _rightBrace.tokenKind else {
      fatalError("expected token child, got \(_rightBrace.kind)")
    }
    precondition([.rightBrace].contains(_rightBraceTokenKind),
      "expected one of [.rightBrace] for 'rightBrace' " + 
      "in node of kind codeBlock")
  }
#endif
  public var leftBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftBrace)
    return CodeBlockSyntax(root: root, data: newData)
  }
  public var statements: CodeBlockItemListSyntax {
    let child = data.cachedChild(at: Cursor.statements)
    return makeSyntax(root: _root, data: child!) as! CodeBlockItemListSyntax
  }

  /// Adds the provided `CodeBlockItem` to the node's `statements`
  /// collection.
  /// - param element: The new `CodeBlockItem` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `CodeBlockItem`
  ///            appended to its `statements` collection.
  public func addCodeBlockItem(_ element: CodeBlockItemSyntax) -> CodeBlockSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.codeBlockItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.statements)
    return CodeBlockSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlockItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.statements)
    return CodeBlockSyntax(root: root, data: newData)
  }
  public var rightBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> CodeBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightBrace)
    return CodeBlockSyntax(root: root, data: newData)
  }

  /// Determines if two `CodeBlockSyntax` nodes are equal to each other.
  public static func ==(lhs: CodeBlockSyntax, rhs: CodeBlockSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct InOutExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case ampersand
    case expression
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `InOutExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _ampersand = raw[Cursor.prefixAmpersandToken]
    guard let _ampersandTokenKind = _ampersand.tokenKind else {
      fatalError("expected token child, got \(_ampersand.kind)")
    }
    precondition([.prefixAmpersand].contains(_ampersandTokenKind),
      "expected one of [.prefixAmpersand] for 'ampersand' " + 
      "in node of kind inOutExpr")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
  }
#endif
  public var ampersand: TokenSyntax {
    let child = data.cachedChild(at: Cursor.ampersand)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `ampersand` replaced.
  /// - param newChild: The new `ampersand` to replace the node's
  ///                   current `ampersand`, if present.
  public func withAmpersand(
    _ newChild: TokenSyntax?) -> InOutExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.prefixAmpersand)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.ampersand)
    return InOutExprSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> InOutExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return InOutExprSyntax(root: root, data: newData)
  }

  /// Determines if two `InOutExprSyntax` nodes are equal to each other.
  public static func ==(lhs: InOutExprSyntax, rhs: InOutExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PoundColumnExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundColumn
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PoundColumnExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _poundColumn = raw[Cursor.poundColumnToken]
    guard let _poundColumnTokenKind = _poundColumn.tokenKind else {
      fatalError("expected token child, got \(_poundColumn.kind)")
    }
    precondition([.poundColumnKeyword].contains(_poundColumnTokenKind),
      "expected one of [.poundColumnKeyword] for 'poundColumn' " + 
      "in node of kind poundColumnExpr")
  }
#endif
  public var poundColumn: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundColumn)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundColumn` replaced.
  /// - param newChild: The new `poundColumn` to replace the node's
  ///                   current `poundColumn`, if present.
  public func withPoundColumn(
    _ newChild: TokenSyntax?) -> PoundColumnExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundColumnKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundColumn)
    return PoundColumnExprSyntax(root: root, data: newData)
  }

  /// Determines if two `PoundColumnExprSyntax` nodes are equal to each other.
  public static func ==(lhs: PoundColumnExprSyntax, rhs: PoundColumnExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TryExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case tryKeyword
    case questionOrExclamationMark
    case expression
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TryExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _tryKeyword = raw[Cursor.tryToken]
    guard let _tryKeywordTokenKind = _tryKeyword.tokenKind else {
      fatalError("expected token child, got \(_tryKeyword.kind)")
    }
    precondition([.tryKeyword].contains(_tryKeywordTokenKind),
      "expected one of [.tryKeyword] for 'tryKeyword' " + 
      "in node of kind tryExpr")
    let _questionOrExclamationMark = raw[Cursor.token]
    guard let _questionOrExclamationMarkTokenKind = _questionOrExclamationMark.tokenKind else {
      fatalError("expected token child, got \(_questionOrExclamationMark.kind)")
    }
    precondition([.postfixQuestionMark, .exclamationMark].contains(_questionOrExclamationMarkTokenKind),
      "expected one of [.postfixQuestionMark, .exclamationMark] for 'questionOrExclamationMark' " + 
      "in node of kind tryExpr")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
  }
#endif
  public var tryKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.tryKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `tryKeyword` replaced.
  /// - param newChild: The new `tryKeyword` to replace the node's
  ///                   current `tryKeyword`, if present.
  public func withTryKeyword(
    _ newChild: TokenSyntax?) -> TryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.tryKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.tryKeyword)
    return TryExprSyntax(root: root, data: newData)
  }
  public var questionOrExclamationMark: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.questionOrExclamationMark)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `questionOrExclamationMark` replaced.
  /// - param newChild: The new `questionOrExclamationMark` to replace the node's
  ///                   current `questionOrExclamationMark`, if present.
  public func withQuestionOrExclamationMark(
    _ newChild: TokenSyntax?) -> TryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.postfixQuestionMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.questionOrExclamationMark)
    return TryExprSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> TryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return TryExprSyntax(root: root, data: newData)
  }

  /// Determines if two `TryExprSyntax` nodes are equal to each other.
  public static func ==(lhs: TryExprSyntax, rhs: TryExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DeclNameArgumentSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case name
    case colon
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DeclNameArgumentSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _name = raw[Cursor.token]
    precondition(_name.kind == .token,
                 "expected child of kind .token, " +
                 "got \(_name.kind)")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind declNameArgument")
  }
#endif
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return DeclNameArgumentSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DeclNameArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return DeclNameArgumentSyntax(root: root, data: newData)
  }

  /// Determines if two `DeclNameArgumentSyntax` nodes are equal to each other.
  public static func ==(lhs: DeclNameArgumentSyntax, rhs: DeclNameArgumentSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DeclNameArgumentsSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftParen
    case arguments
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DeclNameArgumentsSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind declNameArguments")
    let _arguments = raw[Cursor.declNameArgumentList]
    precondition(_arguments.kind == .declNameArgumentList,
                 "expected child of kind .declNameArgumentList, " +
                 "got \(_arguments.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind declNameArguments")
  }
#endif
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return DeclNameArgumentsSyntax(root: root, data: newData)
  }
  public var arguments: DeclNameArgumentListSyntax {
    let child = data.cachedChild(at: Cursor.arguments)
    return makeSyntax(root: _root, data: child!) as! DeclNameArgumentListSyntax
  }

  /// Adds the provided `DeclNameArgument` to the node's `arguments`
  /// collection.
  /// - param element: The new `DeclNameArgument` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `DeclNameArgument`
  ///            appended to its `arguments` collection.
  public func addDeclNameArgument(_ element: DeclNameArgumentSyntax) -> DeclNameArgumentsSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.arguments] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.declNameArgumentList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.arguments)
    return DeclNameArgumentsSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: DeclNameArgumentListSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declNameArgumentList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.arguments)
    return DeclNameArgumentsSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> DeclNameArgumentsSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return DeclNameArgumentsSyntax(root: root, data: newData)
  }

  /// Determines if two `DeclNameArgumentsSyntax` nodes are equal to each other.
  public static func ==(lhs: DeclNameArgumentsSyntax, rhs: DeclNameArgumentsSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct IdentifierExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case identifier
    case declNameArguments
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `IdentifierExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _identifier = raw[Cursor.token]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier, .selfKeyword, .capitalSelfKeyword, .dollarIdentifier].contains(_identifierTokenKind),
      "expected one of [.identifier, .selfKeyword, .capitalSelfKeyword, .dollarIdentifier] for 'identifier' " + 
      "in node of kind identifierExpr")
    let _declNameArguments = raw[Cursor.declNameArguments]
    precondition(_declNameArguments.kind == .declNameArguments,
                 "expected child of kind .declNameArguments, " +
                 "got \(_declNameArguments.kind)")
  }
#endif
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> IdentifierExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return IdentifierExprSyntax(root: root, data: newData)
  }
  public var declNameArguments: DeclNameArgumentsSyntax? {
    let child = data.cachedChild(at: Cursor.declNameArguments)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclNameArgumentsSyntax
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> IdentifierExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declNameArguments)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.declNameArguments)
    return IdentifierExprSyntax(root: root, data: newData)
  }

  /// Determines if two `IdentifierExprSyntax` nodes are equal to each other.
  public static func ==(lhs: IdentifierExprSyntax, rhs: IdentifierExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SuperRefExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case superKeyword
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SuperRefExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _superKeyword = raw[Cursor.superToken]
    guard let _superKeywordTokenKind = _superKeyword.tokenKind else {
      fatalError("expected token child, got \(_superKeyword.kind)")
    }
    precondition([.superKeyword].contains(_superKeywordTokenKind),
      "expected one of [.superKeyword] for 'superKeyword' " + 
      "in node of kind superRefExpr")
  }
#endif
  public var superKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.superKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `superKeyword` replaced.
  /// - param newChild: The new `superKeyword` to replace the node's
  ///                   current `superKeyword`, if present.
  public func withSuperKeyword(
    _ newChild: TokenSyntax?) -> SuperRefExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.superKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.superKeyword)
    return SuperRefExprSyntax(root: root, data: newData)
  }

  /// Determines if two `SuperRefExprSyntax` nodes are equal to each other.
  public static func ==(lhs: SuperRefExprSyntax, rhs: SuperRefExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct NilLiteralExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case nilKeyword
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `NilLiteralExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _nilKeyword = raw[Cursor.nilToken]
    guard let _nilKeywordTokenKind = _nilKeyword.tokenKind else {
      fatalError("expected token child, got \(_nilKeyword.kind)")
    }
    precondition([.nilKeyword].contains(_nilKeywordTokenKind),
      "expected one of [.nilKeyword] for 'nilKeyword' " + 
      "in node of kind nilLiteralExpr")
  }
#endif
  public var nilKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.nilKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `nilKeyword` replaced.
  /// - param newChild: The new `nilKeyword` to replace the node's
  ///                   current `nilKeyword`, if present.
  public func withNilKeyword(
    _ newChild: TokenSyntax?) -> NilLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.nilKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.nilKeyword)
    return NilLiteralExprSyntax(root: root, data: newData)
  }

  /// Determines if two `NilLiteralExprSyntax` nodes are equal to each other.
  public static func ==(lhs: NilLiteralExprSyntax, rhs: NilLiteralExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DiscardAssignmentExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case wildcard
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DiscardAssignmentExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _wildcard = raw[Cursor.wildcardToken]
    guard let _wildcardTokenKind = _wildcard.tokenKind else {
      fatalError("expected token child, got \(_wildcard.kind)")
    }
    precondition([.wildcardKeyword].contains(_wildcardTokenKind),
      "expected one of [.wildcardKeyword] for 'wildcard' " + 
      "in node of kind discardAssignmentExpr")
  }
#endif
  public var wildcard: TokenSyntax {
    let child = data.cachedChild(at: Cursor.wildcard)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `wildcard` replaced.
  /// - param newChild: The new `wildcard` to replace the node's
  ///                   current `wildcard`, if present.
  public func withWildcard(
    _ newChild: TokenSyntax?) -> DiscardAssignmentExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.wildcardKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.wildcard)
    return DiscardAssignmentExprSyntax(root: root, data: newData)
  }

  /// Determines if two `DiscardAssignmentExprSyntax` nodes are equal to each other.
  public static func ==(lhs: DiscardAssignmentExprSyntax, rhs: DiscardAssignmentExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AssignmentExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case assignToken
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AssignmentExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _assignToken = raw[Cursor.equalToken]
    guard let _assignTokenTokenKind = _assignToken.tokenKind else {
      fatalError("expected token child, got \(_assignToken.kind)")
    }
    precondition([.equal].contains(_assignTokenTokenKind),
      "expected one of [.equal] for 'assignToken' " + 
      "in node of kind assignmentExpr")
  }
#endif
  public var assignToken: TokenSyntax {
    let child = data.cachedChild(at: Cursor.assignToken)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `assignToken` replaced.
  /// - param newChild: The new `assignToken` to replace the node's
  ///                   current `assignToken`, if present.
  public func withAssignToken(
    _ newChild: TokenSyntax?) -> AssignmentExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.equal)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.assignToken)
    return AssignmentExprSyntax(root: root, data: newData)
  }

  /// Determines if two `AssignmentExprSyntax` nodes are equal to each other.
  public static func ==(lhs: AssignmentExprSyntax, rhs: AssignmentExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SequenceExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case elements
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SequenceExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _elements = raw[Cursor.exprList]
    precondition(_elements.kind == .exprList,
                 "expected child of kind .exprList, " +
                 "got \(_elements.kind)")
  }
#endif
  public var elements: ExprListSyntax {
    let child = data.cachedChild(at: Cursor.elements)
    return makeSyntax(root: _root, data: child!) as! ExprListSyntax
  }

  /// Adds the provided `Expression` to the node's `elements`
  /// collection.
  /// - param element: The new `Expression` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `Expression`
  ///            appended to its `elements` collection.
  public func addExpression(_ element: ExprSyntax) -> SequenceExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.elements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.exprList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.elements)
    return SequenceExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(
    _ newChild: ExprListSyntax?) -> SequenceExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.exprList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elements)
    return SequenceExprSyntax(root: root, data: newData)
  }

  /// Determines if two `SequenceExprSyntax` nodes are equal to each other.
  public static func ==(lhs: SequenceExprSyntax, rhs: SequenceExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PoundLineExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundLine
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PoundLineExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _poundLine = raw[Cursor.poundLineToken]
    guard let _poundLineTokenKind = _poundLine.tokenKind else {
      fatalError("expected token child, got \(_poundLine.kind)")
    }
    precondition([.poundLineKeyword].contains(_poundLineTokenKind),
      "expected one of [.poundLineKeyword] for 'poundLine' " + 
      "in node of kind poundLineExpr")
  }
#endif
  public var poundLine: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundLine)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundLine` replaced.
  /// - param newChild: The new `poundLine` to replace the node's
  ///                   current `poundLine`, if present.
  public func withPoundLine(
    _ newChild: TokenSyntax?) -> PoundLineExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundLineKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundLine)
    return PoundLineExprSyntax(root: root, data: newData)
  }

  /// Determines if two `PoundLineExprSyntax` nodes are equal to each other.
  public static func ==(lhs: PoundLineExprSyntax, rhs: PoundLineExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PoundFileExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundFile
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PoundFileExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _poundFile = raw[Cursor.poundFileToken]
    guard let _poundFileTokenKind = _poundFile.tokenKind else {
      fatalError("expected token child, got \(_poundFile.kind)")
    }
    precondition([.poundFileKeyword].contains(_poundFileTokenKind),
      "expected one of [.poundFileKeyword] for 'poundFile' " + 
      "in node of kind poundFileExpr")
  }
#endif
  public var poundFile: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundFile)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundFile` replaced.
  /// - param newChild: The new `poundFile` to replace the node's
  ///                   current `poundFile`, if present.
  public func withPoundFile(
    _ newChild: TokenSyntax?) -> PoundFileExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundFileKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundFile)
    return PoundFileExprSyntax(root: root, data: newData)
  }

  /// Determines if two `PoundFileExprSyntax` nodes are equal to each other.
  public static func ==(lhs: PoundFileExprSyntax, rhs: PoundFileExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PoundFunctionExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundFunction
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PoundFunctionExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _poundFunction = raw[Cursor.poundFunctionToken]
    guard let _poundFunctionTokenKind = _poundFunction.tokenKind else {
      fatalError("expected token child, got \(_poundFunction.kind)")
    }
    precondition([.poundFunctionKeyword].contains(_poundFunctionTokenKind),
      "expected one of [.poundFunctionKeyword] for 'poundFunction' " + 
      "in node of kind poundFunctionExpr")
  }
#endif
  public var poundFunction: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundFunction)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundFunction` replaced.
  /// - param newChild: The new `poundFunction` to replace the node's
  ///                   current `poundFunction`, if present.
  public func withPoundFunction(
    _ newChild: TokenSyntax?) -> PoundFunctionExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundFunctionKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundFunction)
    return PoundFunctionExprSyntax(root: root, data: newData)
  }

  /// Determines if two `PoundFunctionExprSyntax` nodes are equal to each other.
  public static func ==(lhs: PoundFunctionExprSyntax, rhs: PoundFunctionExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PoundDsohandleExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundDsohandle
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PoundDsohandleExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _poundDsohandle = raw[Cursor.poundDsohandleToken]
    guard let _poundDsohandleTokenKind = _poundDsohandle.tokenKind else {
      fatalError("expected token child, got \(_poundDsohandle.kind)")
    }
    precondition([.poundDsohandleKeyword].contains(_poundDsohandleTokenKind),
      "expected one of [.poundDsohandleKeyword] for 'poundDsohandle' " + 
      "in node of kind poundDsohandleExpr")
  }
#endif
  public var poundDsohandle: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundDsohandle)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundDsohandle` replaced.
  /// - param newChild: The new `poundDsohandle` to replace the node's
  ///                   current `poundDsohandle`, if present.
  public func withPoundDsohandle(
    _ newChild: TokenSyntax?) -> PoundDsohandleExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundDsohandleKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundDsohandle)
    return PoundDsohandleExprSyntax(root: root, data: newData)
  }

  /// Determines if two `PoundDsohandleExprSyntax` nodes are equal to each other.
  public static func ==(lhs: PoundDsohandleExprSyntax, rhs: PoundDsohandleExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SymbolicReferenceExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case identifier
    case genericArgumentClause
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SymbolicReferenceExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _identifier = raw[Cursor.identifierToken]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier].contains(_identifierTokenKind),
      "expected one of [.identifier] for 'identifier' " + 
      "in node of kind symbolicReferenceExpr")
    let _genericArgumentClause = raw[Cursor.genericArgumentClause]
    precondition(_genericArgumentClause.kind == .genericArgumentClause,
                 "expected child of kind .genericArgumentClause, " +
                 "got \(_genericArgumentClause.kind)")
  }
#endif
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> SymbolicReferenceExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return SymbolicReferenceExprSyntax(root: root, data: newData)
  }
  public var genericArgumentClause: GenericArgumentClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericArgumentClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericArgumentClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericArgumentClause` replaced.
  /// - param newChild: The new `genericArgumentClause` to replace the node's
  ///                   current `genericArgumentClause`, if present.
  public func withGenericArgumentClause(
    _ newChild: GenericArgumentClauseSyntax?) -> SymbolicReferenceExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericArgumentClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericArgumentClause)
    return SymbolicReferenceExprSyntax(root: root, data: newData)
  }

  /// Determines if two `SymbolicReferenceExprSyntax` nodes are equal to each other.
  public static func ==(lhs: SymbolicReferenceExprSyntax, rhs: SymbolicReferenceExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PrefixOperatorExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case operatorToken
    case postfixExpression
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PrefixOperatorExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _operatorToken = raw[Cursor.prefixOperatorToken]
    guard let _operatorTokenTokenKind = _operatorToken.tokenKind else {
      fatalError("expected token child, got \(_operatorToken.kind)")
    }
    precondition([.prefixOperator].contains(_operatorTokenTokenKind),
      "expected one of [.prefixOperator] for 'operatorToken' " + 
      "in node of kind prefixOperatorExpr")
    let _postfixExpression = raw[Cursor.expr]
    precondition(_postfixExpression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_postfixExpression.kind)")
  }
#endif
  public var operatorToken: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.operatorToken)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `operatorToken` replaced.
  /// - param newChild: The new `operatorToken` to replace the node's
  ///                   current `operatorToken`, if present.
  public func withOperatorToken(
    _ newChild: TokenSyntax?) -> PrefixOperatorExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.prefixOperator(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.operatorToken)
    return PrefixOperatorExprSyntax(root: root, data: newData)
  }
  public var postfixExpression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.postfixExpression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `postfixExpression` replaced.
  /// - param newChild: The new `postfixExpression` to replace the node's
  ///                   current `postfixExpression`, if present.
  public func withPostfixExpression(
    _ newChild: ExprSyntax?) -> PrefixOperatorExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.postfixExpression)
    return PrefixOperatorExprSyntax(root: root, data: newData)
  }

  /// Determines if two `PrefixOperatorExprSyntax` nodes are equal to each other.
  public static func ==(lhs: PrefixOperatorExprSyntax, rhs: PrefixOperatorExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct BinaryOperatorExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case operatorToken
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `BinaryOperatorExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _operatorToken = raw[Cursor.binaryOperatorToken]
    precondition(_operatorToken.kind == .binaryOperatorToken,
                 "expected child of kind .binaryOperatorToken, " +
                 "got \(_operatorToken.kind)")
  }
#endif
  public var operatorToken: TokenSyntax {
    let child = data.cachedChild(at: Cursor.operatorToken)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `operatorToken` replaced.
  /// - param newChild: The new `operatorToken` to replace the node's
  ///                   current `operatorToken`, if present.
  public func withOperatorToken(
    _ newChild: TokenSyntax?) -> BinaryOperatorExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.operatorToken)
    return BinaryOperatorExprSyntax(root: root, data: newData)
  }

  /// Determines if two `BinaryOperatorExprSyntax` nodes are equal to each other.
  public static func ==(lhs: BinaryOperatorExprSyntax, rhs: BinaryOperatorExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ArrowExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case throwsToken
    case arrowToken
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ArrowExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _throwsToken = raw[Cursor.throwsToken]
    guard let _throwsTokenTokenKind = _throwsToken.tokenKind else {
      fatalError("expected token child, got \(_throwsToken.kind)")
    }
    precondition([.throwsKeyword].contains(_throwsTokenTokenKind),
      "expected one of [.throwsKeyword] for 'throwsToken' " + 
      "in node of kind arrowExpr")
    let _arrowToken = raw[Cursor.arrowToken]
    guard let _arrowTokenTokenKind = _arrowToken.tokenKind else {
      fatalError("expected token child, got \(_arrowToken.kind)")
    }
    precondition([.arrow].contains(_arrowTokenTokenKind),
      "expected one of [.arrow] for 'arrowToken' " + 
      "in node of kind arrowExpr")
  }
#endif
  public var throwsToken: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.throwsToken)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `throwsToken` replaced.
  /// - param newChild: The new `throwsToken` to replace the node's
  ///                   current `throwsToken`, if present.
  public func withThrowsToken(
    _ newChild: TokenSyntax?) -> ArrowExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.throwsKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.throwsToken)
    return ArrowExprSyntax(root: root, data: newData)
  }
  public var arrowToken: TokenSyntax {
    let child = data.cachedChild(at: Cursor.arrowToken)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `arrowToken` replaced.
  /// - param newChild: The new `arrowToken` to replace the node's
  ///                   current `arrowToken`, if present.
  public func withArrowToken(
    _ newChild: TokenSyntax?) -> ArrowExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.arrow)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.arrowToken)
    return ArrowExprSyntax(root: root, data: newData)
  }

  /// Determines if two `ArrowExprSyntax` nodes are equal to each other.
  public static func ==(lhs: ArrowExprSyntax, rhs: ArrowExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct FloatLiteralExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case floatingDigits
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `FloatLiteralExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _floatingDigits = raw[Cursor.floatingLiteralToken]
    guard let _floatingDigitsTokenKind = _floatingDigits.tokenKind else {
      fatalError("expected token child, got \(_floatingDigits.kind)")
    }
    precondition([.floatingLiteral].contains(_floatingDigitsTokenKind),
      "expected one of [.floatingLiteral] for 'floatingDigits' " + 
      "in node of kind floatLiteralExpr")
  }
#endif
  public var floatingDigits: TokenSyntax {
    let child = data.cachedChild(at: Cursor.floatingDigits)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `floatingDigits` replaced.
  /// - param newChild: The new `floatingDigits` to replace the node's
  ///                   current `floatingDigits`, if present.
  public func withFloatingDigits(
    _ newChild: TokenSyntax?) -> FloatLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.floatingLiteral(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.floatingDigits)
    return FloatLiteralExprSyntax(root: root, data: newData)
  }

  /// Determines if two `FloatLiteralExprSyntax` nodes are equal to each other.
  public static func ==(lhs: FloatLiteralExprSyntax, rhs: FloatLiteralExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TupleExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftParen
    case elementList
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TupleExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind tupleExpr")
    let _elementList = raw[Cursor.tupleElementList]
    precondition(_elementList.kind == .tupleElementList,
                 "expected child of kind .tupleElementList, " +
                 "got \(_elementList.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind tupleExpr")
  }
#endif
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> TupleExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return TupleExprSyntax(root: root, data: newData)
  }
  public var elementList: TupleElementListSyntax {
    let child = data.cachedChild(at: Cursor.elementList)
    return makeSyntax(root: _root, data: child!) as! TupleElementListSyntax
  }

  /// Adds the provided `TupleElement` to the node's `elementList`
  /// collection.
  /// - param element: The new `TupleElement` to add to the node's
  ///                  `elementList` collection.
  /// - returns: A copy of the receiver with the provided `TupleElement`
  ///            appended to its `elementList` collection.
  public func addTupleElement(_ element: TupleElementSyntax) -> TupleExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.elementList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.tupleElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.elementList)
    return TupleExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `elementList` replaced.
  /// - param newChild: The new `elementList` to replace the node's
  ///                   current `elementList`, if present.
  public func withElementList(
    _ newChild: TupleElementListSyntax?) -> TupleExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.tupleElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elementList)
    return TupleExprSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> TupleExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return TupleExprSyntax(root: root, data: newData)
  }

  /// Determines if two `TupleExprSyntax` nodes are equal to each other.
  public static func ==(lhs: TupleExprSyntax, rhs: TupleExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ArrayExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftSquare
    case elements
    case rightSquare
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ArrayExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftSquare = raw[Cursor.leftSquareToken]
    precondition(_leftSquare.kind == .leftSquareToken,
                 "expected child of kind .leftSquareToken, " +
                 "got \(_leftSquare.kind)")
    let _elements = raw[Cursor.arrayElementList]
    precondition(_elements.kind == .arrayElementList,
                 "expected child of kind .arrayElementList, " +
                 "got \(_elements.kind)")
    let _rightSquare = raw[Cursor.rightSquareToken]
    precondition(_rightSquare.kind == .rightSquareToken,
                 "expected child of kind .rightSquareToken, " +
                 "got \(_rightSquare.kind)")
  }
#endif
  public var leftSquare: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftSquare)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftSquare` replaced.
  /// - param newChild: The new `leftSquare` to replace the node's
  ///                   current `leftSquare`, if present.
  public func withLeftSquare(
    _ newChild: TokenSyntax?) -> ArrayExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftSquare)
    return ArrayExprSyntax(root: root, data: newData)
  }
  public var elements: ArrayElementListSyntax {
    let child = data.cachedChild(at: Cursor.elements)
    return makeSyntax(root: _root, data: child!) as! ArrayElementListSyntax
  }

  /// Adds the provided `ArrayElement` to the node's `elements`
  /// collection.
  /// - param element: The new `ArrayElement` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `ArrayElement`
  ///            appended to its `elements` collection.
  public func addArrayElement(_ element: ArrayElementSyntax) -> ArrayExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.elements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.arrayElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.elements)
    return ArrayExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(
    _ newChild: ArrayElementListSyntax?) -> ArrayExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.arrayElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elements)
    return ArrayExprSyntax(root: root, data: newData)
  }
  public var rightSquare: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightSquare)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightSquare` replaced.
  /// - param newChild: The new `rightSquare` to replace the node's
  ///                   current `rightSquare`, if present.
  public func withRightSquare(
    _ newChild: TokenSyntax?) -> ArrayExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightSquare)
    return ArrayExprSyntax(root: root, data: newData)
  }

  /// Determines if two `ArrayExprSyntax` nodes are equal to each other.
  public static func ==(lhs: ArrayExprSyntax, rhs: ArrayExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DictionaryExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftSquare
    case content
    case rightSquare
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DictionaryExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftSquare = raw[Cursor.leftSquareToken]
    precondition(_leftSquare.kind == .leftSquareToken,
                 "expected child of kind .leftSquareToken, " +
                 "got \(_leftSquare.kind)")
    let _content = raw[Cursor.syntax]
    precondition(_content.kind == .syntax,
                 "expected child of kind .syntax, " +
                 "got \(_content.kind)")
    let _rightSquare = raw[Cursor.rightSquareToken]
    precondition(_rightSquare.kind == .rightSquareToken,
                 "expected child of kind .rightSquareToken, " +
                 "got \(_rightSquare.kind)")
  }
#endif
  public var leftSquare: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftSquare)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftSquare` replaced.
  /// - param newChild: The new `leftSquare` to replace the node's
  ///                   current `leftSquare`, if present.
  public func withLeftSquare(
    _ newChild: TokenSyntax?) -> DictionaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftSquare)
    return DictionaryExprSyntax(root: root, data: newData)
  }
  public var content: Syntax {
    let child = data.cachedChild(at: Cursor.content)
    return makeSyntax(root: _root, data: child!) 
  }

  /// Returns a copy of the receiver with its `content` replaced.
  /// - param newChild: The new `content` to replace the node's
  ///                   current `content`, if present.
  public func withContent(
    _ newChild: Syntax?) -> DictionaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.content)
    return DictionaryExprSyntax(root: root, data: newData)
  }
  public var rightSquare: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightSquare)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightSquare` replaced.
  /// - param newChild: The new `rightSquare` to replace the node's
  ///                   current `rightSquare`, if present.
  public func withRightSquare(
    _ newChild: TokenSyntax?) -> DictionaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightSquare)
    return DictionaryExprSyntax(root: root, data: newData)
  }

  /// Determines if two `DictionaryExprSyntax` nodes are equal to each other.
  public static func ==(lhs: DictionaryExprSyntax, rhs: DictionaryExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ImplicitMemberExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case dot
    case name
    case declNameArguments
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ImplicitMemberExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _dot = raw[Cursor.prefixPeriodToken]
    guard let _dotTokenKind = _dot.tokenKind else {
      fatalError("expected token child, got \(_dot.kind)")
    }
    precondition([.prefixPeriod].contains(_dotTokenKind),
      "expected one of [.prefixPeriod] for 'dot' " + 
      "in node of kind implicitMemberExpr")
    let _name = raw[Cursor.token]
    precondition(_name.kind == .token,
                 "expected child of kind .token, " +
                 "got \(_name.kind)")
    let _declNameArguments = raw[Cursor.declNameArguments]
    precondition(_declNameArguments.kind == .declNameArguments,
                 "expected child of kind .declNameArguments, " +
                 "got \(_declNameArguments.kind)")
  }
#endif
  public var dot: TokenSyntax {
    let child = data.cachedChild(at: Cursor.dot)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(
    _ newChild: TokenSyntax?) -> ImplicitMemberExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.prefixPeriod)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.dot)
    return ImplicitMemberExprSyntax(root: root, data: newData)
  }
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ImplicitMemberExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return ImplicitMemberExprSyntax(root: root, data: newData)
  }
  public var declNameArguments: DeclNameArgumentsSyntax? {
    let child = data.cachedChild(at: Cursor.declNameArguments)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclNameArgumentsSyntax
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> ImplicitMemberExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declNameArguments)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.declNameArguments)
    return ImplicitMemberExprSyntax(root: root, data: newData)
  }

  /// Determines if two `ImplicitMemberExprSyntax` nodes are equal to each other.
  public static func ==(lhs: ImplicitMemberExprSyntax, rhs: ImplicitMemberExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct FunctionCallArgumentSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case label
    case colon
    case expression
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `FunctionCallArgumentSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _label = raw[Cursor.identifierToken]
    guard let _labelTokenKind = _label.tokenKind else {
      fatalError("expected token child, got \(_label.kind)")
    }
    precondition([.identifier].contains(_labelTokenKind),
      "expected one of [.identifier] for 'label' " + 
      "in node of kind functionCallArgument")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind functionCallArgument")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind functionCallArgument")
  }
#endif
  public var label: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.label)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> FunctionCallArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.label)
    return FunctionCallArgumentSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.colon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> FunctionCallArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return FunctionCallArgumentSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> FunctionCallArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return FunctionCallArgumentSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> FunctionCallArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return FunctionCallArgumentSyntax(root: root, data: newData)
  }

  /// Determines if two `FunctionCallArgumentSyntax` nodes are equal to each other.
  public static func ==(lhs: FunctionCallArgumentSyntax, rhs: FunctionCallArgumentSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TupleElementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case label
    case colon
    case expression
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TupleElementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _label = raw[Cursor.identifierToken]
    guard let _labelTokenKind = _label.tokenKind else {
      fatalError("expected token child, got \(_label.kind)")
    }
    precondition([.identifier].contains(_labelTokenKind),
      "expected one of [.identifier] for 'label' " + 
      "in node of kind tupleElement")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind tupleElement")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind tupleElement")
  }
#endif
  public var label: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.label)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> TupleElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.label)
    return TupleElementSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.colon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TupleElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return TupleElementSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> TupleElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return TupleElementSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TupleElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return TupleElementSyntax(root: root, data: newData)
  }

  /// Determines if two `TupleElementSyntax` nodes are equal to each other.
  public static func ==(lhs: TupleElementSyntax, rhs: TupleElementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ArrayElementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case expression
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ArrayElementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind arrayElement")
  }
#endif
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return ArrayElementSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ArrayElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return ArrayElementSyntax(root: root, data: newData)
  }

  /// Determines if two `ArrayElementSyntax` nodes are equal to each other.
  public static func ==(lhs: ArrayElementSyntax, rhs: ArrayElementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DictionaryElementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case keyExpression
    case colon
    case valueExpression
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DictionaryElementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _keyExpression = raw[Cursor.expr]
    precondition(_keyExpression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_keyExpression.kind)")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind dictionaryElement")
    let _valueExpression = raw[Cursor.expr]
    precondition(_valueExpression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_valueExpression.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind dictionaryElement")
  }
#endif
  public var keyExpression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.keyExpression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `keyExpression` replaced.
  /// - param newChild: The new `keyExpression` to replace the node's
  ///                   current `keyExpression`, if present.
  public func withKeyExpression(
    _ newChild: ExprSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.keyExpression)
    return DictionaryElementSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return DictionaryElementSyntax(root: root, data: newData)
  }
  public var valueExpression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.valueExpression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `valueExpression` replaced.
  /// - param newChild: The new `valueExpression` to replace the node's
  ///                   current `valueExpression`, if present.
  public func withValueExpression(
    _ newChild: ExprSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.valueExpression)
    return DictionaryElementSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> DictionaryElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return DictionaryElementSyntax(root: root, data: newData)
  }

  /// Determines if two `DictionaryElementSyntax` nodes are equal to each other.
  public static func ==(lhs: DictionaryElementSyntax, rhs: DictionaryElementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct IntegerLiteralExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case digits
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `IntegerLiteralExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _digits = raw[Cursor.integerLiteralToken]
    guard let _digitsTokenKind = _digits.tokenKind else {
      fatalError("expected token child, got \(_digits.kind)")
    }
    precondition([.integerLiteral].contains(_digitsTokenKind),
      "expected one of [.integerLiteral] for 'digits' " + 
      "in node of kind integerLiteralExpr")
  }
#endif
  public var digits: TokenSyntax {
    let child = data.cachedChild(at: Cursor.digits)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `digits` replaced.
  /// - param newChild: The new `digits` to replace the node's
  ///                   current `digits`, if present.
  public func withDigits(
    _ newChild: TokenSyntax?) -> IntegerLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.integerLiteral(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.digits)
    return IntegerLiteralExprSyntax(root: root, data: newData)
  }

  /// Determines if two `IntegerLiteralExprSyntax` nodes are equal to each other.
  public static func ==(lhs: IntegerLiteralExprSyntax, rhs: IntegerLiteralExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct StringLiteralExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case stringLiteral
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `StringLiteralExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _stringLiteral = raw[Cursor.stringLiteralToken]
    guard let _stringLiteralTokenKind = _stringLiteral.tokenKind else {
      fatalError("expected token child, got \(_stringLiteral.kind)")
    }
    precondition([.stringLiteral].contains(_stringLiteralTokenKind),
      "expected one of [.stringLiteral] for 'stringLiteral' " + 
      "in node of kind stringLiteralExpr")
  }
#endif
  public var stringLiteral: TokenSyntax {
    let child = data.cachedChild(at: Cursor.stringLiteral)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `stringLiteral` replaced.
  /// - param newChild: The new `stringLiteral` to replace the node's
  ///                   current `stringLiteral`, if present.
  public func withStringLiteral(
    _ newChild: TokenSyntax?) -> StringLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.stringLiteral(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.stringLiteral)
    return StringLiteralExprSyntax(root: root, data: newData)
  }

  /// Determines if two `StringLiteralExprSyntax` nodes are equal to each other.
  public static func ==(lhs: StringLiteralExprSyntax, rhs: StringLiteralExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct BooleanLiteralExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case booleanLiteral
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `BooleanLiteralExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _booleanLiteral = raw[Cursor.token]
    guard let _booleanLiteralTokenKind = _booleanLiteral.tokenKind else {
      fatalError("expected token child, got \(_booleanLiteral.kind)")
    }
    precondition([.trueKeyword, .falseKeyword].contains(_booleanLiteralTokenKind),
      "expected one of [.trueKeyword, .falseKeyword] for 'booleanLiteral' " + 
      "in node of kind booleanLiteralExpr")
  }
#endif
  public var booleanLiteral: TokenSyntax {
    let child = data.cachedChild(at: Cursor.booleanLiteral)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `booleanLiteral` replaced.
  /// - param newChild: The new `booleanLiteral` to replace the node's
  ///                   current `booleanLiteral`, if present.
  public func withBooleanLiteral(
    _ newChild: TokenSyntax?) -> BooleanLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.trueKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.booleanLiteral)
    return BooleanLiteralExprSyntax(root: root, data: newData)
  }

  /// Determines if two `BooleanLiteralExprSyntax` nodes are equal to each other.
  public static func ==(lhs: BooleanLiteralExprSyntax, rhs: BooleanLiteralExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TernaryExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case conditionExpression
    case questionMark
    case firstChoice
    case colonMark
    case secondChoice
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TernaryExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _conditionExpression = raw[Cursor.expr]
    precondition(_conditionExpression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_conditionExpression.kind)")
    let _questionMark = raw[Cursor.infixQuestionMarkToken]
    guard let _questionMarkTokenKind = _questionMark.tokenKind else {
      fatalError("expected token child, got \(_questionMark.kind)")
    }
    precondition([.infixQuestionMark].contains(_questionMarkTokenKind),
      "expected one of [.infixQuestionMark] for 'questionMark' " + 
      "in node of kind ternaryExpr")
    let _firstChoice = raw[Cursor.expr]
    precondition(_firstChoice.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_firstChoice.kind)")
    let _colonMark = raw[Cursor.colonToken]
    guard let _colonMarkTokenKind = _colonMark.tokenKind else {
      fatalError("expected token child, got \(_colonMark.kind)")
    }
    precondition([.colon].contains(_colonMarkTokenKind),
      "expected one of [.colon] for 'colonMark' " + 
      "in node of kind ternaryExpr")
    let _secondChoice = raw[Cursor.expr]
    precondition(_secondChoice.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_secondChoice.kind)")
  }
#endif
  public var conditionExpression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.conditionExpression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `conditionExpression` replaced.
  /// - param newChild: The new `conditionExpression` to replace the node's
  ///                   current `conditionExpression`, if present.
  public func withConditionExpression(
    _ newChild: ExprSyntax?) -> TernaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.conditionExpression)
    return TernaryExprSyntax(root: root, data: newData)
  }
  public var questionMark: TokenSyntax {
    let child = data.cachedChild(at: Cursor.questionMark)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `questionMark` replaced.
  /// - param newChild: The new `questionMark` to replace the node's
  ///                   current `questionMark`, if present.
  public func withQuestionMark(
    _ newChild: TokenSyntax?) -> TernaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.infixQuestionMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.questionMark)
    return TernaryExprSyntax(root: root, data: newData)
  }
  public var firstChoice: ExprSyntax {
    let child = data.cachedChild(at: Cursor.firstChoice)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `firstChoice` replaced.
  /// - param newChild: The new `firstChoice` to replace the node's
  ///                   current `firstChoice`, if present.
  public func withFirstChoice(
    _ newChild: ExprSyntax?) -> TernaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.firstChoice)
    return TernaryExprSyntax(root: root, data: newData)
  }
  public var colonMark: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colonMark)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colonMark` replaced.
  /// - param newChild: The new `colonMark` to replace the node's
  ///                   current `colonMark`, if present.
  public func withColonMark(
    _ newChild: TokenSyntax?) -> TernaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colonMark)
    return TernaryExprSyntax(root: root, data: newData)
  }
  public var secondChoice: ExprSyntax {
    let child = data.cachedChild(at: Cursor.secondChoice)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `secondChoice` replaced.
  /// - param newChild: The new `secondChoice` to replace the node's
  ///                   current `secondChoice`, if present.
  public func withSecondChoice(
    _ newChild: ExprSyntax?) -> TernaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.secondChoice)
    return TernaryExprSyntax(root: root, data: newData)
  }

  /// Determines if two `TernaryExprSyntax` nodes are equal to each other.
  public static func ==(lhs: TernaryExprSyntax, rhs: TernaryExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct MemberAccessExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case base
    case dot
    case name
    case declNameArguments
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `MemberAccessExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _base = raw[Cursor.expr]
    precondition(_base.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_base.kind)")
    let _dot = raw[Cursor.periodToken]
    guard let _dotTokenKind = _dot.tokenKind else {
      fatalError("expected token child, got \(_dot.kind)")
    }
    precondition([.period].contains(_dotTokenKind),
      "expected one of [.period] for 'dot' " + 
      "in node of kind memberAccessExpr")
    let _name = raw[Cursor.token]
    precondition(_name.kind == .token,
                 "expected child of kind .token, " +
                 "got \(_name.kind)")
    let _declNameArguments = raw[Cursor.declNameArguments]
    precondition(_declNameArguments.kind == .declNameArguments,
                 "expected child of kind .declNameArguments, " +
                 "got \(_declNameArguments.kind)")
  }
#endif
  public var base: ExprSyntax {
    let child = data.cachedChild(at: Cursor.base)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `base` replaced.
  /// - param newChild: The new `base` to replace the node's
  ///                   current `base`, if present.
  public func withBase(
    _ newChild: ExprSyntax?) -> MemberAccessExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.base)
    return MemberAccessExprSyntax(root: root, data: newData)
  }
  public var dot: TokenSyntax {
    let child = data.cachedChild(at: Cursor.dot)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(
    _ newChild: TokenSyntax?) -> MemberAccessExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.period)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.dot)
    return MemberAccessExprSyntax(root: root, data: newData)
  }
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> MemberAccessExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return MemberAccessExprSyntax(root: root, data: newData)
  }
  public var declNameArguments: DeclNameArgumentsSyntax? {
    let child = data.cachedChild(at: Cursor.declNameArguments)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclNameArgumentsSyntax
  }

  /// Returns a copy of the receiver with its `declNameArguments` replaced.
  /// - param newChild: The new `declNameArguments` to replace the node's
  ///                   current `declNameArguments`, if present.
  public func withDeclNameArguments(
    _ newChild: DeclNameArgumentsSyntax?) -> MemberAccessExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declNameArguments)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.declNameArguments)
    return MemberAccessExprSyntax(root: root, data: newData)
  }

  /// Determines if two `MemberAccessExprSyntax` nodes are equal to each other.
  public static func ==(lhs: MemberAccessExprSyntax, rhs: MemberAccessExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DotSelfExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case expression
    case dot
    case selfKeyword
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DotSelfExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _dot = raw[Cursor.token]
    guard let _dotTokenKind = _dot.tokenKind else {
      fatalError("expected token child, got \(_dot.kind)")
    }
    precondition([.period, .prefixPeriod].contains(_dotTokenKind),
      "expected one of [.period, .prefixPeriod] for 'dot' " + 
      "in node of kind dotSelfExpr")
    let _selfKeyword = raw[Cursor.selfToken]
    guard let _selfKeywordTokenKind = _selfKeyword.tokenKind else {
      fatalError("expected token child, got \(_selfKeyword.kind)")
    }
    precondition([.selfKeyword].contains(_selfKeywordTokenKind),
      "expected one of [.selfKeyword] for 'selfKeyword' " + 
      "in node of kind dotSelfExpr")
  }
#endif
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> DotSelfExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return DotSelfExprSyntax(root: root, data: newData)
  }
  public var dot: TokenSyntax {
    let child = data.cachedChild(at: Cursor.dot)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(
    _ newChild: TokenSyntax?) -> DotSelfExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.period)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.dot)
    return DotSelfExprSyntax(root: root, data: newData)
  }
  public var selfKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.selfKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `selfKeyword` replaced.
  /// - param newChild: The new `selfKeyword` to replace the node's
  ///                   current `selfKeyword`, if present.
  public func withSelfKeyword(
    _ newChild: TokenSyntax?) -> DotSelfExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.selfKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.selfKeyword)
    return DotSelfExprSyntax(root: root, data: newData)
  }

  /// Determines if two `DotSelfExprSyntax` nodes are equal to each other.
  public static func ==(lhs: DotSelfExprSyntax, rhs: DotSelfExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct IsExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case isTok
    case typeName
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `IsExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _isTok = raw[Cursor.isToken]
    guard let _isTokTokenKind = _isTok.tokenKind else {
      fatalError("expected token child, got \(_isTok.kind)")
    }
    precondition([.isKeyword].contains(_isTokTokenKind),
      "expected one of [.isKeyword] for 'isTok' " + 
      "in node of kind isExpr")
    let _typeName = raw[Cursor.type]
    precondition(_typeName.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_typeName.kind)")
  }
#endif
  public var isTok: TokenSyntax {
    let child = data.cachedChild(at: Cursor.isTok)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `isTok` replaced.
  /// - param newChild: The new `isTok` to replace the node's
  ///                   current `isTok`, if present.
  public func withIsTok(
    _ newChild: TokenSyntax?) -> IsExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.isKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.isTok)
    return IsExprSyntax(root: root, data: newData)
  }
  public var typeName: TypeSyntax {
    let child = data.cachedChild(at: Cursor.typeName)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `typeName` replaced.
  /// - param newChild: The new `typeName` to replace the node's
  ///                   current `typeName`, if present.
  public func withTypeName(
    _ newChild: TypeSyntax?) -> IsExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeName)
    return IsExprSyntax(root: root, data: newData)
  }

  /// Determines if two `IsExprSyntax` nodes are equal to each other.
  public static func ==(lhs: IsExprSyntax, rhs: IsExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AsExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case asTok
    case questionOrExclamationMark
    case typeName
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AsExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _asTok = raw[Cursor.asToken]
    guard let _asTokTokenKind = _asTok.tokenKind else {
      fatalError("expected token child, got \(_asTok.kind)")
    }
    precondition([.asKeyword].contains(_asTokTokenKind),
      "expected one of [.asKeyword] for 'asTok' " + 
      "in node of kind asExpr")
    let _questionOrExclamationMark = raw[Cursor.token]
    guard let _questionOrExclamationMarkTokenKind = _questionOrExclamationMark.tokenKind else {
      fatalError("expected token child, got \(_questionOrExclamationMark.kind)")
    }
    precondition([.postfixQuestionMark, .exclamationMark].contains(_questionOrExclamationMarkTokenKind),
      "expected one of [.postfixQuestionMark, .exclamationMark] for 'questionOrExclamationMark' " + 
      "in node of kind asExpr")
    let _typeName = raw[Cursor.type]
    precondition(_typeName.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_typeName.kind)")
  }
#endif
  public var asTok: TokenSyntax {
    let child = data.cachedChild(at: Cursor.asTok)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `asTok` replaced.
  /// - param newChild: The new `asTok` to replace the node's
  ///                   current `asTok`, if present.
  public func withAsTok(
    _ newChild: TokenSyntax?) -> AsExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.asKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.asTok)
    return AsExprSyntax(root: root, data: newData)
  }
  public var questionOrExclamationMark: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.questionOrExclamationMark)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `questionOrExclamationMark` replaced.
  /// - param newChild: The new `questionOrExclamationMark` to replace the node's
  ///                   current `questionOrExclamationMark`, if present.
  public func withQuestionOrExclamationMark(
    _ newChild: TokenSyntax?) -> AsExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.postfixQuestionMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.questionOrExclamationMark)
    return AsExprSyntax(root: root, data: newData)
  }
  public var typeName: TypeSyntax {
    let child = data.cachedChild(at: Cursor.typeName)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `typeName` replaced.
  /// - param newChild: The new `typeName` to replace the node's
  ///                   current `typeName`, if present.
  public func withTypeName(
    _ newChild: TypeSyntax?) -> AsExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeName)
    return AsExprSyntax(root: root, data: newData)
  }

  /// Determines if two `AsExprSyntax` nodes are equal to each other.
  public static func ==(lhs: AsExprSyntax, rhs: AsExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TypeExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case type
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TypeExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _type = raw[Cursor.type]
    precondition(_type.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_type.kind)")
  }
#endif
  public var type: TypeSyntax {
    let child = data.cachedChild(at: Cursor.type)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> TypeExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.type)
    return TypeExprSyntax(root: root, data: newData)
  }

  /// Determines if two `TypeExprSyntax` nodes are equal to each other.
  public static func ==(lhs: TypeExprSyntax, rhs: TypeExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ClosureCaptureItemSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case specifier
    case name
    case assignToken
    case expression
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ClosureCaptureItemSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _specifier = raw[Cursor.tokenList]
    precondition(_specifier.kind == .tokenList,
                 "expected child of kind .tokenList, " +
                 "got \(_specifier.kind)")
    let _name = raw[Cursor.identifierToken]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier].contains(_nameTokenKind),
      "expected one of [.identifier] for 'name' " + 
      "in node of kind closureCaptureItem")
    let _assignToken = raw[Cursor.equalToken]
    guard let _assignTokenTokenKind = _assignToken.tokenKind else {
      fatalError("expected token child, got \(_assignToken.kind)")
    }
    precondition([.equal].contains(_assignTokenTokenKind),
      "expected one of [.equal] for 'assignToken' " + 
      "in node of kind closureCaptureItem")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind closureCaptureItem")
  }
#endif
  public var specifier: TokenListSyntax? {
    let child = data.cachedChild(at: Cursor.specifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenListSyntax
  }

  /// Adds the provided `Token` to the node's `specifier`
  /// collection.
  /// - param element: The new `Token` to add to the node's
  ///                  `specifier` collection.
  /// - returns: A copy of the receiver with the provided `Token`
  ///            appended to its `specifier` collection.
  public func addToken(_ element: TokenSyntax) -> ClosureCaptureItemSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.specifier] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.tokenList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.specifier)
    return ClosureCaptureItemSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `specifier` replaced.
  /// - param newChild: The new `specifier` to replace the node's
  ///                   current `specifier`, if present.
  public func withSpecifier(
    _ newChild: TokenListSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.specifier)
    return ClosureCaptureItemSyntax(root: root, data: newData)
  }
  public var name: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.name)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return ClosureCaptureItemSyntax(root: root, data: newData)
  }
  public var assignToken: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.assignToken)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `assignToken` replaced.
  /// - param newChild: The new `assignToken` to replace the node's
  ///                   current `assignToken`, if present.
  public func withAssignToken(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.equal)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.assignToken)
    return ClosureCaptureItemSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return ClosureCaptureItemSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return ClosureCaptureItemSyntax(root: root, data: newData)
  }

  /// Determines if two `ClosureCaptureItemSyntax` nodes are equal to each other.
  public static func ==(lhs: ClosureCaptureItemSyntax, rhs: ClosureCaptureItemSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ClosureCaptureSignatureSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftSquare
    case items
    case rightSquare
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ClosureCaptureSignatureSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftSquare = raw[Cursor.leftSquareToken]
    precondition(_leftSquare.kind == .leftSquareToken,
                 "expected child of kind .leftSquareToken, " +
                 "got \(_leftSquare.kind)")
    let _items = raw[Cursor.closureCaptureItemList]
    precondition(_items.kind == .closureCaptureItemList,
                 "expected child of kind .closureCaptureItemList, " +
                 "got \(_items.kind)")
    let _rightSquare = raw[Cursor.rightSquareToken]
    precondition(_rightSquare.kind == .rightSquareToken,
                 "expected child of kind .rightSquareToken, " +
                 "got \(_rightSquare.kind)")
  }
#endif
  public var leftSquare: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftSquare)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftSquare` replaced.
  /// - param newChild: The new `leftSquare` to replace the node's
  ///                   current `leftSquare`, if present.
  public func withLeftSquare(
    _ newChild: TokenSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftSquare)
    return ClosureCaptureSignatureSyntax(root: root, data: newData)
  }
  public var items: ClosureCaptureItemListSyntax? {
    let child = data.cachedChild(at: Cursor.items)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ClosureCaptureItemListSyntax
  }

  /// Adds the provided `ClosureCaptureItem` to the node's `items`
  /// collection.
  /// - param element: The new `ClosureCaptureItem` to add to the node's
  ///                  `items` collection.
  /// - returns: A copy of the receiver with the provided `ClosureCaptureItem`
  ///            appended to its `items` collection.
  public func addClosureCaptureItem(_ element: ClosureCaptureItemSyntax) -> ClosureCaptureSignatureSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.items] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.closureCaptureItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.items)
    return ClosureCaptureSignatureSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `items` replaced.
  /// - param newChild: The new `items` to replace the node's
  ///                   current `items`, if present.
  public func withItems(
    _ newChild: ClosureCaptureItemListSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.closureCaptureItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.items)
    return ClosureCaptureSignatureSyntax(root: root, data: newData)
  }
  public var rightSquare: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightSquare)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightSquare` replaced.
  /// - param newChild: The new `rightSquare` to replace the node's
  ///                   current `rightSquare`, if present.
  public func withRightSquare(
    _ newChild: TokenSyntax?) -> ClosureCaptureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightSquare)
    return ClosureCaptureSignatureSyntax(root: root, data: newData)
  }

  /// Determines if two `ClosureCaptureSignatureSyntax` nodes are equal to each other.
  public static func ==(lhs: ClosureCaptureSignatureSyntax, rhs: ClosureCaptureSignatureSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ClosureParamSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case name
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ClosureParamSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _name = raw[Cursor.token]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier, .wildcardKeyword].contains(_nameTokenKind),
      "expected one of [.identifier, .wildcardKeyword] for 'name' " + 
      "in node of kind closureParam")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind closureParam")
  }
#endif
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return ClosureParamSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ClosureParamSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return ClosureParamSyntax(root: root, data: newData)
  }

  /// Determines if two `ClosureParamSyntax` nodes are equal to each other.
  public static func ==(lhs: ClosureParamSyntax, rhs: ClosureParamSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ClosureSignatureSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case capture
    case input
    case throwsTok
    case output
    case inTok
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ClosureSignatureSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _capture = raw[Cursor.closureCaptureSignature]
    precondition(_capture.kind == .closureCaptureSignature,
                 "expected child of kind .closureCaptureSignature, " +
                 "got \(_capture.kind)")
    let _input = raw[Cursor.syntax]
    precondition(_input.kind == .syntax,
                 "expected child of kind .syntax, " +
                 "got \(_input.kind)")
    let _throwsTok = raw[Cursor.throwsToken]
    guard let _throwsTokTokenKind = _throwsTok.tokenKind else {
      fatalError("expected token child, got \(_throwsTok.kind)")
    }
    precondition([.throwsKeyword].contains(_throwsTokTokenKind),
      "expected one of [.throwsKeyword] for 'throwsTok' " + 
      "in node of kind closureSignature")
    let _output = raw[Cursor.returnClause]
    precondition(_output.kind == .returnClause,
                 "expected child of kind .returnClause, " +
                 "got \(_output.kind)")
    let _inTok = raw[Cursor.inToken]
    guard let _inTokTokenKind = _inTok.tokenKind else {
      fatalError("expected token child, got \(_inTok.kind)")
    }
    precondition([.inKeyword].contains(_inTokTokenKind),
      "expected one of [.inKeyword] for 'inTok' " + 
      "in node of kind closureSignature")
  }
#endif
  public var capture: ClosureCaptureSignatureSyntax? {
    let child = data.cachedChild(at: Cursor.capture)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ClosureCaptureSignatureSyntax
  }

  /// Returns a copy of the receiver with its `capture` replaced.
  /// - param newChild: The new `capture` to replace the node's
  ///                   current `capture`, if present.
  public func withCapture(
    _ newChild: ClosureCaptureSignatureSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.closureCaptureSignature)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.capture)
    return ClosureSignatureSyntax(root: root, data: newData)
  }
  public var input: Syntax? {
    let child = data.cachedChild(at: Cursor.input)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) 
  }

  /// Returns a copy of the receiver with its `input` replaced.
  /// - param newChild: The new `input` to replace the node's
  ///                   current `input`, if present.
  public func withInput(
    _ newChild: Syntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.input)
    return ClosureSignatureSyntax(root: root, data: newData)
  }
  public var throwsTok: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.throwsTok)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `throwsTok` replaced.
  /// - param newChild: The new `throwsTok` to replace the node's
  ///                   current `throwsTok`, if present.
  public func withThrowsTok(
    _ newChild: TokenSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.throwsKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.throwsTok)
    return ClosureSignatureSyntax(root: root, data: newData)
  }
  public var output: ReturnClauseSyntax? {
    let child = data.cachedChild(at: Cursor.output)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ReturnClauseSyntax
  }

  /// Returns a copy of the receiver with its `output` replaced.
  /// - param newChild: The new `output` to replace the node's
  ///                   current `output`, if present.
  public func withOutput(
    _ newChild: ReturnClauseSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.returnClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.output)
    return ClosureSignatureSyntax(root: root, data: newData)
  }
  public var inTok: TokenSyntax {
    let child = data.cachedChild(at: Cursor.inTok)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `inTok` replaced.
  /// - param newChild: The new `inTok` to replace the node's
  ///                   current `inTok`, if present.
  public func withInTok(
    _ newChild: TokenSyntax?) -> ClosureSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.inKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inTok)
    return ClosureSignatureSyntax(root: root, data: newData)
  }

  /// Determines if two `ClosureSignatureSyntax` nodes are equal to each other.
  public static func ==(lhs: ClosureSignatureSyntax, rhs: ClosureSignatureSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ClosureExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftBrace
    case signature
    case statements
    case rightBrace
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ClosureExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _leftBrace = raw[Cursor.leftBraceToken]
    guard let _leftBraceTokenKind = _leftBrace.tokenKind else {
      fatalError("expected token child, got \(_leftBrace.kind)")
    }
    precondition([.leftBrace].contains(_leftBraceTokenKind),
      "expected one of [.leftBrace] for 'leftBrace' " + 
      "in node of kind closureExpr")
    let _signature = raw[Cursor.closureSignature]
    precondition(_signature.kind == .closureSignature,
                 "expected child of kind .closureSignature, " +
                 "got \(_signature.kind)")
    let _statements = raw[Cursor.codeBlockItemList]
    precondition(_statements.kind == .codeBlockItemList,
                 "expected child of kind .codeBlockItemList, " +
                 "got \(_statements.kind)")
    let _rightBrace = raw[Cursor.rightBraceToken]
    guard let _rightBraceTokenKind = _rightBrace.tokenKind else {
      fatalError("expected token child, got \(_rightBrace.kind)")
    }
    precondition([.rightBrace].contains(_rightBraceTokenKind),
      "expected one of [.rightBrace] for 'rightBrace' " + 
      "in node of kind closureExpr")
  }
#endif
  public var leftBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> ClosureExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftBrace)
    return ClosureExprSyntax(root: root, data: newData)
  }
  public var signature: ClosureSignatureSyntax? {
    let child = data.cachedChild(at: Cursor.signature)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ClosureSignatureSyntax
  }

  /// Returns a copy of the receiver with its `signature` replaced.
  /// - param newChild: The new `signature` to replace the node's
  ///                   current `signature`, if present.
  public func withSignature(
    _ newChild: ClosureSignatureSyntax?) -> ClosureExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.closureSignature)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.signature)
    return ClosureExprSyntax(root: root, data: newData)
  }
  public var statements: CodeBlockItemListSyntax {
    let child = data.cachedChild(at: Cursor.statements)
    return makeSyntax(root: _root, data: child!) as! CodeBlockItemListSyntax
  }

  /// Adds the provided `CodeBlockItem` to the node's `statements`
  /// collection.
  /// - param element: The new `CodeBlockItem` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `CodeBlockItem`
  ///            appended to its `statements` collection.
  public func addCodeBlockItem(_ element: CodeBlockItemSyntax) -> ClosureExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.codeBlockItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.statements)
    return ClosureExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> ClosureExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlockItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.statements)
    return ClosureExprSyntax(root: root, data: newData)
  }
  public var rightBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> ClosureExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightBrace)
    return ClosureExprSyntax(root: root, data: newData)
  }

  /// Determines if two `ClosureExprSyntax` nodes are equal to each other.
  public static func ==(lhs: ClosureExprSyntax, rhs: ClosureExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct UnresolvedPatternExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case pattern
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `UnresolvedPatternExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
  }
#endif
  public var pattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.pattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> UnresolvedPatternExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return UnresolvedPatternExprSyntax(root: root, data: newData)
  }

  /// Determines if two `UnresolvedPatternExprSyntax` nodes are equal to each other.
  public static func ==(lhs: UnresolvedPatternExprSyntax, rhs: UnresolvedPatternExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct FunctionCallExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case calledExpression
    case leftParen
    case argumentList
    case rightParen
    case trailingClosure
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `FunctionCallExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _calledExpression = raw[Cursor.expr]
    precondition(_calledExpression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_calledExpression.kind)")
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind functionCallExpr")
    let _argumentList = raw[Cursor.functionCallArgumentList]
    precondition(_argumentList.kind == .functionCallArgumentList,
                 "expected child of kind .functionCallArgumentList, " +
                 "got \(_argumentList.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind functionCallExpr")
    let _trailingClosure = raw[Cursor.closureExpr]
    precondition(_trailingClosure.kind == .closureExpr,
                 "expected child of kind .closureExpr, " +
                 "got \(_trailingClosure.kind)")
  }
#endif
  public var calledExpression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.calledExpression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `calledExpression` replaced.
  /// - param newChild: The new `calledExpression` to replace the node's
  ///                   current `calledExpression`, if present.
  public func withCalledExpression(
    _ newChild: ExprSyntax?) -> FunctionCallExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.calledExpression)
    return FunctionCallExprSyntax(root: root, data: newData)
  }
  public var leftParen: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.leftParen)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> FunctionCallExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return FunctionCallExprSyntax(root: root, data: newData)
  }
  public var argumentList: FunctionCallArgumentListSyntax {
    let child = data.cachedChild(at: Cursor.argumentList)
    return makeSyntax(root: _root, data: child!) as! FunctionCallArgumentListSyntax
  }

  /// Adds the provided `FunctionCallArgument` to the node's `argumentList`
  /// collection.
  /// - param element: The new `FunctionCallArgument` to add to the node's
  ///                  `argumentList` collection.
  /// - returns: A copy of the receiver with the provided `FunctionCallArgument`
  ///            appended to its `argumentList` collection.
  public func addFunctionCallArgument(_ element: FunctionCallArgumentSyntax) -> FunctionCallExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.argumentList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.functionCallArgumentList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.argumentList)
    return FunctionCallExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `argumentList` replaced.
  /// - param newChild: The new `argumentList` to replace the node's
  ///                   current `argumentList`, if present.
  public func withArgumentList(
    _ newChild: FunctionCallArgumentListSyntax?) -> FunctionCallExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.functionCallArgumentList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.argumentList)
    return FunctionCallExprSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.rightParen)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> FunctionCallExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return FunctionCallExprSyntax(root: root, data: newData)
  }
  public var trailingClosure: ClosureExprSyntax? {
    let child = data.cachedChild(at: Cursor.trailingClosure)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ClosureExprSyntax
  }

  /// Returns a copy of the receiver with its `trailingClosure` replaced.
  /// - param newChild: The new `trailingClosure` to replace the node's
  ///                   current `trailingClosure`, if present.
  public func withTrailingClosure(
    _ newChild: ClosureExprSyntax?) -> FunctionCallExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.closureExpr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingClosure)
    return FunctionCallExprSyntax(root: root, data: newData)
  }

  /// Determines if two `FunctionCallExprSyntax` nodes are equal to each other.
  public static func ==(lhs: FunctionCallExprSyntax, rhs: FunctionCallExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SubscriptExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case calledExpression
    case leftBracket
    case argumentList
    case rightBracket
    case trailingClosure
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SubscriptExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _calledExpression = raw[Cursor.expr]
    precondition(_calledExpression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_calledExpression.kind)")
    let _leftBracket = raw[Cursor.leftSquareBracketToken]
    guard let _leftBracketTokenKind = _leftBracket.tokenKind else {
      fatalError("expected token child, got \(_leftBracket.kind)")
    }
    precondition([.leftSquareBracket].contains(_leftBracketTokenKind),
      "expected one of [.leftSquareBracket] for 'leftBracket' " + 
      "in node of kind subscriptExpr")
    let _argumentList = raw[Cursor.functionCallArgumentList]
    precondition(_argumentList.kind == .functionCallArgumentList,
                 "expected child of kind .functionCallArgumentList, " +
                 "got \(_argumentList.kind)")
    let _rightBracket = raw[Cursor.rightSquareBracketToken]
    guard let _rightBracketTokenKind = _rightBracket.tokenKind else {
      fatalError("expected token child, got \(_rightBracket.kind)")
    }
    precondition([.rightSquareBracket].contains(_rightBracketTokenKind),
      "expected one of [.rightSquareBracket] for 'rightBracket' " + 
      "in node of kind subscriptExpr")
    let _trailingClosure = raw[Cursor.closureExpr]
    precondition(_trailingClosure.kind == .closureExpr,
                 "expected child of kind .closureExpr, " +
                 "got \(_trailingClosure.kind)")
  }
#endif
  public var calledExpression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.calledExpression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `calledExpression` replaced.
  /// - param newChild: The new `calledExpression` to replace the node's
  ///                   current `calledExpression`, if present.
  public func withCalledExpression(
    _ newChild: ExprSyntax?) -> SubscriptExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.calledExpression)
    return SubscriptExprSyntax(root: root, data: newData)
  }
  public var leftBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftBracket` replaced.
  /// - param newChild: The new `leftBracket` to replace the node's
  ///                   current `leftBracket`, if present.
  public func withLeftBracket(
    _ newChild: TokenSyntax?) -> SubscriptExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftSquareBracket)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftBracket)
    return SubscriptExprSyntax(root: root, data: newData)
  }
  public var argumentList: FunctionCallArgumentListSyntax {
    let child = data.cachedChild(at: Cursor.argumentList)
    return makeSyntax(root: _root, data: child!) as! FunctionCallArgumentListSyntax
  }

  /// Adds the provided `FunctionCallArgument` to the node's `argumentList`
  /// collection.
  /// - param element: The new `FunctionCallArgument` to add to the node's
  ///                  `argumentList` collection.
  /// - returns: A copy of the receiver with the provided `FunctionCallArgument`
  ///            appended to its `argumentList` collection.
  public func addFunctionCallArgument(_ element: FunctionCallArgumentSyntax) -> SubscriptExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.argumentList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.functionCallArgumentList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.argumentList)
    return SubscriptExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `argumentList` replaced.
  /// - param newChild: The new `argumentList` to replace the node's
  ///                   current `argumentList`, if present.
  public func withArgumentList(
    _ newChild: FunctionCallArgumentListSyntax?) -> SubscriptExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.functionCallArgumentList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.argumentList)
    return SubscriptExprSyntax(root: root, data: newData)
  }
  public var rightBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightBracket` replaced.
  /// - param newChild: The new `rightBracket` to replace the node's
  ///                   current `rightBracket`, if present.
  public func withRightBracket(
    _ newChild: TokenSyntax?) -> SubscriptExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightSquareBracket)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightBracket)
    return SubscriptExprSyntax(root: root, data: newData)
  }
  public var trailingClosure: ClosureExprSyntax? {
    let child = data.cachedChild(at: Cursor.trailingClosure)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ClosureExprSyntax
  }

  /// Returns a copy of the receiver with its `trailingClosure` replaced.
  /// - param newChild: The new `trailingClosure` to replace the node's
  ///                   current `trailingClosure`, if present.
  public func withTrailingClosure(
    _ newChild: ClosureExprSyntax?) -> SubscriptExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.closureExpr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingClosure)
    return SubscriptExprSyntax(root: root, data: newData)
  }

  /// Determines if two `SubscriptExprSyntax` nodes are equal to each other.
  public static func ==(lhs: SubscriptExprSyntax, rhs: SubscriptExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct OptionalChainingExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case expression
    case quetionMark
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `OptionalChainingExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _quetionMark = raw[Cursor.postfixQuestionMarkToken]
    guard let _quetionMarkTokenKind = _quetionMark.tokenKind else {
      fatalError("expected token child, got \(_quetionMark.kind)")
    }
    precondition([.postfixQuestionMark].contains(_quetionMarkTokenKind),
      "expected one of [.postfixQuestionMark] for 'quetionMark' " + 
      "in node of kind optionalChainingExpr")
  }
#endif
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> OptionalChainingExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return OptionalChainingExprSyntax(root: root, data: newData)
  }
  public var quetionMark: TokenSyntax {
    let child = data.cachedChild(at: Cursor.quetionMark)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `quetionMark` replaced.
  /// - param newChild: The new `quetionMark` to replace the node's
  ///                   current `quetionMark`, if present.
  public func withQuetionMark(
    _ newChild: TokenSyntax?) -> OptionalChainingExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.postfixQuestionMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.quetionMark)
    return OptionalChainingExprSyntax(root: root, data: newData)
  }

  /// Determines if two `OptionalChainingExprSyntax` nodes are equal to each other.
  public static func ==(lhs: OptionalChainingExprSyntax, rhs: OptionalChainingExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ForcedValueExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case expression
    case exclamationMark
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ForcedValueExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _exclamationMark = raw[Cursor.exclamationMarkToken]
    guard let _exclamationMarkTokenKind = _exclamationMark.tokenKind else {
      fatalError("expected token child, got \(_exclamationMark.kind)")
    }
    precondition([.exclamationMark].contains(_exclamationMarkTokenKind),
      "expected one of [.exclamationMark] for 'exclamationMark' " + 
      "in node of kind forcedValueExpr")
  }
#endif
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ForcedValueExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return ForcedValueExprSyntax(root: root, data: newData)
  }
  public var exclamationMark: TokenSyntax {
    let child = data.cachedChild(at: Cursor.exclamationMark)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `exclamationMark` replaced.
  /// - param newChild: The new `exclamationMark` to replace the node's
  ///                   current `exclamationMark`, if present.
  public func withExclamationMark(
    _ newChild: TokenSyntax?) -> ForcedValueExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.exclamationMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.exclamationMark)
    return ForcedValueExprSyntax(root: root, data: newData)
  }

  /// Determines if two `ForcedValueExprSyntax` nodes are equal to each other.
  public static func ==(lhs: ForcedValueExprSyntax, rhs: ForcedValueExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PostfixUnaryExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case expression
    case operatorToken
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PostfixUnaryExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _operatorToken = raw[Cursor.postfixOperatorToken]
    guard let _operatorTokenTokenKind = _operatorToken.tokenKind else {
      fatalError("expected token child, got \(_operatorToken.kind)")
    }
    precondition([.postfixOperator].contains(_operatorTokenTokenKind),
      "expected one of [.postfixOperator] for 'operatorToken' " + 
      "in node of kind postfixUnaryExpr")
  }
#endif
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> PostfixUnaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return PostfixUnaryExprSyntax(root: root, data: newData)
  }
  public var operatorToken: TokenSyntax {
    let child = data.cachedChild(at: Cursor.operatorToken)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `operatorToken` replaced.
  /// - param newChild: The new `operatorToken` to replace the node's
  ///                   current `operatorToken`, if present.
  public func withOperatorToken(
    _ newChild: TokenSyntax?) -> PostfixUnaryExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.postfixOperator(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.operatorToken)
    return PostfixUnaryExprSyntax(root: root, data: newData)
  }

  /// Determines if two `PostfixUnaryExprSyntax` nodes are equal to each other.
  public static func ==(lhs: PostfixUnaryExprSyntax, rhs: PostfixUnaryExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SpecializeExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case expression
    case genericArgumentClause
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SpecializeExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _genericArgumentClause = raw[Cursor.genericArgumentClause]
    precondition(_genericArgumentClause.kind == .genericArgumentClause,
                 "expected child of kind .genericArgumentClause, " +
                 "got \(_genericArgumentClause.kind)")
  }
#endif
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> SpecializeExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return SpecializeExprSyntax(root: root, data: newData)
  }
  public var genericArgumentClause: GenericArgumentClauseSyntax {
    let child = data.cachedChild(at: Cursor.genericArgumentClause)
    return makeSyntax(root: _root, data: child!) as! GenericArgumentClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericArgumentClause` replaced.
  /// - param newChild: The new `genericArgumentClause` to replace the node's
  ///                   current `genericArgumentClause`, if present.
  public func withGenericArgumentClause(
    _ newChild: GenericArgumentClauseSyntax?) -> SpecializeExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericArgumentClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericArgumentClause)
    return SpecializeExprSyntax(root: root, data: newData)
  }

  /// Determines if two `SpecializeExprSyntax` nodes are equal to each other.
  public static func ==(lhs: SpecializeExprSyntax, rhs: SpecializeExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct StringSegmentSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case content
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `StringSegmentSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _content = raw[Cursor.stringSegmentToken]
    guard let _contentTokenKind = _content.tokenKind else {
      fatalError("expected token child, got \(_content.kind)")
    }
    precondition([.stringSegment].contains(_contentTokenKind),
      "expected one of [.stringSegment] for 'content' " + 
      "in node of kind stringSegment")
  }
#endif
  public var content: TokenSyntax {
    let child = data.cachedChild(at: Cursor.content)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `content` replaced.
  /// - param newChild: The new `content` to replace the node's
  ///                   current `content`, if present.
  public func withContent(
    _ newChild: TokenSyntax?) -> StringSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.stringSegment(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.content)
    return StringSegmentSyntax(root: root, data: newData)
  }

  /// Determines if two `StringSegmentSyntax` nodes are equal to each other.
  public static func ==(lhs: StringSegmentSyntax, rhs: StringSegmentSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ExpressionSegmentSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case backslash
    case leftParen
    case expression
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ExpressionSegmentSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _backslash = raw[Cursor.backslashToken]
    guard let _backslashTokenKind = _backslash.tokenKind else {
      fatalError("expected token child, got \(_backslash.kind)")
    }
    precondition([.backslash].contains(_backslashTokenKind),
      "expected one of [.backslash] for 'backslash' " + 
      "in node of kind expressionSegment")
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind expressionSegment")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _rightParen = raw[Cursor.stringInterpolationAnchorToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.stringInterpolationAnchor].contains(_rightParenTokenKind),
      "expected one of [.stringInterpolationAnchor] for 'rightParen' " + 
      "in node of kind expressionSegment")
  }
#endif
  public var backslash: TokenSyntax {
    let child = data.cachedChild(at: Cursor.backslash)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `backslash` replaced.
  /// - param newChild: The new `backslash` to replace the node's
  ///                   current `backslash`, if present.
  public func withBackslash(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.backslash)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.backslash)
    return ExpressionSegmentSyntax(root: root, data: newData)
  }
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return ExpressionSegmentSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return ExpressionSegmentSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> ExpressionSegmentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.stringInterpolationAnchor)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return ExpressionSegmentSyntax(root: root, data: newData)
  }

  /// Determines if two `ExpressionSegmentSyntax` nodes are equal to each other.
  public static func ==(lhs: ExpressionSegmentSyntax, rhs: ExpressionSegmentSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct StringInterpolationExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case openQuote
    case segments
    case closeQuote
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `StringInterpolationExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _openQuote = raw[Cursor.token]
    guard let _openQuoteTokenKind = _openQuote.tokenKind else {
      fatalError("expected token child, got \(_openQuote.kind)")
    }
    precondition([.stringQuote, .multilineStringQuote].contains(_openQuoteTokenKind),
      "expected one of [.stringQuote, .multilineStringQuote] for 'openQuote' " + 
      "in node of kind stringInterpolationExpr")
    let _segments = raw[Cursor.stringInterpolationSegments]
    precondition(_segments.kind == .stringInterpolationSegments,
                 "expected child of kind .stringInterpolationSegments, " +
                 "got \(_segments.kind)")
    let _closeQuote = raw[Cursor.token]
    guard let _closeQuoteTokenKind = _closeQuote.tokenKind else {
      fatalError("expected token child, got \(_closeQuote.kind)")
    }
    precondition([.stringQuote, .multilineStringQuote].contains(_closeQuoteTokenKind),
      "expected one of [.stringQuote, .multilineStringQuote] for 'closeQuote' " + 
      "in node of kind stringInterpolationExpr")
  }
#endif
  public var openQuote: TokenSyntax {
    let child = data.cachedChild(at: Cursor.openQuote)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `openQuote` replaced.
  /// - param newChild: The new `openQuote` to replace the node's
  ///                   current `openQuote`, if present.
  public func withOpenQuote(
    _ newChild: TokenSyntax?) -> StringInterpolationExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.stringQuote)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.openQuote)
    return StringInterpolationExprSyntax(root: root, data: newData)
  }
  public var segments: StringInterpolationSegmentsSyntax {
    let child = data.cachedChild(at: Cursor.segments)
    return makeSyntax(root: _root, data: child!) as! StringInterpolationSegmentsSyntax
  }

  /// Adds the provided `Segment` to the node's `segments`
  /// collection.
  /// - param element: The new `Segment` to add to the node's
  ///                  `segments` collection.
  /// - returns: A copy of the receiver with the provided `Segment`
  ///            appended to its `segments` collection.
  public func addSegment(_ element: Syntax) -> StringInterpolationExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.segments] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.stringInterpolationSegments,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.segments)
    return StringInterpolationExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `segments` replaced.
  /// - param newChild: The new `segments` to replace the node's
  ///                   current `segments`, if present.
  public func withSegments(
    _ newChild: StringInterpolationSegmentsSyntax?) -> StringInterpolationExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.stringInterpolationSegments)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.segments)
    return StringInterpolationExprSyntax(root: root, data: newData)
  }
  public var closeQuote: TokenSyntax {
    let child = data.cachedChild(at: Cursor.closeQuote)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `closeQuote` replaced.
  /// - param newChild: The new `closeQuote` to replace the node's
  ///                   current `closeQuote`, if present.
  public func withCloseQuote(
    _ newChild: TokenSyntax?) -> StringInterpolationExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.stringQuote)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.closeQuote)
    return StringInterpolationExprSyntax(root: root, data: newData)
  }

  /// Determines if two `StringInterpolationExprSyntax` nodes are equal to each other.
  public static func ==(lhs: StringInterpolationExprSyntax, rhs: StringInterpolationExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct KeyPathExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case backslash
    case expression
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `KeyPathExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _backslash = raw[Cursor.backslashToken]
    guard let _backslashTokenKind = _backslash.tokenKind else {
      fatalError("expected token child, got \(_backslash.kind)")
    }
    precondition([.backslash].contains(_backslashTokenKind),
      "expected one of [.backslash] for 'backslash' " + 
      "in node of kind keyPathExpr")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
  }
#endif
  public var backslash: TokenSyntax {
    let child = data.cachedChild(at: Cursor.backslash)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `backslash` replaced.
  /// - param newChild: The new `backslash` to replace the node's
  ///                   current `backslash`, if present.
  public func withBackslash(
    _ newChild: TokenSyntax?) -> KeyPathExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.backslash)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.backslash)
    return KeyPathExprSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> KeyPathExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return KeyPathExprSyntax(root: root, data: newData)
  }

  /// Determines if two `KeyPathExprSyntax` nodes are equal to each other.
  public static func ==(lhs: KeyPathExprSyntax, rhs: KeyPathExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ObjcNamePieceSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case name
    case dot
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ObjcNamePieceSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _name = raw[Cursor.identifierToken]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier].contains(_nameTokenKind),
      "expected one of [.identifier] for 'name' " + 
      "in node of kind objcNamePiece")
    let _dot = raw[Cursor.periodToken]
    guard let _dotTokenKind = _dot.tokenKind else {
      fatalError("expected token child, got \(_dot.kind)")
    }
    precondition([.period].contains(_dotTokenKind),
      "expected one of [.period] for 'dot' " + 
      "in node of kind objcNamePiece")
  }
#endif
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return ObjcNamePieceSyntax(root: root, data: newData)
  }
  public var dot: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.dot)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `dot` replaced.
  /// - param newChild: The new `dot` to replace the node's
  ///                   current `dot`, if present.
  public func withDot(
    _ newChild: TokenSyntax?) -> ObjcNamePieceSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.period)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.dot)
    return ObjcNamePieceSyntax(root: root, data: newData)
  }

  /// Determines if two `ObjcNamePieceSyntax` nodes are equal to each other.
  public static func ==(lhs: ObjcNamePieceSyntax, rhs: ObjcNamePieceSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ObjcKeyPathExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case keyPath
    case leftParen
    case name
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ObjcKeyPathExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _keyPath = raw[Cursor.poundKeyPathToken]
    guard let _keyPathTokenKind = _keyPath.tokenKind else {
      fatalError("expected token child, got \(_keyPath.kind)")
    }
    precondition([.poundKeyPathKeyword].contains(_keyPathTokenKind),
      "expected one of [.poundKeyPathKeyword] for 'keyPath' " + 
      "in node of kind objcKeyPathExpr")
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind objcKeyPathExpr")
    let _name = raw[Cursor.objcName]
    precondition(_name.kind == .objcName,
                 "expected child of kind .objcName, " +
                 "got \(_name.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind objcKeyPathExpr")
  }
#endif
  public var keyPath: TokenSyntax {
    let child = data.cachedChild(at: Cursor.keyPath)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `keyPath` replaced.
  /// - param newChild: The new `keyPath` to replace the node's
  ///                   current `keyPath`, if present.
  public func withKeyPath(
    _ newChild: TokenSyntax?) -> ObjcKeyPathExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundKeyPathKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.keyPath)
    return ObjcKeyPathExprSyntax(root: root, data: newData)
  }
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> ObjcKeyPathExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return ObjcKeyPathExprSyntax(root: root, data: newData)
  }
  public var name: ObjcNameSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! ObjcNameSyntax
  }

  /// Adds the provided `ObjcNamePiece` to the node's `name`
  /// collection.
  /// - param element: The new `ObjcNamePiece` to add to the node's
  ///                  `name` collection.
  /// - returns: A copy of the receiver with the provided `ObjcNamePiece`
  ///            appended to its `name` collection.
  public func addObjcNamePiece(_ element: ObjcNamePieceSyntax) -> ObjcKeyPathExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.name] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.objcName,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.name)
    return ObjcKeyPathExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: ObjcNameSyntax?) -> ObjcKeyPathExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.objcName)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return ObjcKeyPathExprSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> ObjcKeyPathExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return ObjcKeyPathExprSyntax(root: root, data: newData)
  }

  /// Determines if two `ObjcKeyPathExprSyntax` nodes are equal to each other.
  public static func ==(lhs: ObjcKeyPathExprSyntax, rhs: ObjcKeyPathExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct EditorPlaceholderExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case identifier
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `EditorPlaceholderExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _identifier = raw[Cursor.identifierToken]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier].contains(_identifierTokenKind),
      "expected one of [.identifier] for 'identifier' " + 
      "in node of kind editorPlaceholderExpr")
  }
#endif
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> EditorPlaceholderExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return EditorPlaceholderExprSyntax(root: root, data: newData)
  }

  /// Determines if two `EditorPlaceholderExprSyntax` nodes are equal to each other.
  public static func ==(lhs: EditorPlaceholderExprSyntax, rhs: EditorPlaceholderExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ObjectLiteralExprSyntax: ExprSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case identifier
    case leftParen
    case arguments
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ObjectLiteralExprSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _identifier = raw[Cursor.token]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.poundColorLiteralKeyword, .poundFileLiteralKeyword, .poundImageLiteralKeyword].contains(_identifierTokenKind),
      "expected one of [.poundColorLiteralKeyword, .poundFileLiteralKeyword, .poundImageLiteralKeyword] for 'identifier' " + 
      "in node of kind objectLiteralExpr")
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind objectLiteralExpr")
    let _arguments = raw[Cursor.functionCallArgumentList]
    precondition(_arguments.kind == .functionCallArgumentList,
                 "expected child of kind .functionCallArgumentList, " +
                 "got \(_arguments.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind objectLiteralExpr")
  }
#endif
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> ObjectLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundColorLiteralKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return ObjectLiteralExprSyntax(root: root, data: newData)
  }
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> ObjectLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return ObjectLiteralExprSyntax(root: root, data: newData)
  }
  public var arguments: FunctionCallArgumentListSyntax {
    let child = data.cachedChild(at: Cursor.arguments)
    return makeSyntax(root: _root, data: child!) as! FunctionCallArgumentListSyntax
  }

  /// Adds the provided `FunctionCallArgument` to the node's `arguments`
  /// collection.
  /// - param element: The new `FunctionCallArgument` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `FunctionCallArgument`
  ///            appended to its `arguments` collection.
  public func addFunctionCallArgument(_ element: FunctionCallArgumentSyntax) -> ObjectLiteralExprSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.arguments] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.functionCallArgumentList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.arguments)
    return ObjectLiteralExprSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: FunctionCallArgumentListSyntax?) -> ObjectLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.functionCallArgumentList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.arguments)
    return ObjectLiteralExprSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> ObjectLiteralExprSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return ObjectLiteralExprSyntax(root: root, data: newData)
  }

  /// Determines if two `ObjectLiteralExprSyntax` nodes are equal to each other.
  public static func ==(lhs: ObjectLiteralExprSyntax, rhs: ObjectLiteralExprSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TypeInitializerClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case equal
    case value
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TypeInitializerClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _equal = raw[Cursor.equalToken]
    guard let _equalTokenKind = _equal.tokenKind else {
      fatalError("expected token child, got \(_equal.kind)")
    }
    precondition([.equal].contains(_equalTokenKind),
      "expected one of [.equal] for 'equal' " + 
      "in node of kind typeInitializerClause")
    let _value = raw[Cursor.type]
    precondition(_value.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_value.kind)")
  }
#endif
  public var equal: TokenSyntax {
    let child = data.cachedChild(at: Cursor.equal)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `equal` replaced.
  /// - param newChild: The new `equal` to replace the node's
  ///                   current `equal`, if present.
  public func withEqual(
    _ newChild: TokenSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.equal)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.equal)
    return TypeInitializerClauseSyntax(root: root, data: newData)
  }
  public var value: TypeSyntax {
    let child = data.cachedChild(at: Cursor.value)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: TypeSyntax?) -> TypeInitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.value)
    return TypeInitializerClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `TypeInitializerClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: TypeInitializerClauseSyntax, rhs: TypeInitializerClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TypealiasDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case accessLevelModifier
    case typealiasKeyword
    case identifier
    case genericParameterClause
    case initializer
    case genericWhereClause
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TypealiasDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 7)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _accessLevelModifier = raw[Cursor.declModifier]
    precondition(_accessLevelModifier.kind == .declModifier,
                 "expected child of kind .declModifier, " +
                 "got \(_accessLevelModifier.kind)")
    let _typealiasKeyword = raw[Cursor.typealiasToken]
    guard let _typealiasKeywordTokenKind = _typealiasKeyword.tokenKind else {
      fatalError("expected token child, got \(_typealiasKeyword.kind)")
    }
    precondition([.typealiasKeyword].contains(_typealiasKeywordTokenKind),
      "expected one of [.typealiasKeyword] for 'typealiasKeyword' " + 
      "in node of kind typealiasDecl")
    let _identifier = raw[Cursor.identifierToken]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier].contains(_identifierTokenKind),
      "expected one of [.identifier] for 'identifier' " + 
      "in node of kind typealiasDecl")
    let _genericParameterClause = raw[Cursor.genericParameterClause]
    precondition(_genericParameterClause.kind == .genericParameterClause,
                 "expected child of kind .genericParameterClause, " +
                 "got \(_genericParameterClause.kind)")
    let _initializer = raw[Cursor.typeInitializerClause]
    precondition(_initializer.kind == .typeInitializerClause,
                 "expected child of kind .typeInitializerClause, " +
                 "got \(_initializer.kind)")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> TypealiasDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return TypealiasDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> TypealiasDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return TypealiasDeclSyntax(root: root, data: newData)
  }
  public var accessLevelModifier: DeclModifierSyntax? {
    let child = data.cachedChild(at: Cursor.accessLevelModifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclModifierSyntax
  }

  /// Returns a copy of the receiver with its `accessLevelModifier` replaced.
  /// - param newChild: The new `accessLevelModifier` to replace the node's
  ///                   current `accessLevelModifier`, if present.
  public func withAccessLevelModifier(
    _ newChild: DeclModifierSyntax?) -> TypealiasDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declModifier)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessLevelModifier)
    return TypealiasDeclSyntax(root: root, data: newData)
  }
  public var typealiasKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.typealiasKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `typealiasKeyword` replaced.
  /// - param newChild: The new `typealiasKeyword` to replace the node's
  ///                   current `typealiasKeyword`, if present.
  public func withTypealiasKeyword(
    _ newChild: TokenSyntax?) -> TypealiasDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.typealiasKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typealiasKeyword)
    return TypealiasDeclSyntax(root: root, data: newData)
  }
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> TypealiasDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return TypealiasDeclSyntax(root: root, data: newData)
  }
  public var genericParameterClause: GenericParameterClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericParameterClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericParameterClause` replaced.
  /// - param newChild: The new `genericParameterClause` to replace the node's
  ///                   current `genericParameterClause`, if present.
  public func withGenericParameterClause(
    _ newChild: GenericParameterClauseSyntax?) -> TypealiasDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericParameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericParameterClause)
    return TypealiasDeclSyntax(root: root, data: newData)
  }
  public var initializer: TypeInitializerClauseSyntax? {
    let child = data.cachedChild(at: Cursor.initializer)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeInitializerClauseSyntax
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: TypeInitializerClauseSyntax?) -> TypealiasDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeInitializerClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.initializer)
    return TypealiasDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> TypealiasDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return TypealiasDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `TypealiasDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: TypealiasDeclSyntax, rhs: TypealiasDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AssociatedtypeDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case accessLevelModifier
    case associatedtypeKeyword
    case identifier
    case inheritanceClause
    case initializer
    case genericWhereClause
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AssociatedtypeDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 7)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _accessLevelModifier = raw[Cursor.declModifier]
    precondition(_accessLevelModifier.kind == .declModifier,
                 "expected child of kind .declModifier, " +
                 "got \(_accessLevelModifier.kind)")
    let _associatedtypeKeyword = raw[Cursor.associatedtypeToken]
    guard let _associatedtypeKeywordTokenKind = _associatedtypeKeyword.tokenKind else {
      fatalError("expected token child, got \(_associatedtypeKeyword.kind)")
    }
    precondition([.associatedtypeKeyword].contains(_associatedtypeKeywordTokenKind),
      "expected one of [.associatedtypeKeyword] for 'associatedtypeKeyword' " + 
      "in node of kind associatedtypeDecl")
    let _identifier = raw[Cursor.identifierToken]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier].contains(_identifierTokenKind),
      "expected one of [.identifier] for 'identifier' " + 
      "in node of kind associatedtypeDecl")
    let _inheritanceClause = raw[Cursor.typeInheritanceClause]
    precondition(_inheritanceClause.kind == .typeInheritanceClause,
                 "expected child of kind .typeInheritanceClause, " +
                 "got \(_inheritanceClause.kind)")
    let _initializer = raw[Cursor.typeInitializerClause]
    precondition(_initializer.kind == .typeInitializerClause,
                 "expected child of kind .typeInitializerClause, " +
                 "got \(_initializer.kind)")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> AssociatedtypeDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return AssociatedtypeDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> AssociatedtypeDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return AssociatedtypeDeclSyntax(root: root, data: newData)
  }
  public var accessLevelModifier: DeclModifierSyntax? {
    let child = data.cachedChild(at: Cursor.accessLevelModifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclModifierSyntax
  }

  /// Returns a copy of the receiver with its `accessLevelModifier` replaced.
  /// - param newChild: The new `accessLevelModifier` to replace the node's
  ///                   current `accessLevelModifier`, if present.
  public func withAccessLevelModifier(
    _ newChild: DeclModifierSyntax?) -> AssociatedtypeDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declModifier)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessLevelModifier)
    return AssociatedtypeDeclSyntax(root: root, data: newData)
  }
  public var associatedtypeKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.associatedtypeKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `associatedtypeKeyword` replaced.
  /// - param newChild: The new `associatedtypeKeyword` to replace the node's
  ///                   current `associatedtypeKeyword`, if present.
  public func withAssociatedtypeKeyword(
    _ newChild: TokenSyntax?) -> AssociatedtypeDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.associatedtypeKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.associatedtypeKeyword)
    return AssociatedtypeDeclSyntax(root: root, data: newData)
  }
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> AssociatedtypeDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return AssociatedtypeDeclSyntax(root: root, data: newData)
  }
  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    let child = data.cachedChild(at: Cursor.inheritanceClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeInheritanceClauseSyntax
  }

  /// Returns a copy of the receiver with its `inheritanceClause` replaced.
  /// - param newChild: The new `inheritanceClause` to replace the node's
  ///                   current `inheritanceClause`, if present.
  public func withInheritanceClause(
    _ newChild: TypeInheritanceClauseSyntax?) -> AssociatedtypeDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeInheritanceClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inheritanceClause)
    return AssociatedtypeDeclSyntax(root: root, data: newData)
  }
  public var initializer: TypeInitializerClauseSyntax? {
    let child = data.cachedChild(at: Cursor.initializer)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeInitializerClauseSyntax
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: TypeInitializerClauseSyntax?) -> AssociatedtypeDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeInitializerClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.initializer)
    return AssociatedtypeDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> AssociatedtypeDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return AssociatedtypeDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `AssociatedtypeDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: AssociatedtypeDeclSyntax, rhs: AssociatedtypeDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ParameterClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftParen
    case parameterList
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ParameterClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind parameterClause")
    let _parameterList = raw[Cursor.functionParameterList]
    precondition(_parameterList.kind == .functionParameterList,
                 "expected child of kind .functionParameterList, " +
                 "got \(_parameterList.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind parameterClause")
  }
#endif
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return ParameterClauseSyntax(root: root, data: newData)
  }
  public var parameterList: FunctionParameterListSyntax {
    let child = data.cachedChild(at: Cursor.parameterList)
    return makeSyntax(root: _root, data: child!) as! FunctionParameterListSyntax
  }

  /// Adds the provided `FunctionParameter` to the node's `parameterList`
  /// collection.
  /// - param element: The new `FunctionParameter` to add to the node's
  ///                  `parameterList` collection.
  /// - returns: A copy of the receiver with the provided `FunctionParameter`
  ///            appended to its `parameterList` collection.
  public func addFunctionParameter(_ element: FunctionParameterSyntax) -> ParameterClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.parameterList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.functionParameterList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.parameterList)
    return ParameterClauseSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `parameterList` replaced.
  /// - param newChild: The new `parameterList` to replace the node's
  ///                   current `parameterList`, if present.
  public func withParameterList(
    _ newChild: FunctionParameterListSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.functionParameterList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.parameterList)
    return ParameterClauseSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> ParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return ParameterClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `ParameterClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: ParameterClauseSyntax, rhs: ParameterClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ReturnClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case arrow
    case returnType
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ReturnClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _arrow = raw[Cursor.arrowToken]
    guard let _arrowTokenKind = _arrow.tokenKind else {
      fatalError("expected token child, got \(_arrow.kind)")
    }
    precondition([.arrow].contains(_arrowTokenKind),
      "expected one of [.arrow] for 'arrow' " + 
      "in node of kind returnClause")
    let _returnType = raw[Cursor.type]
    precondition(_returnType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_returnType.kind)")
  }
#endif
  public var arrow: TokenSyntax {
    let child = data.cachedChild(at: Cursor.arrow)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `arrow` replaced.
  /// - param newChild: The new `arrow` to replace the node's
  ///                   current `arrow`, if present.
  public func withArrow(
    _ newChild: TokenSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.arrow)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.arrow)
    return ReturnClauseSyntax(root: root, data: newData)
  }
  public var returnType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.returnType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `returnType` replaced.
  /// - param newChild: The new `returnType` to replace the node's
  ///                   current `returnType`, if present.
  public func withReturnType(
    _ newChild: TypeSyntax?) -> ReturnClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.returnType)
    return ReturnClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `ReturnClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: ReturnClauseSyntax, rhs: ReturnClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct FunctionSignatureSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case input
    case throwsOrRethrowsKeyword
    case output
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `FunctionSignatureSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _input = raw[Cursor.parameterClause]
    precondition(_input.kind == .parameterClause,
                 "expected child of kind .parameterClause, " +
                 "got \(_input.kind)")
    let _throwsOrRethrowsKeyword = raw[Cursor.token]
    guard let _throwsOrRethrowsKeywordTokenKind = _throwsOrRethrowsKeyword.tokenKind else {
      fatalError("expected token child, got \(_throwsOrRethrowsKeyword.kind)")
    }
    precondition([.throwsKeyword, .rethrowsKeyword].contains(_throwsOrRethrowsKeywordTokenKind),
      "expected one of [.throwsKeyword, .rethrowsKeyword] for 'throwsOrRethrowsKeyword' " + 
      "in node of kind functionSignature")
    let _output = raw[Cursor.returnClause]
    precondition(_output.kind == .returnClause,
                 "expected child of kind .returnClause, " +
                 "got \(_output.kind)")
  }
#endif
  public var input: ParameterClauseSyntax {
    let child = data.cachedChild(at: Cursor.input)
    return makeSyntax(root: _root, data: child!) as! ParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `input` replaced.
  /// - param newChild: The new `input` to replace the node's
  ///                   current `input`, if present.
  public func withInput(
    _ newChild: ParameterClauseSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.parameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.input)
    return FunctionSignatureSyntax(root: root, data: newData)
  }
  public var throwsOrRethrowsKeyword: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.throwsOrRethrowsKeyword)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `throwsOrRethrowsKeyword` replaced.
  /// - param newChild: The new `throwsOrRethrowsKeyword` to replace the node's
  ///                   current `throwsOrRethrowsKeyword`, if present.
  public func withThrowsOrRethrowsKeyword(
    _ newChild: TokenSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.throwsKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.throwsOrRethrowsKeyword)
    return FunctionSignatureSyntax(root: root, data: newData)
  }
  public var output: ReturnClauseSyntax? {
    let child = data.cachedChild(at: Cursor.output)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ReturnClauseSyntax
  }

  /// Returns a copy of the receiver with its `output` replaced.
  /// - param newChild: The new `output` to replace the node's
  ///                   current `output`, if present.
  public func withOutput(
    _ newChild: ReturnClauseSyntax?) -> FunctionSignatureSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.returnClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.output)
    return FunctionSignatureSyntax(root: root, data: newData)
  }

  /// Determines if two `FunctionSignatureSyntax` nodes are equal to each other.
  public static func ==(lhs: FunctionSignatureSyntax, rhs: FunctionSignatureSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ElseifDirectiveClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundElseif
    case condition
    case statements
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ElseifDirectiveClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _poundElseif = raw[Cursor.poundElseifToken]
    guard let _poundElseifTokenKind = _poundElseif.tokenKind else {
      fatalError("expected token child, got \(_poundElseif.kind)")
    }
    precondition([.poundElseifKeyword].contains(_poundElseifTokenKind),
      "expected one of [.poundElseifKeyword] for 'poundElseif' " + 
      "in node of kind elseifDirectiveClause")
    let _condition = raw[Cursor.expr]
    precondition(_condition.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_condition.kind)")
    let _statements = raw[Cursor.codeBlockItemList]
    precondition(_statements.kind == .codeBlockItemList,
                 "expected child of kind .codeBlockItemList, " +
                 "got \(_statements.kind)")
  }
#endif
  public var poundElseif: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundElseif)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundElseif` replaced.
  /// - param newChild: The new `poundElseif` to replace the node's
  ///                   current `poundElseif`, if present.
  public func withPoundElseif(
    _ newChild: TokenSyntax?) -> ElseifDirectiveClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundElseifKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundElseif)
    return ElseifDirectiveClauseSyntax(root: root, data: newData)
  }
  public var condition: ExprSyntax {
    let child = data.cachedChild(at: Cursor.condition)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `condition` replaced.
  /// - param newChild: The new `condition` to replace the node's
  ///                   current `condition`, if present.
  public func withCondition(
    _ newChild: ExprSyntax?) -> ElseifDirectiveClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.condition)
    return ElseifDirectiveClauseSyntax(root: root, data: newData)
  }
  public var statements: CodeBlockItemListSyntax {
    let child = data.cachedChild(at: Cursor.statements)
    return makeSyntax(root: _root, data: child!) as! CodeBlockItemListSyntax
  }

  /// Adds the provided `CodeBlockItem` to the node's `statements`
  /// collection.
  /// - param element: The new `CodeBlockItem` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `CodeBlockItem`
  ///            appended to its `statements` collection.
  public func addCodeBlockItem(_ element: CodeBlockItemSyntax) -> ElseifDirectiveClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.codeBlockItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.statements)
    return ElseifDirectiveClauseSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> ElseifDirectiveClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlockItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.statements)
    return ElseifDirectiveClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `ElseifDirectiveClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: ElseifDirectiveClauseSyntax, rhs: ElseifDirectiveClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct IfConfigDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundIf
    case condition
    case statements
    case elseifDirectiveClauses
    case elseClause
    case poundEndif
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `IfConfigDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 6)
    let _poundIf = raw[Cursor.poundIfToken]
    guard let _poundIfTokenKind = _poundIf.tokenKind else {
      fatalError("expected token child, got \(_poundIf.kind)")
    }
    precondition([.poundIfKeyword].contains(_poundIfTokenKind),
      "expected one of [.poundIfKeyword] for 'poundIf' " + 
      "in node of kind ifConfigDecl")
    let _condition = raw[Cursor.expr]
    precondition(_condition.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_condition.kind)")
    let _statements = raw[Cursor.codeBlockItemList]
    precondition(_statements.kind == .codeBlockItemList,
                 "expected child of kind .codeBlockItemList, " +
                 "got \(_statements.kind)")
    let _elseifDirectiveClauses = raw[Cursor.elseifDirectiveClauseList]
    precondition(_elseifDirectiveClauses.kind == .elseifDirectiveClauseList,
                 "expected child of kind .elseifDirectiveClauseList, " +
                 "got \(_elseifDirectiveClauses.kind)")
    let _elseClause = raw[Cursor.elseDirectiveClause]
    precondition(_elseClause.kind == .elseDirectiveClause,
                 "expected child of kind .elseDirectiveClause, " +
                 "got \(_elseClause.kind)")
    let _poundEndif = raw[Cursor.poundEndifToken]
    guard let _poundEndifTokenKind = _poundEndif.tokenKind else {
      fatalError("expected token child, got \(_poundEndif.kind)")
    }
    precondition([.poundEndifKeyword].contains(_poundEndifTokenKind),
      "expected one of [.poundEndifKeyword] for 'poundEndif' " + 
      "in node of kind ifConfigDecl")
  }
#endif
  public var poundIf: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundIf)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundIf` replaced.
  /// - param newChild: The new `poundIf` to replace the node's
  ///                   current `poundIf`, if present.
  public func withPoundIf(
    _ newChild: TokenSyntax?) -> IfConfigDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundIfKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundIf)
    return IfConfigDeclSyntax(root: root, data: newData)
  }
  public var condition: ExprSyntax {
    let child = data.cachedChild(at: Cursor.condition)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `condition` replaced.
  /// - param newChild: The new `condition` to replace the node's
  ///                   current `condition`, if present.
  public func withCondition(
    _ newChild: ExprSyntax?) -> IfConfigDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.condition)
    return IfConfigDeclSyntax(root: root, data: newData)
  }
  public var statements: CodeBlockItemListSyntax {
    let child = data.cachedChild(at: Cursor.statements)
    return makeSyntax(root: _root, data: child!) as! CodeBlockItemListSyntax
  }

  /// Adds the provided `CodeBlockItem` to the node's `statements`
  /// collection.
  /// - param element: The new `CodeBlockItem` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `CodeBlockItem`
  ///            appended to its `statements` collection.
  public func addCodeBlockItem(_ element: CodeBlockItemSyntax) -> IfConfigDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.codeBlockItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.statements)
    return IfConfigDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> IfConfigDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlockItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.statements)
    return IfConfigDeclSyntax(root: root, data: newData)
  }
  public var elseifDirectiveClauses: ElseifDirectiveClauseListSyntax? {
    let child = data.cachedChild(at: Cursor.elseifDirectiveClauses)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ElseifDirectiveClauseListSyntax
  }

  /// Adds the provided `ElseifDirectiveClause` to the node's `elseifDirectiveClauses`
  /// collection.
  /// - param element: The new `ElseifDirectiveClause` to add to the node's
  ///                  `elseifDirectiveClauses` collection.
  /// - returns: A copy of the receiver with the provided `ElseifDirectiveClause`
  ///            appended to its `elseifDirectiveClauses` collection.
  public func addElseifDirectiveClause(_ element: ElseifDirectiveClauseSyntax) -> IfConfigDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.elseifDirectiveClauses] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.elseifDirectiveClauseList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.elseifDirectiveClauses)
    return IfConfigDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `elseifDirectiveClauses` replaced.
  /// - param newChild: The new `elseifDirectiveClauses` to replace the node's
  ///                   current `elseifDirectiveClauses`, if present.
  public func withElseifDirectiveClauses(
    _ newChild: ElseifDirectiveClauseListSyntax?) -> IfConfigDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.elseifDirectiveClauseList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elseifDirectiveClauses)
    return IfConfigDeclSyntax(root: root, data: newData)
  }
  public var elseClause: ElseDirectiveClauseSyntax? {
    let child = data.cachedChild(at: Cursor.elseClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ElseDirectiveClauseSyntax
  }

  /// Returns a copy of the receiver with its `elseClause` replaced.
  /// - param newChild: The new `elseClause` to replace the node's
  ///                   current `elseClause`, if present.
  public func withElseClause(
    _ newChild: ElseDirectiveClauseSyntax?) -> IfConfigDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.elseDirectiveClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elseClause)
    return IfConfigDeclSyntax(root: root, data: newData)
  }
  public var poundEndif: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundEndif)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundEndif` replaced.
  /// - param newChild: The new `poundEndif` to replace the node's
  ///                   current `poundEndif`, if present.
  public func withPoundEndif(
    _ newChild: TokenSyntax?) -> IfConfigDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundEndifKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundEndif)
    return IfConfigDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `IfConfigDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: IfConfigDeclSyntax, rhs: IfConfigDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PoundErrorDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundError
    case leftParen
    case message
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PoundErrorDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _poundError = raw[Cursor.poundErrorToken]
    precondition(_poundError.kind == .poundErrorToken,
                 "expected child of kind .poundErrorToken, " +
                 "got \(_poundError.kind)")
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind poundErrorDecl")
    let _message = raw[Cursor.stringLiteralExpr]
    precondition(_message.kind == .stringLiteralExpr,
                 "expected child of kind .stringLiteralExpr, " +
                 "got \(_message.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind poundErrorDecl")
  }
#endif
  public var poundError: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundError)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundError` replaced.
  /// - param newChild: The new `poundError` to replace the node's
  ///                   current `poundError`, if present.
  public func withPoundError(
    _ newChild: TokenSyntax?) -> PoundErrorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundError)
    return PoundErrorDeclSyntax(root: root, data: newData)
  }
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> PoundErrorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return PoundErrorDeclSyntax(root: root, data: newData)
  }
  public var message: StringLiteralExprSyntax {
    let child = data.cachedChild(at: Cursor.message)
    return makeSyntax(root: _root, data: child!) as! StringLiteralExprSyntax
  }

  /// Returns a copy of the receiver with its `message` replaced.
  /// - param newChild: The new `message` to replace the node's
  ///                   current `message`, if present.
  public func withMessage(
    _ newChild: StringLiteralExprSyntax?) -> PoundErrorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.stringLiteralExpr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.message)
    return PoundErrorDeclSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> PoundErrorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return PoundErrorDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `PoundErrorDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: PoundErrorDeclSyntax, rhs: PoundErrorDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PoundWarningDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundWarning
    case leftParen
    case message
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PoundWarningDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _poundWarning = raw[Cursor.poundWarningToken]
    precondition(_poundWarning.kind == .poundWarningToken,
                 "expected child of kind .poundWarningToken, " +
                 "got \(_poundWarning.kind)")
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind poundWarningDecl")
    let _message = raw[Cursor.stringLiteralExpr]
    precondition(_message.kind == .stringLiteralExpr,
                 "expected child of kind .stringLiteralExpr, " +
                 "got \(_message.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind poundWarningDecl")
  }
#endif
  public var poundWarning: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundWarning)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundWarning` replaced.
  /// - param newChild: The new `poundWarning` to replace the node's
  ///                   current `poundWarning`, if present.
  public func withPoundWarning(
    _ newChild: TokenSyntax?) -> PoundWarningDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundWarning)
    return PoundWarningDeclSyntax(root: root, data: newData)
  }
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> PoundWarningDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return PoundWarningDeclSyntax(root: root, data: newData)
  }
  public var message: StringLiteralExprSyntax {
    let child = data.cachedChild(at: Cursor.message)
    return makeSyntax(root: _root, data: child!) as! StringLiteralExprSyntax
  }

  /// Returns a copy of the receiver with its `message` replaced.
  /// - param newChild: The new `message` to replace the node's
  ///                   current `message`, if present.
  public func withMessage(
    _ newChild: StringLiteralExprSyntax?) -> PoundWarningDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.stringLiteralExpr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.message)
    return PoundWarningDeclSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> PoundWarningDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return PoundWarningDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `PoundWarningDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: PoundWarningDeclSyntax, rhs: PoundWarningDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DeclModifierSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case name
    case detail
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DeclModifierSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _name = raw[Cursor.token]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition(["class", "convenience", "dynamic", "final", "infix", "lazy", "optional", "override", "postfix", "prefix", "required", "static", "unowned", "weak", "private", "fileprivate", "internal", "public", "open", "mutating", "nonmutating"].contains(_nameTokenKind.text),
                 "expected one of '[class, convenience, dynamic, final, infix, lazy, optional, override, postfix, prefix, required, static, unowned, weak, private, fileprivate, internal, public, open, mutating, nonmutating]', got " +
                 "'\(_nameTokenKind.text)'")
    let _detail = raw[Cursor.tokenList]
    precondition(_detail.kind == .tokenList,
                 "expected child of kind .tokenList, " +
                 "got \(_detail.kind)")
  }
#endif
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return DeclModifierSyntax(root: root, data: newData)
  }
  public var detail: TokenListSyntax? {
    let child = data.cachedChild(at: Cursor.detail)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenListSyntax
  }

  /// Adds the provided `Token` to the node's `detail`
  /// collection.
  /// - param element: The new `Token` to add to the node's
  ///                  `detail` collection.
  /// - returns: A copy of the receiver with the provided `Token`
  ///            appended to its `detail` collection.
  public func addToken(_ element: TokenSyntax) -> DeclModifierSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.detail] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.tokenList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.detail)
    return DeclModifierSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `detail` replaced.
  /// - param newChild: The new `detail` to replace the node's
  ///                   current `detail`, if present.
  public func withDetail(
    _ newChild: TokenListSyntax?) -> DeclModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.detail)
    return DeclModifierSyntax(root: root, data: newData)
  }

  /// Determines if two `DeclModifierSyntax` nodes are equal to each other.
  public static func ==(lhs: DeclModifierSyntax, rhs: DeclModifierSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct InheritedTypeSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case typeName
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `InheritedTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _typeName = raw[Cursor.type]
    precondition(_typeName.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_typeName.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind inheritedType")
  }
#endif
  public var typeName: TypeSyntax {
    let child = data.cachedChild(at: Cursor.typeName)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `typeName` replaced.
  /// - param newChild: The new `typeName` to replace the node's
  ///                   current `typeName`, if present.
  public func withTypeName(
    _ newChild: TypeSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeName)
    return InheritedTypeSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> InheritedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return InheritedTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `InheritedTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: InheritedTypeSyntax, rhs: InheritedTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TypeInheritanceClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case colon
    case inheritedTypeCollection
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TypeInheritanceClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind typeInheritanceClause")
    let _inheritedTypeCollection = raw[Cursor.inheritedTypeList]
    precondition(_inheritedTypeCollection.kind == .inheritedTypeList,
                 "expected child of kind .inheritedTypeList, " +
                 "got \(_inheritedTypeCollection.kind)")
  }
#endif
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return TypeInheritanceClauseSyntax(root: root, data: newData)
  }
  public var inheritedTypeCollection: InheritedTypeListSyntax {
    let child = data.cachedChild(at: Cursor.inheritedTypeCollection)
    return makeSyntax(root: _root, data: child!) as! InheritedTypeListSyntax
  }

  /// Adds the provided `InheritedType` to the node's `inheritedTypeCollection`
  /// collection.
  /// - param element: The new `InheritedType` to add to the node's
  ///                  `inheritedTypeCollection` collection.
  /// - returns: A copy of the receiver with the provided `InheritedType`
  ///            appended to its `inheritedTypeCollection` collection.
  public func addInheritedType(_ element: InheritedTypeSyntax) -> TypeInheritanceClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.inheritedTypeCollection] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.inheritedTypeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.inheritedTypeCollection)
    return TypeInheritanceClauseSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `inheritedTypeCollection` replaced.
  /// - param newChild: The new `inheritedTypeCollection` to replace the node's
  ///                   current `inheritedTypeCollection`, if present.
  public func withInheritedTypeCollection(
    _ newChild: InheritedTypeListSyntax?) -> TypeInheritanceClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.inheritedTypeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inheritedTypeCollection)
    return TypeInheritanceClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `TypeInheritanceClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: TypeInheritanceClauseSyntax, rhs: TypeInheritanceClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ClassDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case accessLevelModifier
    case classKeyword
    case identifier
    case genericParameterClause
    case inheritanceClause
    case genericWhereClause
    case members
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ClassDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 8)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _accessLevelModifier = raw[Cursor.declModifier]
    precondition(_accessLevelModifier.kind == .declModifier,
                 "expected child of kind .declModifier, " +
                 "got \(_accessLevelModifier.kind)")
    let _classKeyword = raw[Cursor.classToken]
    guard let _classKeywordTokenKind = _classKeyword.tokenKind else {
      fatalError("expected token child, got \(_classKeyword.kind)")
    }
    precondition([.classKeyword].contains(_classKeywordTokenKind),
      "expected one of [.classKeyword] for 'classKeyword' " + 
      "in node of kind classDecl")
    let _identifier = raw[Cursor.identifierToken]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier].contains(_identifierTokenKind),
      "expected one of [.identifier] for 'identifier' " + 
      "in node of kind classDecl")
    let _genericParameterClause = raw[Cursor.genericParameterClause]
    precondition(_genericParameterClause.kind == .genericParameterClause,
                 "expected child of kind .genericParameterClause, " +
                 "got \(_genericParameterClause.kind)")
    let _inheritanceClause = raw[Cursor.typeInheritanceClause]
    precondition(_inheritanceClause.kind == .typeInheritanceClause,
                 "expected child of kind .typeInheritanceClause, " +
                 "got \(_inheritanceClause.kind)")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
    let _members = raw[Cursor.memberDeclBlock]
    precondition(_members.kind == .memberDeclBlock,
                 "expected child of kind .memberDeclBlock, " +
                 "got \(_members.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> ClassDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return ClassDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> ClassDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return ClassDeclSyntax(root: root, data: newData)
  }
  public var accessLevelModifier: DeclModifierSyntax? {
    let child = data.cachedChild(at: Cursor.accessLevelModifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclModifierSyntax
  }

  /// Returns a copy of the receiver with its `accessLevelModifier` replaced.
  /// - param newChild: The new `accessLevelModifier` to replace the node's
  ///                   current `accessLevelModifier`, if present.
  public func withAccessLevelModifier(
    _ newChild: DeclModifierSyntax?) -> ClassDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declModifier)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessLevelModifier)
    return ClassDeclSyntax(root: root, data: newData)
  }
  public var classKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.classKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `classKeyword` replaced.
  /// - param newChild: The new `classKeyword` to replace the node's
  ///                   current `classKeyword`, if present.
  public func withClassKeyword(
    _ newChild: TokenSyntax?) -> ClassDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.classKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.classKeyword)
    return ClassDeclSyntax(root: root, data: newData)
  }
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> ClassDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return ClassDeclSyntax(root: root, data: newData)
  }
  public var genericParameterClause: GenericParameterClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericParameterClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericParameterClause` replaced.
  /// - param newChild: The new `genericParameterClause` to replace the node's
  ///                   current `genericParameterClause`, if present.
  public func withGenericParameterClause(
    _ newChild: GenericParameterClauseSyntax?) -> ClassDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericParameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericParameterClause)
    return ClassDeclSyntax(root: root, data: newData)
  }
  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    let child = data.cachedChild(at: Cursor.inheritanceClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeInheritanceClauseSyntax
  }

  /// Returns a copy of the receiver with its `inheritanceClause` replaced.
  /// - param newChild: The new `inheritanceClause` to replace the node's
  ///                   current `inheritanceClause`, if present.
  public func withInheritanceClause(
    _ newChild: TypeInheritanceClauseSyntax?) -> ClassDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeInheritanceClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inheritanceClause)
    return ClassDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> ClassDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return ClassDeclSyntax(root: root, data: newData)
  }
  public var members: MemberDeclBlockSyntax {
    let child = data.cachedChild(at: Cursor.members)
    return makeSyntax(root: _root, data: child!) as! MemberDeclBlockSyntax
  }

  /// Returns a copy of the receiver with its `members` replaced.
  /// - param newChild: The new `members` to replace the node's
  ///                   current `members`, if present.
  public func withMembers(
    _ newChild: MemberDeclBlockSyntax?) -> ClassDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.memberDeclBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.members)
    return ClassDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `ClassDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: ClassDeclSyntax, rhs: ClassDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct StructDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case accessLevelModifier
    case structKeyword
    case identifier
    case genericParameterClause
    case inheritanceClause
    case genericWhereClause
    case members
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `StructDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 8)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _accessLevelModifier = raw[Cursor.declModifier]
    precondition(_accessLevelModifier.kind == .declModifier,
                 "expected child of kind .declModifier, " +
                 "got \(_accessLevelModifier.kind)")
    let _structKeyword = raw[Cursor.structToken]
    guard let _structKeywordTokenKind = _structKeyword.tokenKind else {
      fatalError("expected token child, got \(_structKeyword.kind)")
    }
    precondition([.structKeyword].contains(_structKeywordTokenKind),
      "expected one of [.structKeyword] for 'structKeyword' " + 
      "in node of kind structDecl")
    let _identifier = raw[Cursor.identifierToken]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier].contains(_identifierTokenKind),
      "expected one of [.identifier] for 'identifier' " + 
      "in node of kind structDecl")
    let _genericParameterClause = raw[Cursor.genericParameterClause]
    precondition(_genericParameterClause.kind == .genericParameterClause,
                 "expected child of kind .genericParameterClause, " +
                 "got \(_genericParameterClause.kind)")
    let _inheritanceClause = raw[Cursor.typeInheritanceClause]
    precondition(_inheritanceClause.kind == .typeInheritanceClause,
                 "expected child of kind .typeInheritanceClause, " +
                 "got \(_inheritanceClause.kind)")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
    let _members = raw[Cursor.memberDeclBlock]
    precondition(_members.kind == .memberDeclBlock,
                 "expected child of kind .memberDeclBlock, " +
                 "got \(_members.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> StructDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return StructDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> StructDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return StructDeclSyntax(root: root, data: newData)
  }
  public var accessLevelModifier: DeclModifierSyntax? {
    let child = data.cachedChild(at: Cursor.accessLevelModifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclModifierSyntax
  }

  /// Returns a copy of the receiver with its `accessLevelModifier` replaced.
  /// - param newChild: The new `accessLevelModifier` to replace the node's
  ///                   current `accessLevelModifier`, if present.
  public func withAccessLevelModifier(
    _ newChild: DeclModifierSyntax?) -> StructDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declModifier)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessLevelModifier)
    return StructDeclSyntax(root: root, data: newData)
  }
  public var structKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.structKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `structKeyword` replaced.
  /// - param newChild: The new `structKeyword` to replace the node's
  ///                   current `structKeyword`, if present.
  public func withStructKeyword(
    _ newChild: TokenSyntax?) -> StructDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.structKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.structKeyword)
    return StructDeclSyntax(root: root, data: newData)
  }
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> StructDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return StructDeclSyntax(root: root, data: newData)
  }
  public var genericParameterClause: GenericParameterClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericParameterClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericParameterClause` replaced.
  /// - param newChild: The new `genericParameterClause` to replace the node's
  ///                   current `genericParameterClause`, if present.
  public func withGenericParameterClause(
    _ newChild: GenericParameterClauseSyntax?) -> StructDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericParameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericParameterClause)
    return StructDeclSyntax(root: root, data: newData)
  }
  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    let child = data.cachedChild(at: Cursor.inheritanceClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeInheritanceClauseSyntax
  }

  /// Returns a copy of the receiver with its `inheritanceClause` replaced.
  /// - param newChild: The new `inheritanceClause` to replace the node's
  ///                   current `inheritanceClause`, if present.
  public func withInheritanceClause(
    _ newChild: TypeInheritanceClauseSyntax?) -> StructDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeInheritanceClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inheritanceClause)
    return StructDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> StructDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return StructDeclSyntax(root: root, data: newData)
  }
  public var members: MemberDeclBlockSyntax {
    let child = data.cachedChild(at: Cursor.members)
    return makeSyntax(root: _root, data: child!) as! MemberDeclBlockSyntax
  }

  /// Returns a copy of the receiver with its `members` replaced.
  /// - param newChild: The new `members` to replace the node's
  ///                   current `members`, if present.
  public func withMembers(
    _ newChild: MemberDeclBlockSyntax?) -> StructDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.memberDeclBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.members)
    return StructDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `StructDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: StructDeclSyntax, rhs: StructDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ProtocolDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case accessLevelModifier
    case protocolKeyword
    case identifier
    case inheritanceClause
    case genericWhereClause
    case members
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ProtocolDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 7)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _accessLevelModifier = raw[Cursor.declModifier]
    precondition(_accessLevelModifier.kind == .declModifier,
                 "expected child of kind .declModifier, " +
                 "got \(_accessLevelModifier.kind)")
    let _protocolKeyword = raw[Cursor.protocolToken]
    guard let _protocolKeywordTokenKind = _protocolKeyword.tokenKind else {
      fatalError("expected token child, got \(_protocolKeyword.kind)")
    }
    precondition([.protocolKeyword].contains(_protocolKeywordTokenKind),
      "expected one of [.protocolKeyword] for 'protocolKeyword' " + 
      "in node of kind protocolDecl")
    let _identifier = raw[Cursor.identifierToken]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier].contains(_identifierTokenKind),
      "expected one of [.identifier] for 'identifier' " + 
      "in node of kind protocolDecl")
    let _inheritanceClause = raw[Cursor.typeInheritanceClause]
    precondition(_inheritanceClause.kind == .typeInheritanceClause,
                 "expected child of kind .typeInheritanceClause, " +
                 "got \(_inheritanceClause.kind)")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
    let _members = raw[Cursor.memberDeclBlock]
    precondition(_members.kind == .memberDeclBlock,
                 "expected child of kind .memberDeclBlock, " +
                 "got \(_members.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> ProtocolDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return ProtocolDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> ProtocolDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return ProtocolDeclSyntax(root: root, data: newData)
  }
  public var accessLevelModifier: DeclModifierSyntax? {
    let child = data.cachedChild(at: Cursor.accessLevelModifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclModifierSyntax
  }

  /// Returns a copy of the receiver with its `accessLevelModifier` replaced.
  /// - param newChild: The new `accessLevelModifier` to replace the node's
  ///                   current `accessLevelModifier`, if present.
  public func withAccessLevelModifier(
    _ newChild: DeclModifierSyntax?) -> ProtocolDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declModifier)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessLevelModifier)
    return ProtocolDeclSyntax(root: root, data: newData)
  }
  public var protocolKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.protocolKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `protocolKeyword` replaced.
  /// - param newChild: The new `protocolKeyword` to replace the node's
  ///                   current `protocolKeyword`, if present.
  public func withProtocolKeyword(
    _ newChild: TokenSyntax?) -> ProtocolDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.protocolKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.protocolKeyword)
    return ProtocolDeclSyntax(root: root, data: newData)
  }
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> ProtocolDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return ProtocolDeclSyntax(root: root, data: newData)
  }
  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    let child = data.cachedChild(at: Cursor.inheritanceClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeInheritanceClauseSyntax
  }

  /// Returns a copy of the receiver with its `inheritanceClause` replaced.
  /// - param newChild: The new `inheritanceClause` to replace the node's
  ///                   current `inheritanceClause`, if present.
  public func withInheritanceClause(
    _ newChild: TypeInheritanceClauseSyntax?) -> ProtocolDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeInheritanceClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inheritanceClause)
    return ProtocolDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> ProtocolDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return ProtocolDeclSyntax(root: root, data: newData)
  }
  public var members: MemberDeclBlockSyntax {
    let child = data.cachedChild(at: Cursor.members)
    return makeSyntax(root: _root, data: child!) as! MemberDeclBlockSyntax
  }

  /// Returns a copy of the receiver with its `members` replaced.
  /// - param newChild: The new `members` to replace the node's
  ///                   current `members`, if present.
  public func withMembers(
    _ newChild: MemberDeclBlockSyntax?) -> ProtocolDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.memberDeclBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.members)
    return ProtocolDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `ProtocolDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: ProtocolDeclSyntax, rhs: ProtocolDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ExtensionDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case accessLevelModifier
    case extensionKeyword
    case extendedType
    case inheritanceClause
    case genericWhereClause
    case members
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ExtensionDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 7)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _accessLevelModifier = raw[Cursor.declModifier]
    precondition(_accessLevelModifier.kind == .declModifier,
                 "expected child of kind .declModifier, " +
                 "got \(_accessLevelModifier.kind)")
    let _extensionKeyword = raw[Cursor.extensionToken]
    guard let _extensionKeywordTokenKind = _extensionKeyword.tokenKind else {
      fatalError("expected token child, got \(_extensionKeyword.kind)")
    }
    precondition([.extensionKeyword].contains(_extensionKeywordTokenKind),
      "expected one of [.extensionKeyword] for 'extensionKeyword' " + 
      "in node of kind extensionDecl")
    let _extendedType = raw[Cursor.type]
    precondition(_extendedType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_extendedType.kind)")
    let _inheritanceClause = raw[Cursor.typeInheritanceClause]
    precondition(_inheritanceClause.kind == .typeInheritanceClause,
                 "expected child of kind .typeInheritanceClause, " +
                 "got \(_inheritanceClause.kind)")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
    let _members = raw[Cursor.memberDeclBlock]
    precondition(_members.kind == .memberDeclBlock,
                 "expected child of kind .memberDeclBlock, " +
                 "got \(_members.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> ExtensionDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return ExtensionDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> ExtensionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return ExtensionDeclSyntax(root: root, data: newData)
  }
  public var accessLevelModifier: DeclModifierSyntax? {
    let child = data.cachedChild(at: Cursor.accessLevelModifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclModifierSyntax
  }

  /// Returns a copy of the receiver with its `accessLevelModifier` replaced.
  /// - param newChild: The new `accessLevelModifier` to replace the node's
  ///                   current `accessLevelModifier`, if present.
  public func withAccessLevelModifier(
    _ newChild: DeclModifierSyntax?) -> ExtensionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declModifier)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessLevelModifier)
    return ExtensionDeclSyntax(root: root, data: newData)
  }
  public var extensionKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.extensionKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `extensionKeyword` replaced.
  /// - param newChild: The new `extensionKeyword` to replace the node's
  ///                   current `extensionKeyword`, if present.
  public func withExtensionKeyword(
    _ newChild: TokenSyntax?) -> ExtensionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.extensionKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.extensionKeyword)
    return ExtensionDeclSyntax(root: root, data: newData)
  }
  public var extendedType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.extendedType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `extendedType` replaced.
  /// - param newChild: The new `extendedType` to replace the node's
  ///                   current `extendedType`, if present.
  public func withExtendedType(
    _ newChild: TypeSyntax?) -> ExtensionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.extendedType)
    return ExtensionDeclSyntax(root: root, data: newData)
  }
  public var inheritanceClause: TypeInheritanceClauseSyntax? {
    let child = data.cachedChild(at: Cursor.inheritanceClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeInheritanceClauseSyntax
  }

  /// Returns a copy of the receiver with its `inheritanceClause` replaced.
  /// - param newChild: The new `inheritanceClause` to replace the node's
  ///                   current `inheritanceClause`, if present.
  public func withInheritanceClause(
    _ newChild: TypeInheritanceClauseSyntax?) -> ExtensionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeInheritanceClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inheritanceClause)
    return ExtensionDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> ExtensionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return ExtensionDeclSyntax(root: root, data: newData)
  }
  public var members: MemberDeclBlockSyntax {
    let child = data.cachedChild(at: Cursor.members)
    return makeSyntax(root: _root, data: child!) as! MemberDeclBlockSyntax
  }

  /// Returns a copy of the receiver with its `members` replaced.
  /// - param newChild: The new `members` to replace the node's
  ///                   current `members`, if present.
  public func withMembers(
    _ newChild: MemberDeclBlockSyntax?) -> ExtensionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.memberDeclBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.members)
    return ExtensionDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `ExtensionDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: ExtensionDeclSyntax, rhs: ExtensionDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct MemberDeclBlockSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftBrace
    case members
    case rightBrace
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `MemberDeclBlockSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftBrace = raw[Cursor.leftBraceToken]
    guard let _leftBraceTokenKind = _leftBrace.tokenKind else {
      fatalError("expected token child, got \(_leftBrace.kind)")
    }
    precondition([.leftBrace].contains(_leftBraceTokenKind),
      "expected one of [.leftBrace] for 'leftBrace' " + 
      "in node of kind memberDeclBlock")
    let _members = raw[Cursor.declList]
    precondition(_members.kind == .declList,
                 "expected child of kind .declList, " +
                 "got \(_members.kind)")
    let _rightBrace = raw[Cursor.rightBraceToken]
    guard let _rightBraceTokenKind = _rightBrace.tokenKind else {
      fatalError("expected token child, got \(_rightBrace.kind)")
    }
    precondition([.rightBrace].contains(_rightBraceTokenKind),
      "expected one of [.rightBrace] for 'rightBrace' " + 
      "in node of kind memberDeclBlock")
  }
#endif
  public var leftBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftBrace)
    return MemberDeclBlockSyntax(root: root, data: newData)
  }
  public var members: DeclListSyntax {
    let child = data.cachedChild(at: Cursor.members)
    return makeSyntax(root: _root, data: child!) as! DeclListSyntax
  }

  /// Adds the provided `Decl` to the node's `members`
  /// collection.
  /// - param element: The new `Decl` to add to the node's
  ///                  `members` collection.
  /// - returns: A copy of the receiver with the provided `Decl`
  ///            appended to its `members` collection.
  public func addDecl(_ element: DeclSyntax) -> MemberDeclBlockSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.members] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.declList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.members)
    return MemberDeclBlockSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `members` replaced.
  /// - param newChild: The new `members` to replace the node's
  ///                   current `members`, if present.
  public func withMembers(
    _ newChild: DeclListSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.members)
    return MemberDeclBlockSyntax(root: root, data: newData)
  }
  public var rightBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> MemberDeclBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightBrace)
    return MemberDeclBlockSyntax(root: root, data: newData)
  }

  /// Determines if two `MemberDeclBlockSyntax` nodes are equal to each other.
  public static func ==(lhs: MemberDeclBlockSyntax, rhs: MemberDeclBlockSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SourceFileSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case statements
    case eofToken
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SourceFileSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _statements = raw[Cursor.codeBlockItemList]
    precondition(_statements.kind == .codeBlockItemList,
                 "expected child of kind .codeBlockItemList, " +
                 "got \(_statements.kind)")
    let _eofToken = raw[Cursor.eofToken]
    precondition(_eofToken.kind == .eofToken,
                 "expected child of kind .eofToken, " +
                 "got \(_eofToken.kind)")
  }
#endif
  public var statements: CodeBlockItemListSyntax {
    let child = data.cachedChild(at: Cursor.statements)
    return makeSyntax(root: _root, data: child!) as! CodeBlockItemListSyntax
  }

  /// Adds the provided `CodeBlockItem` to the node's `statements`
  /// collection.
  /// - param element: The new `CodeBlockItem` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `CodeBlockItem`
  ///            appended to its `statements` collection.
  public func addCodeBlockItem(_ element: CodeBlockItemSyntax) -> SourceFileSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.codeBlockItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.statements)
    return SourceFileSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlockItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.statements)
    return SourceFileSyntax(root: root, data: newData)
  }
  public var eofToken: TokenSyntax {
    let child = data.cachedChild(at: Cursor.eofToken)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `eofToken` replaced.
  /// - param newChild: The new `eofToken` to replace the node's
  ///                   current `eofToken`, if present.
  public func withEOFToken(
    _ newChild: TokenSyntax?) -> SourceFileSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.eofToken)
    return SourceFileSyntax(root: root, data: newData)
  }

  /// Determines if two `SourceFileSyntax` nodes are equal to each other.
  public static func ==(lhs: SourceFileSyntax, rhs: SourceFileSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct InitializerClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case equal
    case value
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `InitializerClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _equal = raw[Cursor.equalToken]
    guard let _equalTokenKind = _equal.tokenKind else {
      fatalError("expected token child, got \(_equal.kind)")
    }
    precondition([.equal].contains(_equalTokenKind),
      "expected one of [.equal] for 'equal' " + 
      "in node of kind initializerClause")
    let _value = raw[Cursor.expr]
    precondition(_value.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_value.kind)")
  }
#endif
  public var equal: TokenSyntax {
    let child = data.cachedChild(at: Cursor.equal)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `equal` replaced.
  /// - param newChild: The new `equal` to replace the node's
  ///                   current `equal`, if present.
  public func withEqual(
    _ newChild: TokenSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.equal)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.equal)
    return InitializerClauseSyntax(root: root, data: newData)
  }
  public var value: ExprSyntax {
    let child = data.cachedChild(at: Cursor.value)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `value` replaced.
  /// - param newChild: The new `value` to replace the node's
  ///                   current `value`, if present.
  public func withValue(
    _ newChild: ExprSyntax?) -> InitializerClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.value)
    return InitializerClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `InitializerClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: InitializerClauseSyntax, rhs: InitializerClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct FunctionParameterSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case firstName
    case secondName
    case colon
    case typeAnnotation
    case ellipsis
    case defaultArgument
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `FunctionParameterSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 8)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _firstName = raw[Cursor.token]
    guard let _firstNameTokenKind = _firstName.tokenKind else {
      fatalError("expected token child, got \(_firstName.kind)")
    }
    precondition([.identifier, .wildcardKeyword].contains(_firstNameTokenKind),
      "expected one of [.identifier, .wildcardKeyword] for 'firstName' " + 
      "in node of kind functionParameter")
    let _secondName = raw[Cursor.token]
    guard let _secondNameTokenKind = _secondName.tokenKind else {
      fatalError("expected token child, got \(_secondName.kind)")
    }
    precondition([.identifier, .wildcardKeyword].contains(_secondNameTokenKind),
      "expected one of [.identifier, .wildcardKeyword] for 'secondName' " + 
      "in node of kind functionParameter")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind functionParameter")
    let _typeAnnotation = raw[Cursor.type]
    precondition(_typeAnnotation.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_typeAnnotation.kind)")
    let _ellipsis = raw[Cursor.token]
    precondition(_ellipsis.kind == .token,
                 "expected child of kind .token, " +
                 "got \(_ellipsis.kind)")
    let _defaultArgument = raw[Cursor.initializerClause]
    precondition(_defaultArgument.kind == .initializerClause,
                 "expected child of kind .initializerClause, " +
                 "got \(_defaultArgument.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind functionParameter")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> FunctionParameterSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return FunctionParameterSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return FunctionParameterSyntax(root: root, data: newData)
  }
  public var firstName: TokenSyntax {
    let child = data.cachedChild(at: Cursor.firstName)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `firstName` replaced.
  /// - param newChild: The new `firstName` to replace the node's
  ///                   current `firstName`, if present.
  public func withFirstName(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.firstName)
    return FunctionParameterSyntax(root: root, data: newData)
  }
  public var secondName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.secondName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `secondName` replaced.
  /// - param newChild: The new `secondName` to replace the node's
  ///                   current `secondName`, if present.
  public func withSecondName(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.secondName)
    return FunctionParameterSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return FunctionParameterSyntax(root: root, data: newData)
  }
  public var typeAnnotation: TypeSyntax {
    let child = data.cachedChild(at: Cursor.typeAnnotation)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeAnnotation)
    return FunctionParameterSyntax(root: root, data: newData)
  }
  public var ellipsis: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.ellipsis)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `ellipsis` replaced.
  /// - param newChild: The new `ellipsis` to replace the node's
  ///                   current `ellipsis`, if present.
  public func withEllipsis(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.ellipsis)
    return FunctionParameterSyntax(root: root, data: newData)
  }
  public var defaultArgument: InitializerClauseSyntax? {
    let child = data.cachedChild(at: Cursor.defaultArgument)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? InitializerClauseSyntax
  }

  /// Returns a copy of the receiver with its `defaultArgument` replaced.
  /// - param newChild: The new `defaultArgument` to replace the node's
  ///                   current `defaultArgument`, if present.
  public func withDefaultArgument(
    _ newChild: InitializerClauseSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.initializerClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.defaultArgument)
    return FunctionParameterSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> FunctionParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return FunctionParameterSyntax(root: root, data: newData)
  }

  /// Determines if two `FunctionParameterSyntax` nodes are equal to each other.
  public static func ==(lhs: FunctionParameterSyntax, rhs: FunctionParameterSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct FunctionDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case modifiers
    case funcKeyword
    case identifier
    case genericParameterClause
    case signature
    case genericWhereClause
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `FunctionDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 8)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _modifiers = raw[Cursor.modifierList]
    precondition(_modifiers.kind == .modifierList,
                 "expected child of kind .modifierList, " +
                 "got \(_modifiers.kind)")
    let _funcKeyword = raw[Cursor.funcToken]
    guard let _funcKeywordTokenKind = _funcKeyword.tokenKind else {
      fatalError("expected token child, got \(_funcKeyword.kind)")
    }
    precondition([.funcKeyword].contains(_funcKeywordTokenKind),
      "expected one of [.funcKeyword] for 'funcKeyword' " + 
      "in node of kind functionDecl")
    let _identifier = raw[Cursor.token]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier, .operatorKeyword, .unspacedBinaryOperator, .spacedBinaryOperator, .prefixOperator, .postfixOperator].contains(_identifierTokenKind),
      "expected one of [.identifier, .operatorKeyword, .unspacedBinaryOperator, .spacedBinaryOperator, .prefixOperator, .postfixOperator] for 'identifier' " + 
      "in node of kind functionDecl")
    let _genericParameterClause = raw[Cursor.genericParameterClause]
    precondition(_genericParameterClause.kind == .genericParameterClause,
                 "expected child of kind .genericParameterClause, " +
                 "got \(_genericParameterClause.kind)")
    let _signature = raw[Cursor.functionSignature]
    precondition(_signature.kind == .functionSignature,
                 "expected child of kind .functionSignature, " +
                 "got \(_signature.kind)")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> FunctionDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return FunctionDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> FunctionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return FunctionDeclSyntax(root: root, data: newData)
  }
  public var modifiers: ModifierListSyntax? {
    let child = data.cachedChild(at: Cursor.modifiers)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ModifierListSyntax
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: Syntax) -> FunctionDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.modifiers] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.modifierList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.modifiers)
    return FunctionDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `modifiers` replaced.
  /// - param newChild: The new `modifiers` to replace the node's
  ///                   current `modifiers`, if present.
  public func withModifiers(
    _ newChild: ModifierListSyntax?) -> FunctionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.modifierList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.modifiers)
    return FunctionDeclSyntax(root: root, data: newData)
  }
  public var funcKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.funcKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `funcKeyword` replaced.
  /// - param newChild: The new `funcKeyword` to replace the node's
  ///                   current `funcKeyword`, if present.
  public func withFuncKeyword(
    _ newChild: TokenSyntax?) -> FunctionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.funcKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.funcKeyword)
    return FunctionDeclSyntax(root: root, data: newData)
  }
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> FunctionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return FunctionDeclSyntax(root: root, data: newData)
  }
  public var genericParameterClause: GenericParameterClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericParameterClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericParameterClause` replaced.
  /// - param newChild: The new `genericParameterClause` to replace the node's
  ///                   current `genericParameterClause`, if present.
  public func withGenericParameterClause(
    _ newChild: GenericParameterClauseSyntax?) -> FunctionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericParameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericParameterClause)
    return FunctionDeclSyntax(root: root, data: newData)
  }
  public var signature: FunctionSignatureSyntax {
    let child = data.cachedChild(at: Cursor.signature)
    return makeSyntax(root: _root, data: child!) as! FunctionSignatureSyntax
  }

  /// Returns a copy of the receiver with its `signature` replaced.
  /// - param newChild: The new `signature` to replace the node's
  ///                   current `signature`, if present.
  public func withSignature(
    _ newChild: FunctionSignatureSyntax?) -> FunctionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.functionSignature)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.signature)
    return FunctionDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> FunctionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return FunctionDeclSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax? {
    let child = data.cachedChild(at: Cursor.body)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> FunctionDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return FunctionDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `FunctionDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: FunctionDeclSyntax, rhs: FunctionDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct InitializerDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case modifiers
    case initKeyword
    case optionalMark
    case genericParameterClause
    case parameters
    case throwsOrRethrowsKeyword
    case genericWhereClause
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `InitializerDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 9)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _modifiers = raw[Cursor.modifierList]
    precondition(_modifiers.kind == .modifierList,
                 "expected child of kind .modifierList, " +
                 "got \(_modifiers.kind)")
    let _initKeyword = raw[Cursor.initToken]
    guard let _initKeywordTokenKind = _initKeyword.tokenKind else {
      fatalError("expected token child, got \(_initKeyword.kind)")
    }
    precondition([.initKeyword].contains(_initKeywordTokenKind),
      "expected one of [.initKeyword] for 'initKeyword' " + 
      "in node of kind initializerDecl")
    let _optionalMark = raw[Cursor.token]
    guard let _optionalMarkTokenKind = _optionalMark.tokenKind else {
      fatalError("expected token child, got \(_optionalMark.kind)")
    }
    precondition([.postfixQuestionMark, .infixQuestionMark, .exclamationMark].contains(_optionalMarkTokenKind),
      "expected one of [.postfixQuestionMark, .infixQuestionMark, .exclamationMark] for 'optionalMark' " + 
      "in node of kind initializerDecl")
    let _genericParameterClause = raw[Cursor.genericParameterClause]
    precondition(_genericParameterClause.kind == .genericParameterClause,
                 "expected child of kind .genericParameterClause, " +
                 "got \(_genericParameterClause.kind)")
    let _parameters = raw[Cursor.parameterClause]
    precondition(_parameters.kind == .parameterClause,
                 "expected child of kind .parameterClause, " +
                 "got \(_parameters.kind)")
    let _throwsOrRethrowsKeyword = raw[Cursor.token]
    guard let _throwsOrRethrowsKeywordTokenKind = _throwsOrRethrowsKeyword.tokenKind else {
      fatalError("expected token child, got \(_throwsOrRethrowsKeyword.kind)")
    }
    precondition([.throwsKeyword, .rethrowsKeyword].contains(_throwsOrRethrowsKeywordTokenKind),
      "expected one of [.throwsKeyword, .rethrowsKeyword] for 'throwsOrRethrowsKeyword' " + 
      "in node of kind initializerDecl")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> InitializerDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return InitializerDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return InitializerDeclSyntax(root: root, data: newData)
  }
  public var modifiers: ModifierListSyntax? {
    let child = data.cachedChild(at: Cursor.modifiers)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ModifierListSyntax
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: Syntax) -> InitializerDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.modifiers] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.modifierList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.modifiers)
    return InitializerDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `modifiers` replaced.
  /// - param newChild: The new `modifiers` to replace the node's
  ///                   current `modifiers`, if present.
  public func withModifiers(
    _ newChild: ModifierListSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.modifierList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.modifiers)
    return InitializerDeclSyntax(root: root, data: newData)
  }
  public var initKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.initKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `initKeyword` replaced.
  /// - param newChild: The new `initKeyword` to replace the node's
  ///                   current `initKeyword`, if present.
  public func withInitKeyword(
    _ newChild: TokenSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.initKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.initKeyword)
    return InitializerDeclSyntax(root: root, data: newData)
  }
  public var optionalMark: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.optionalMark)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `optionalMark` replaced.
  /// - param newChild: The new `optionalMark` to replace the node's
  ///                   current `optionalMark`, if present.
  public func withOptionalMark(
    _ newChild: TokenSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.postfixQuestionMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.optionalMark)
    return InitializerDeclSyntax(root: root, data: newData)
  }
  public var genericParameterClause: GenericParameterClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericParameterClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericParameterClause` replaced.
  /// - param newChild: The new `genericParameterClause` to replace the node's
  ///                   current `genericParameterClause`, if present.
  public func withGenericParameterClause(
    _ newChild: GenericParameterClauseSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericParameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericParameterClause)
    return InitializerDeclSyntax(root: root, data: newData)
  }
  public var parameters: ParameterClauseSyntax {
    let child = data.cachedChild(at: Cursor.parameters)
    return makeSyntax(root: _root, data: child!) as! ParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `parameters` replaced.
  /// - param newChild: The new `parameters` to replace the node's
  ///                   current `parameters`, if present.
  public func withParameters(
    _ newChild: ParameterClauseSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.parameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.parameters)
    return InitializerDeclSyntax(root: root, data: newData)
  }
  public var throwsOrRethrowsKeyword: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.throwsOrRethrowsKeyword)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `throwsOrRethrowsKeyword` replaced.
  /// - param newChild: The new `throwsOrRethrowsKeyword` to replace the node's
  ///                   current `throwsOrRethrowsKeyword`, if present.
  public func withThrowsOrRethrowsKeyword(
    _ newChild: TokenSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.throwsKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.throwsOrRethrowsKeyword)
    return InitializerDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return InitializerDeclSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax? {
    let child = data.cachedChild(at: Cursor.body)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> InitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return InitializerDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `InitializerDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: InitializerDeclSyntax, rhs: InitializerDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DeinitializerDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case modifiers
    case deinitKeyword
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DeinitializerDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _modifiers = raw[Cursor.modifierList]
    precondition(_modifiers.kind == .modifierList,
                 "expected child of kind .modifierList, " +
                 "got \(_modifiers.kind)")
    let _deinitKeyword = raw[Cursor.deinitToken]
    guard let _deinitKeywordTokenKind = _deinitKeyword.tokenKind else {
      fatalError("expected token child, got \(_deinitKeyword.kind)")
    }
    precondition([.deinitKeyword].contains(_deinitKeywordTokenKind),
      "expected one of [.deinitKeyword] for 'deinitKeyword' " + 
      "in node of kind deinitializerDecl")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> DeinitializerDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return DeinitializerDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> DeinitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return DeinitializerDeclSyntax(root: root, data: newData)
  }
  public var modifiers: ModifierListSyntax? {
    let child = data.cachedChild(at: Cursor.modifiers)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ModifierListSyntax
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: Syntax) -> DeinitializerDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.modifiers] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.modifierList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.modifiers)
    return DeinitializerDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `modifiers` replaced.
  /// - param newChild: The new `modifiers` to replace the node's
  ///                   current `modifiers`, if present.
  public func withModifiers(
    _ newChild: ModifierListSyntax?) -> DeinitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.modifierList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.modifiers)
    return DeinitializerDeclSyntax(root: root, data: newData)
  }
  public var deinitKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.deinitKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `deinitKeyword` replaced.
  /// - param newChild: The new `deinitKeyword` to replace the node's
  ///                   current `deinitKeyword`, if present.
  public func withDeinitKeyword(
    _ newChild: TokenSyntax?) -> DeinitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.deinitKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.deinitKeyword)
    return DeinitializerDeclSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> DeinitializerDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return DeinitializerDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `DeinitializerDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: DeinitializerDeclSyntax, rhs: DeinitializerDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SubscriptDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case modifiers
    case subscriptKeyword
    case genericParameterClause
    case indices
    case result
    case genericWhereClause
    case accessor
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SubscriptDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 8)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _modifiers = raw[Cursor.modifierList]
    precondition(_modifiers.kind == .modifierList,
                 "expected child of kind .modifierList, " +
                 "got \(_modifiers.kind)")
    let _subscriptKeyword = raw[Cursor.subscriptToken]
    guard let _subscriptKeywordTokenKind = _subscriptKeyword.tokenKind else {
      fatalError("expected token child, got \(_subscriptKeyword.kind)")
    }
    precondition([.subscriptKeyword].contains(_subscriptKeywordTokenKind),
      "expected one of [.subscriptKeyword] for 'subscriptKeyword' " + 
      "in node of kind subscriptDecl")
    let _genericParameterClause = raw[Cursor.genericParameterClause]
    precondition(_genericParameterClause.kind == .genericParameterClause,
                 "expected child of kind .genericParameterClause, " +
                 "got \(_genericParameterClause.kind)")
    let _indices = raw[Cursor.parameterClause]
    precondition(_indices.kind == .parameterClause,
                 "expected child of kind .parameterClause, " +
                 "got \(_indices.kind)")
    let _result = raw[Cursor.returnClause]
    precondition(_result.kind == .returnClause,
                 "expected child of kind .returnClause, " +
                 "got \(_result.kind)")
    let _genericWhereClause = raw[Cursor.genericWhereClause]
    precondition(_genericWhereClause.kind == .genericWhereClause,
                 "expected child of kind .genericWhereClause, " +
                 "got \(_genericWhereClause.kind)")
    let _accessor = raw[Cursor.accessorBlock]
    precondition(_accessor.kind == .accessorBlock,
                 "expected child of kind .accessorBlock, " +
                 "got \(_accessor.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> SubscriptDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return SubscriptDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> SubscriptDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return SubscriptDeclSyntax(root: root, data: newData)
  }
  public var modifiers: ModifierListSyntax? {
    let child = data.cachedChild(at: Cursor.modifiers)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ModifierListSyntax
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: Syntax) -> SubscriptDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.modifiers] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.modifierList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.modifiers)
    return SubscriptDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `modifiers` replaced.
  /// - param newChild: The new `modifiers` to replace the node's
  ///                   current `modifiers`, if present.
  public func withModifiers(
    _ newChild: ModifierListSyntax?) -> SubscriptDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.modifierList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.modifiers)
    return SubscriptDeclSyntax(root: root, data: newData)
  }
  public var subscriptKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.subscriptKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `subscriptKeyword` replaced.
  /// - param newChild: The new `subscriptKeyword` to replace the node's
  ///                   current `subscriptKeyword`, if present.
  public func withSubscriptKeyword(
    _ newChild: TokenSyntax?) -> SubscriptDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.subscriptKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.subscriptKeyword)
    return SubscriptDeclSyntax(root: root, data: newData)
  }
  public var genericParameterClause: GenericParameterClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericParameterClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericParameterClause` replaced.
  /// - param newChild: The new `genericParameterClause` to replace the node's
  ///                   current `genericParameterClause`, if present.
  public func withGenericParameterClause(
    _ newChild: GenericParameterClauseSyntax?) -> SubscriptDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericParameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericParameterClause)
    return SubscriptDeclSyntax(root: root, data: newData)
  }
  public var indices: ParameterClauseSyntax {
    let child = data.cachedChild(at: Cursor.indices)
    return makeSyntax(root: _root, data: child!) as! ParameterClauseSyntax
  }

  /// Returns a copy of the receiver with its `indices` replaced.
  /// - param newChild: The new `indices` to replace the node's
  ///                   current `indices`, if present.
  public func withIndices(
    _ newChild: ParameterClauseSyntax?) -> SubscriptDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.parameterClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.indices)
    return SubscriptDeclSyntax(root: root, data: newData)
  }
  public var result: ReturnClauseSyntax {
    let child = data.cachedChild(at: Cursor.result)
    return makeSyntax(root: _root, data: child!) as! ReturnClauseSyntax
  }

  /// Returns a copy of the receiver with its `result` replaced.
  /// - param newChild: The new `result` to replace the node's
  ///                   current `result`, if present.
  public func withResult(
    _ newChild: ReturnClauseSyntax?) -> SubscriptDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.returnClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.result)
    return SubscriptDeclSyntax(root: root, data: newData)
  }
  public var genericWhereClause: GenericWhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericWhereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericWhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericWhereClause` replaced.
  /// - param newChild: The new `genericWhereClause` to replace the node's
  ///                   current `genericWhereClause`, if present.
  public func withGenericWhereClause(
    _ newChild: GenericWhereClauseSyntax?) -> SubscriptDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericWhereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericWhereClause)
    return SubscriptDeclSyntax(root: root, data: newData)
  }
  public var accessor: AccessorBlockSyntax? {
    let child = data.cachedChild(at: Cursor.accessor)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AccessorBlockSyntax
  }

  /// Returns a copy of the receiver with its `accessor` replaced.
  /// - param newChild: The new `accessor` to replace the node's
  ///                   current `accessor`, if present.
  public func withAccessor(
    _ newChild: AccessorBlockSyntax?) -> SubscriptDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.accessorBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessor)
    return SubscriptDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `SubscriptDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: SubscriptDeclSyntax, rhs: SubscriptDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ElseDirectiveClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundElse
    case statements
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ElseDirectiveClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _poundElse = raw[Cursor.poundElseToken]
    guard let _poundElseTokenKind = _poundElse.tokenKind else {
      fatalError("expected token child, got \(_poundElse.kind)")
    }
    precondition([.poundElseKeyword].contains(_poundElseTokenKind),
      "expected one of [.poundElseKeyword] for 'poundElse' " + 
      "in node of kind elseDirectiveClause")
    let _statements = raw[Cursor.codeBlockItemList]
    precondition(_statements.kind == .codeBlockItemList,
                 "expected child of kind .codeBlockItemList, " +
                 "got \(_statements.kind)")
  }
#endif
  public var poundElse: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundElse)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundElse` replaced.
  /// - param newChild: The new `poundElse` to replace the node's
  ///                   current `poundElse`, if present.
  public func withPoundElse(
    _ newChild: TokenSyntax?) -> ElseDirectiveClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundElseKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundElse)
    return ElseDirectiveClauseSyntax(root: root, data: newData)
  }
  public var statements: CodeBlockItemListSyntax {
    let child = data.cachedChild(at: Cursor.statements)
    return makeSyntax(root: _root, data: child!) as! CodeBlockItemListSyntax
  }

  /// Adds the provided `CodeBlockItem` to the node's `statements`
  /// collection.
  /// - param element: The new `CodeBlockItem` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `CodeBlockItem`
  ///            appended to its `statements` collection.
  public func addCodeBlockItem(_ element: CodeBlockItemSyntax) -> ElseDirectiveClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.codeBlockItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.statements)
    return ElseDirectiveClauseSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> ElseDirectiveClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlockItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.statements)
    return ElseDirectiveClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `ElseDirectiveClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: ElseDirectiveClauseSyntax, rhs: ElseDirectiveClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AccessLevelModifierSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case name
    case leftParen
    case modifier
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AccessLevelModifierSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _name = raw[Cursor.identifierToken]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier].contains(_nameTokenKind),
      "expected one of [.identifier] for 'name' " + 
      "in node of kind accessLevelModifier")
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind accessLevelModifier")
    let _modifier = raw[Cursor.identifierToken]
    guard let _modifierTokenKind = _modifier.tokenKind else {
      fatalError("expected token child, got \(_modifier.kind)")
    }
    precondition([.identifier].contains(_modifierTokenKind),
      "expected one of [.identifier] for 'modifier' " + 
      "in node of kind accessLevelModifier")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind accessLevelModifier")
  }
#endif
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return AccessLevelModifierSyntax(root: root, data: newData)
  }
  public var leftParen: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.leftParen)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return AccessLevelModifierSyntax(root: root, data: newData)
  }
  public var modifier: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.modifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `modifier` replaced.
  /// - param newChild: The new `modifier` to replace the node's
  ///                   current `modifier`, if present.
  public func withModifier(
    _ newChild: TokenSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.modifier)
    return AccessLevelModifierSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.rightParen)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> AccessLevelModifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return AccessLevelModifierSyntax(root: root, data: newData)
  }

  /// Determines if two `AccessLevelModifierSyntax` nodes are equal to each other.
  public static func ==(lhs: AccessLevelModifierSyntax, rhs: AccessLevelModifierSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AccessPathComponentSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case name
    case trailingDot
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AccessPathComponentSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _name = raw[Cursor.identifierToken]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier].contains(_nameTokenKind),
      "expected one of [.identifier] for 'name' " + 
      "in node of kind accessPathComponent")
    let _trailingDot = raw[Cursor.periodToken]
    guard let _trailingDotTokenKind = _trailingDot.tokenKind else {
      fatalError("expected token child, got \(_trailingDot.kind)")
    }
    precondition([.period].contains(_trailingDotTokenKind),
      "expected one of [.period] for 'trailingDot' " + 
      "in node of kind accessPathComponent")
  }
#endif
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return AccessPathComponentSyntax(root: root, data: newData)
  }
  public var trailingDot: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingDot)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingDot` replaced.
  /// - param newChild: The new `trailingDot` to replace the node's
  ///                   current `trailingDot`, if present.
  public func withTrailingDot(
    _ newChild: TokenSyntax?) -> AccessPathComponentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.period)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingDot)
    return AccessPathComponentSyntax(root: root, data: newData)
  }

  /// Determines if two `AccessPathComponentSyntax` nodes are equal to each other.
  public static func ==(lhs: AccessPathComponentSyntax, rhs: AccessPathComponentSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ImportDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case importTok
    case importKind
    case path
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ImportDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _importTok = raw[Cursor.importToken]
    guard let _importTokTokenKind = _importTok.tokenKind else {
      fatalError("expected token child, got \(_importTok.kind)")
    }
    precondition([.importKeyword].contains(_importTokTokenKind),
      "expected one of [.importKeyword] for 'importTok' " + 
      "in node of kind importDecl")
    let _importKind = raw[Cursor.token]
    guard let _importKindTokenKind = _importKind.tokenKind else {
      fatalError("expected token child, got \(_importKind.kind)")
    }
    precondition([.typealiasKeyword, .structKeyword, .classKeyword, .enumKeyword, .protocolKeyword, .varKeyword, .letKeyword, .funcKeyword].contains(_importKindTokenKind),
      "expected one of [.typealiasKeyword, .structKeyword, .classKeyword, .enumKeyword, .protocolKeyword, .varKeyword, .letKeyword, .funcKeyword] for 'importKind' " + 
      "in node of kind importDecl")
    let _path = raw[Cursor.accessPath]
    precondition(_path.kind == .accessPath,
                 "expected child of kind .accessPath, " +
                 "got \(_path.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> ImportDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return ImportDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> ImportDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return ImportDeclSyntax(root: root, data: newData)
  }
  public var importTok: TokenSyntax {
    let child = data.cachedChild(at: Cursor.importTok)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `importTok` replaced.
  /// - param newChild: The new `importTok` to replace the node's
  ///                   current `importTok`, if present.
  public func withImportTok(
    _ newChild: TokenSyntax?) -> ImportDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.importKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.importTok)
    return ImportDeclSyntax(root: root, data: newData)
  }
  public var importKind: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.importKind)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `importKind` replaced.
  /// - param newChild: The new `importKind` to replace the node's
  ///                   current `importKind`, if present.
  public func withImportKind(
    _ newChild: TokenSyntax?) -> ImportDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.typealiasKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.importKind)
    return ImportDeclSyntax(root: root, data: newData)
  }
  public var path: AccessPathSyntax {
    let child = data.cachedChild(at: Cursor.path)
    return makeSyntax(root: _root, data: child!) as! AccessPathSyntax
  }

  /// Adds the provided `AccessPathComponent` to the node's `path`
  /// collection.
  /// - param element: The new `AccessPathComponent` to add to the node's
  ///                  `path` collection.
  /// - returns: A copy of the receiver with the provided `AccessPathComponent`
  ///            appended to its `path` collection.
  public func addAccessPathComponent(_ element: AccessPathComponentSyntax) -> ImportDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.path] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.accessPath,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.path)
    return ImportDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `path` replaced.
  /// - param newChild: The new `path` to replace the node's
  ///                   current `path`, if present.
  public func withPath(
    _ newChild: AccessPathSyntax?) -> ImportDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.accessPath)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.path)
    return ImportDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `ImportDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: ImportDeclSyntax, rhs: ImportDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AccessorParameterSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftParen
    case name
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AccessorParameterSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind accessorParameter")
    let _name = raw[Cursor.identifierToken]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier].contains(_nameTokenKind),
      "expected one of [.identifier] for 'name' " + 
      "in node of kind accessorParameter")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind accessorParameter")
  }
#endif
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return AccessorParameterSyntax(root: root, data: newData)
  }
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return AccessorParameterSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> AccessorParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return AccessorParameterSyntax(root: root, data: newData)
  }

  /// Determines if two `AccessorParameterSyntax` nodes are equal to each other.
  public static func ==(lhs: AccessorParameterSyntax, rhs: AccessorParameterSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AccessorDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case modifier
    case accessorKind
    case parameter
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AccessorDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _modifier = raw[Cursor.declModifier]
    precondition(_modifier.kind == .declModifier,
                 "expected child of kind .declModifier, " +
                 "got \(_modifier.kind)")
    let _accessorKind = raw[Cursor.token]
    guard let _accessorKindTokenKind = _accessorKind.tokenKind else {
      fatalError("expected token child, got \(_accessorKind.kind)")
    }
    precondition(["get", "set", "didSet", "willSet"].contains(_accessorKindTokenKind.text),
                 "expected one of '[get, set, didSet, willSet]', got " +
                 "'\(_accessorKindTokenKind.text)'")
    let _parameter = raw[Cursor.accessorParameter]
    precondition(_parameter.kind == .accessorParameter,
                 "expected child of kind .accessorParameter, " +
                 "got \(_parameter.kind)")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> AccessorDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return AccessorDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> AccessorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return AccessorDeclSyntax(root: root, data: newData)
  }
  public var modifier: DeclModifierSyntax? {
    let child = data.cachedChild(at: Cursor.modifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? DeclModifierSyntax
  }

  /// Returns a copy of the receiver with its `modifier` replaced.
  /// - param newChild: The new `modifier` to replace the node's
  ///                   current `modifier`, if present.
  public func withModifier(
    _ newChild: DeclModifierSyntax?) -> AccessorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.declModifier)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.modifier)
    return AccessorDeclSyntax(root: root, data: newData)
  }
  public var accessorKind: TokenSyntax {
    let child = data.cachedChild(at: Cursor.accessorKind)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `accessorKind` replaced.
  /// - param newChild: The new `accessorKind` to replace the node's
  ///                   current `accessorKind`, if present.
  public func withAccessorKind(
    _ newChild: TokenSyntax?) -> AccessorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessorKind)
    return AccessorDeclSyntax(root: root, data: newData)
  }
  public var parameter: AccessorParameterSyntax? {
    let child = data.cachedChild(at: Cursor.parameter)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AccessorParameterSyntax
  }

  /// Returns a copy of the receiver with its `parameter` replaced.
  /// - param newChild: The new `parameter` to replace the node's
  ///                   current `parameter`, if present.
  public func withParameter(
    _ newChild: AccessorParameterSyntax?) -> AccessorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.accessorParameter)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.parameter)
    return AccessorDeclSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax? {
    let child = data.cachedChild(at: Cursor.body)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> AccessorDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return AccessorDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `AccessorDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: AccessorDeclSyntax, rhs: AccessorDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AccessorBlockSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftBrace
    case accessorListOrStmtList
    case rightBrace
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AccessorBlockSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftBrace = raw[Cursor.leftBraceToken]
    guard let _leftBraceTokenKind = _leftBrace.tokenKind else {
      fatalError("expected token child, got \(_leftBrace.kind)")
    }
    precondition([.leftBrace].contains(_leftBraceTokenKind),
      "expected one of [.leftBrace] for 'leftBrace' " + 
      "in node of kind accessorBlock")
    let _accessorListOrStmtList = raw[Cursor.syntax]
    precondition(_accessorListOrStmtList.kind == .syntax,
                 "expected child of kind .syntax, " +
                 "got \(_accessorListOrStmtList.kind)")
    let _rightBrace = raw[Cursor.rightBraceToken]
    guard let _rightBraceTokenKind = _rightBrace.tokenKind else {
      fatalError("expected token child, got \(_rightBrace.kind)")
    }
    precondition([.rightBrace].contains(_rightBraceTokenKind),
      "expected one of [.rightBrace] for 'rightBrace' " + 
      "in node of kind accessorBlock")
  }
#endif
  public var leftBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftBrace)
    return AccessorBlockSyntax(root: root, data: newData)
  }
  public var accessorListOrStmtList: Syntax {
    let child = data.cachedChild(at: Cursor.accessorListOrStmtList)
    return makeSyntax(root: _root, data: child!) 
  }

  /// Returns a copy of the receiver with its `accessorListOrStmtList` replaced.
  /// - param newChild: The new `accessorListOrStmtList` to replace the node's
  ///                   current `accessorListOrStmtList`, if present.
  public func withAccessorListOrStmtList(
    _ newChild: Syntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessorListOrStmtList)
    return AccessorBlockSyntax(root: root, data: newData)
  }
  public var rightBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> AccessorBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightBrace)
    return AccessorBlockSyntax(root: root, data: newData)
  }

  /// Determines if two `AccessorBlockSyntax` nodes are equal to each other.
  public static func ==(lhs: AccessorBlockSyntax, rhs: AccessorBlockSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct PatternBindingSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case pattern
    case typeAnnotation
    case initializer
    case accessor
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `PatternBindingSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
    let _typeAnnotation = raw[Cursor.typeAnnotation]
    precondition(_typeAnnotation.kind == .typeAnnotation,
                 "expected child of kind .typeAnnotation, " +
                 "got \(_typeAnnotation.kind)")
    let _initializer = raw[Cursor.initializerClause]
    precondition(_initializer.kind == .initializerClause,
                 "expected child of kind .initializerClause, " +
                 "got \(_initializer.kind)")
    let _accessor = raw[Cursor.accessorBlock]
    precondition(_accessor.kind == .accessorBlock,
                 "expected child of kind .accessorBlock, " +
                 "got \(_accessor.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind patternBinding")
  }
#endif
  public var pattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.pattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return PatternBindingSyntax(root: root, data: newData)
  }
  public var typeAnnotation: TypeAnnotationSyntax? {
    let child = data.cachedChild(at: Cursor.typeAnnotation)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeAnnotationSyntax
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeAnnotation)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeAnnotation)
    return PatternBindingSyntax(root: root, data: newData)
  }
  public var initializer: InitializerClauseSyntax? {
    let child = data.cachedChild(at: Cursor.initializer)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? InitializerClauseSyntax
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.initializerClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.initializer)
    return PatternBindingSyntax(root: root, data: newData)
  }
  public var accessor: AccessorBlockSyntax? {
    let child = data.cachedChild(at: Cursor.accessor)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AccessorBlockSyntax
  }

  /// Returns a copy of the receiver with its `accessor` replaced.
  /// - param newChild: The new `accessor` to replace the node's
  ///                   current `accessor`, if present.
  public func withAccessor(
    _ newChild: AccessorBlockSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.accessorBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.accessor)
    return PatternBindingSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> PatternBindingSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return PatternBindingSyntax(root: root, data: newData)
  }

  /// Determines if two `PatternBindingSyntax` nodes are equal to each other.
  public static func ==(lhs: PatternBindingSyntax, rhs: PatternBindingSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct VariableDeclSyntax: DeclSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case modifiers
    case letOrVarKeyword
    case bindings
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `VariableDeclSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _modifiers = raw[Cursor.modifierList]
    precondition(_modifiers.kind == .modifierList,
                 "expected child of kind .modifierList, " +
                 "got \(_modifiers.kind)")
    let _letOrVarKeyword = raw[Cursor.token]
    guard let _letOrVarKeywordTokenKind = _letOrVarKeyword.tokenKind else {
      fatalError("expected token child, got \(_letOrVarKeyword.kind)")
    }
    precondition([.letKeyword, .varKeyword].contains(_letOrVarKeywordTokenKind),
      "expected one of [.letKeyword, .varKeyword] for 'letOrVarKeyword' " + 
      "in node of kind variableDecl")
    let _bindings = raw[Cursor.patternBindingList]
    precondition(_bindings.kind == .patternBindingList,
                 "expected child of kind .patternBindingList, " +
                 "got \(_bindings.kind)")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> VariableDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return VariableDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> VariableDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return VariableDeclSyntax(root: root, data: newData)
  }
  public var modifiers: ModifierListSyntax? {
    let child = data.cachedChild(at: Cursor.modifiers)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ModifierListSyntax
  }

  /// Adds the provided `Modifier` to the node's `modifiers`
  /// collection.
  /// - param element: The new `Modifier` to add to the node's
  ///                  `modifiers` collection.
  /// - returns: A copy of the receiver with the provided `Modifier`
  ///            appended to its `modifiers` collection.
  public func addModifier(_ element: Syntax) -> VariableDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.modifiers] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.modifierList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.modifiers)
    return VariableDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `modifiers` replaced.
  /// - param newChild: The new `modifiers` to replace the node's
  ///                   current `modifiers`, if present.
  public func withModifiers(
    _ newChild: ModifierListSyntax?) -> VariableDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.modifierList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.modifiers)
    return VariableDeclSyntax(root: root, data: newData)
  }
  public var letOrVarKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.letOrVarKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `letOrVarKeyword` replaced.
  /// - param newChild: The new `letOrVarKeyword` to replace the node's
  ///                   current `letOrVarKeyword`, if present.
  public func withLetOrVarKeyword(
    _ newChild: TokenSyntax?) -> VariableDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.letKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.letOrVarKeyword)
    return VariableDeclSyntax(root: root, data: newData)
  }
  public var bindings: PatternBindingListSyntax {
    let child = data.cachedChild(at: Cursor.bindings)
    return makeSyntax(root: _root, data: child!) as! PatternBindingListSyntax
  }

  /// Adds the provided `PatternBinding` to the node's `bindings`
  /// collection.
  /// - param element: The new `PatternBinding` to add to the node's
  ///                  `bindings` collection.
  /// - returns: A copy of the receiver with the provided `PatternBinding`
  ///            appended to its `bindings` collection.
  public func addPatternBinding(_ element: PatternBindingSyntax) -> VariableDeclSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.bindings] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.patternBindingList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.bindings)
    return VariableDeclSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `bindings` replaced.
  /// - param newChild: The new `bindings` to replace the node's
  ///                   current `bindings`, if present.
  public func withBindings(
    _ newChild: PatternBindingListSyntax?) -> VariableDeclSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.patternBindingList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.bindings)
    return VariableDeclSyntax(root: root, data: newData)
  }

  /// Determines if two `VariableDeclSyntax` nodes are equal to each other.
  public static func ==(lhs: VariableDeclSyntax, rhs: VariableDeclSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AttributeSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case atSignToken
    case attributeName
    case balancedTokens
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AttributeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _atSignToken = raw[Cursor.atSignToken]
    guard let _atSignTokenTokenKind = _atSignToken.tokenKind else {
      fatalError("expected token child, got \(_atSignToken.kind)")
    }
    precondition([.atSign].contains(_atSignTokenTokenKind),
      "expected one of [.atSign] for 'atSignToken' " + 
      "in node of kind attribute")
    let _attributeName = raw[Cursor.token]
    precondition(_attributeName.kind == .token,
                 "expected child of kind .token, " +
                 "got \(_attributeName.kind)")
    let _balancedTokens = raw[Cursor.tokenList]
    precondition(_balancedTokens.kind == .tokenList,
                 "expected child of kind .tokenList, " +
                 "got \(_balancedTokens.kind)")
  }
#endif
  public var atSignToken: TokenSyntax {
    let child = data.cachedChild(at: Cursor.atSignToken)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `atSignToken` replaced.
  /// - param newChild: The new `atSignToken` to replace the node's
  ///                   current `atSignToken`, if present.
  public func withAtSignToken(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.atSign)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.atSignToken)
    return AttributeSyntax(root: root, data: newData)
  }
  public var attributeName: TokenSyntax {
    let child = data.cachedChild(at: Cursor.attributeName)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `attributeName` replaced.
  /// - param newChild: The new `attributeName` to replace the node's
  ///                   current `attributeName`, if present.
  public func withAttributeName(
    _ newChild: TokenSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributeName)
    return AttributeSyntax(root: root, data: newData)
  }
  public var balancedTokens: TokenListSyntax {
    let child = data.cachedChild(at: Cursor.balancedTokens)
    return makeSyntax(root: _root, data: child!) as! TokenListSyntax
  }

  /// Adds the provided `Token` to the node's `balancedTokens`
  /// collection.
  /// - param element: The new `Token` to add to the node's
  ///                  `balancedTokens` collection.
  /// - returns: A copy of the receiver with the provided `Token`
  ///            appended to its `balancedTokens` collection.
  public func addToken(_ element: TokenSyntax) -> AttributeSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.balancedTokens] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.tokenList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.balancedTokens)
    return AttributeSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `balancedTokens` replaced.
  /// - param newChild: The new `balancedTokens` to replace the node's
  ///                   current `balancedTokens`, if present.
  public func withBalancedTokens(
    _ newChild: TokenListSyntax?) -> AttributeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.balancedTokens)
    return AttributeSyntax(root: root, data: newData)
  }

  /// Determines if two `AttributeSyntax` nodes are equal to each other.
  public static func ==(lhs: AttributeSyntax, rhs: AttributeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ContinueStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case continueKeyword
    case label
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ContinueStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _continueKeyword = raw[Cursor.continueToken]
    guard let _continueKeywordTokenKind = _continueKeyword.tokenKind else {
      fatalError("expected token child, got \(_continueKeyword.kind)")
    }
    precondition([.continueKeyword].contains(_continueKeywordTokenKind),
      "expected one of [.continueKeyword] for 'continueKeyword' " + 
      "in node of kind continueStmt")
    let _label = raw[Cursor.identifierToken]
    guard let _labelTokenKind = _label.tokenKind else {
      fatalError("expected token child, got \(_label.kind)")
    }
    precondition([.identifier].contains(_labelTokenKind),
      "expected one of [.identifier] for 'label' " + 
      "in node of kind continueStmt")
  }
#endif
  public var continueKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.continueKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `continueKeyword` replaced.
  /// - param newChild: The new `continueKeyword` to replace the node's
  ///                   current `continueKeyword`, if present.
  public func withContinueKeyword(
    _ newChild: TokenSyntax?) -> ContinueStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.continueKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.continueKeyword)
    return ContinueStmtSyntax(root: root, data: newData)
  }
  public var label: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.label)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> ContinueStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.label)
    return ContinueStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `ContinueStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: ContinueStmtSyntax, rhs: ContinueStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct WhileStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case labelName
    case labelColon
    case whileKeyword
    case conditions
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `WhileStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _labelName = raw[Cursor.identifierToken]
    guard let _labelNameTokenKind = _labelName.tokenKind else {
      fatalError("expected token child, got \(_labelName.kind)")
    }
    precondition([.identifier].contains(_labelNameTokenKind),
      "expected one of [.identifier] for 'labelName' " + 
      "in node of kind whileStmt")
    let _labelColon = raw[Cursor.colonToken]
    guard let _labelColonTokenKind = _labelColon.tokenKind else {
      fatalError("expected token child, got \(_labelColon.kind)")
    }
    precondition([.colon].contains(_labelColonTokenKind),
      "expected one of [.colon] for 'labelColon' " + 
      "in node of kind whileStmt")
    let _whileKeyword = raw[Cursor.whileToken]
    guard let _whileKeywordTokenKind = _whileKeyword.tokenKind else {
      fatalError("expected token child, got \(_whileKeyword.kind)")
    }
    precondition([.whileKeyword].contains(_whileKeywordTokenKind),
      "expected one of [.whileKeyword] for 'whileKeyword' " + 
      "in node of kind whileStmt")
    let _conditions = raw[Cursor.conditionElementList]
    precondition(_conditions.kind == .conditionElementList,
                 "expected child of kind .conditionElementList, " +
                 "got \(_conditions.kind)")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var labelName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> WhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelName)
    return WhileStmtSyntax(root: root, data: newData)
  }
  public var labelColon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelColon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> WhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelColon)
    return WhileStmtSyntax(root: root, data: newData)
  }
  public var whileKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.whileKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `whileKeyword` replaced.
  /// - param newChild: The new `whileKeyword` to replace the node's
  ///                   current `whileKeyword`, if present.
  public func withWhileKeyword(
    _ newChild: TokenSyntax?) -> WhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.whileKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.whileKeyword)
    return WhileStmtSyntax(root: root, data: newData)
  }
  public var conditions: ConditionElementListSyntax {
    let child = data.cachedChild(at: Cursor.conditions)
    return makeSyntax(root: _root, data: child!) as! ConditionElementListSyntax
  }

  /// Adds the provided `ConditionElement` to the node's `conditions`
  /// collection.
  /// - param element: The new `ConditionElement` to add to the node's
  ///                  `conditions` collection.
  /// - returns: A copy of the receiver with the provided `ConditionElement`
  ///            appended to its `conditions` collection.
  public func addConditionElement(_ element: ConditionElementSyntax) -> WhileStmtSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.conditions] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.conditionElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.conditions)
    return WhileStmtSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `conditions` replaced.
  /// - param newChild: The new `conditions` to replace the node's
  ///                   current `conditions`, if present.
  public func withConditions(
    _ newChild: ConditionElementListSyntax?) -> WhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.conditionElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.conditions)
    return WhileStmtSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> WhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return WhileStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `WhileStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: WhileStmtSyntax, rhs: WhileStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DeferStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case deferKeyword
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DeferStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _deferKeyword = raw[Cursor.deferToken]
    guard let _deferKeywordTokenKind = _deferKeyword.tokenKind else {
      fatalError("expected token child, got \(_deferKeyword.kind)")
    }
    precondition([.deferKeyword].contains(_deferKeywordTokenKind),
      "expected one of [.deferKeyword] for 'deferKeyword' " + 
      "in node of kind deferStmt")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var deferKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.deferKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `deferKeyword` replaced.
  /// - param newChild: The new `deferKeyword` to replace the node's
  ///                   current `deferKeyword`, if present.
  public func withDeferKeyword(
    _ newChild: TokenSyntax?) -> DeferStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.deferKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.deferKeyword)
    return DeferStmtSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> DeferStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return DeferStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `DeferStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: DeferStmtSyntax, rhs: DeferStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ExpressionStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case expression
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ExpressionStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
  }
#endif
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ExpressionStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return ExpressionStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `ExpressionStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: ExpressionStmtSyntax, rhs: ExpressionStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct RepeatWhileStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case labelName
    case labelColon
    case repeatKeyword
    case body
    case whileKeyword
    case condition
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `RepeatWhileStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 6)
    let _labelName = raw[Cursor.identifierToken]
    guard let _labelNameTokenKind = _labelName.tokenKind else {
      fatalError("expected token child, got \(_labelName.kind)")
    }
    precondition([.identifier].contains(_labelNameTokenKind),
      "expected one of [.identifier] for 'labelName' " + 
      "in node of kind repeatWhileStmt")
    let _labelColon = raw[Cursor.colonToken]
    guard let _labelColonTokenKind = _labelColon.tokenKind else {
      fatalError("expected token child, got \(_labelColon.kind)")
    }
    precondition([.colon].contains(_labelColonTokenKind),
      "expected one of [.colon] for 'labelColon' " + 
      "in node of kind repeatWhileStmt")
    let _repeatKeyword = raw[Cursor.repeatToken]
    guard let _repeatKeywordTokenKind = _repeatKeyword.tokenKind else {
      fatalError("expected token child, got \(_repeatKeyword.kind)")
    }
    precondition([.repeatKeyword].contains(_repeatKeywordTokenKind),
      "expected one of [.repeatKeyword] for 'repeatKeyword' " + 
      "in node of kind repeatWhileStmt")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
    let _whileKeyword = raw[Cursor.whileToken]
    guard let _whileKeywordTokenKind = _whileKeyword.tokenKind else {
      fatalError("expected token child, got \(_whileKeyword.kind)")
    }
    precondition([.whileKeyword].contains(_whileKeywordTokenKind),
      "expected one of [.whileKeyword] for 'whileKeyword' " + 
      "in node of kind repeatWhileStmt")
    let _condition = raw[Cursor.expr]
    precondition(_condition.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_condition.kind)")
  }
#endif
  public var labelName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> RepeatWhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelName)
    return RepeatWhileStmtSyntax(root: root, data: newData)
  }
  public var labelColon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelColon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> RepeatWhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelColon)
    return RepeatWhileStmtSyntax(root: root, data: newData)
  }
  public var repeatKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.repeatKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `repeatKeyword` replaced.
  /// - param newChild: The new `repeatKeyword` to replace the node's
  ///                   current `repeatKeyword`, if present.
  public func withRepeatKeyword(
    _ newChild: TokenSyntax?) -> RepeatWhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.repeatKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.repeatKeyword)
    return RepeatWhileStmtSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> RepeatWhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return RepeatWhileStmtSyntax(root: root, data: newData)
  }
  public var whileKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.whileKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `whileKeyword` replaced.
  /// - param newChild: The new `whileKeyword` to replace the node's
  ///                   current `whileKeyword`, if present.
  public func withWhileKeyword(
    _ newChild: TokenSyntax?) -> RepeatWhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.whileKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.whileKeyword)
    return RepeatWhileStmtSyntax(root: root, data: newData)
  }
  public var condition: ExprSyntax {
    let child = data.cachedChild(at: Cursor.condition)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `condition` replaced.
  /// - param newChild: The new `condition` to replace the node's
  ///                   current `condition`, if present.
  public func withCondition(
    _ newChild: ExprSyntax?) -> RepeatWhileStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.condition)
    return RepeatWhileStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `RepeatWhileStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: RepeatWhileStmtSyntax, rhs: RepeatWhileStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct GuardStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case guardKeyword
    case conditions
    case elseKeyword
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `GuardStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _guardKeyword = raw[Cursor.guardToken]
    guard let _guardKeywordTokenKind = _guardKeyword.tokenKind else {
      fatalError("expected token child, got \(_guardKeyword.kind)")
    }
    precondition([.guardKeyword].contains(_guardKeywordTokenKind),
      "expected one of [.guardKeyword] for 'guardKeyword' " + 
      "in node of kind guardStmt")
    let _conditions = raw[Cursor.conditionElementList]
    precondition(_conditions.kind == .conditionElementList,
                 "expected child of kind .conditionElementList, " +
                 "got \(_conditions.kind)")
    let _elseKeyword = raw[Cursor.elseToken]
    guard let _elseKeywordTokenKind = _elseKeyword.tokenKind else {
      fatalError("expected token child, got \(_elseKeyword.kind)")
    }
    precondition([.elseKeyword].contains(_elseKeywordTokenKind),
      "expected one of [.elseKeyword] for 'elseKeyword' " + 
      "in node of kind guardStmt")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var guardKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.guardKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `guardKeyword` replaced.
  /// - param newChild: The new `guardKeyword` to replace the node's
  ///                   current `guardKeyword`, if present.
  public func withGuardKeyword(
    _ newChild: TokenSyntax?) -> GuardStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.guardKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.guardKeyword)
    return GuardStmtSyntax(root: root, data: newData)
  }
  public var conditions: ConditionElementListSyntax {
    let child = data.cachedChild(at: Cursor.conditions)
    return makeSyntax(root: _root, data: child!) as! ConditionElementListSyntax
  }

  /// Adds the provided `ConditionElement` to the node's `conditions`
  /// collection.
  /// - param element: The new `ConditionElement` to add to the node's
  ///                  `conditions` collection.
  /// - returns: A copy of the receiver with the provided `ConditionElement`
  ///            appended to its `conditions` collection.
  public func addConditionElement(_ element: ConditionElementSyntax) -> GuardStmtSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.conditions] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.conditionElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.conditions)
    return GuardStmtSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `conditions` replaced.
  /// - param newChild: The new `conditions` to replace the node's
  ///                   current `conditions`, if present.
  public func withConditions(
    _ newChild: ConditionElementListSyntax?) -> GuardStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.conditionElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.conditions)
    return GuardStmtSyntax(root: root, data: newData)
  }
  public var elseKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.elseKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `elseKeyword` replaced.
  /// - param newChild: The new `elseKeyword` to replace the node's
  ///                   current `elseKeyword`, if present.
  public func withElseKeyword(
    _ newChild: TokenSyntax?) -> GuardStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.elseKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elseKeyword)
    return GuardStmtSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> GuardStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return GuardStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `GuardStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: GuardStmtSyntax, rhs: GuardStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct WhereClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case whereKeyword
    case guardResult
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `WhereClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _whereKeyword = raw[Cursor.whereToken]
    guard let _whereKeywordTokenKind = _whereKeyword.tokenKind else {
      fatalError("expected token child, got \(_whereKeyword.kind)")
    }
    precondition([.whereKeyword].contains(_whereKeywordTokenKind),
      "expected one of [.whereKeyword] for 'whereKeyword' " + 
      "in node of kind whereClause")
    let _guardResult = raw[Cursor.expr]
    precondition(_guardResult.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_guardResult.kind)")
  }
#endif
  public var whereKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.whereKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `whereKeyword` replaced.
  /// - param newChild: The new `whereKeyword` to replace the node's
  ///                   current `whereKeyword`, if present.
  public func withWhereKeyword(
    _ newChild: TokenSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.whereKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.whereKeyword)
    return WhereClauseSyntax(root: root, data: newData)
  }
  public var guardResult: ExprSyntax {
    let child = data.cachedChild(at: Cursor.guardResult)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `guardResult` replaced.
  /// - param newChild: The new `guardResult` to replace the node's
  ///                   current `guardResult`, if present.
  public func withGuardResult(
    _ newChild: ExprSyntax?) -> WhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.guardResult)
    return WhereClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `WhereClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: WhereClauseSyntax, rhs: WhereClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ForInStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case labelName
    case labelColon
    case forKeyword
    case caseKeyword
    case pattern
    case typeAnnotation
    case inKeyword
    case sequenceExpr
    case whereClause
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ForInStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 10)
    let _labelName = raw[Cursor.identifierToken]
    guard let _labelNameTokenKind = _labelName.tokenKind else {
      fatalError("expected token child, got \(_labelName.kind)")
    }
    precondition([.identifier].contains(_labelNameTokenKind),
      "expected one of [.identifier] for 'labelName' " + 
      "in node of kind forInStmt")
    let _labelColon = raw[Cursor.colonToken]
    guard let _labelColonTokenKind = _labelColon.tokenKind else {
      fatalError("expected token child, got \(_labelColon.kind)")
    }
    precondition([.colon].contains(_labelColonTokenKind),
      "expected one of [.colon] for 'labelColon' " + 
      "in node of kind forInStmt")
    let _forKeyword = raw[Cursor.forToken]
    guard let _forKeywordTokenKind = _forKeyword.tokenKind else {
      fatalError("expected token child, got \(_forKeyword.kind)")
    }
    precondition([.forKeyword].contains(_forKeywordTokenKind),
      "expected one of [.forKeyword] for 'forKeyword' " + 
      "in node of kind forInStmt")
    let _caseKeyword = raw[Cursor.caseToken]
    guard let _caseKeywordTokenKind = _caseKeyword.tokenKind else {
      fatalError("expected token child, got \(_caseKeyword.kind)")
    }
    precondition([.caseKeyword].contains(_caseKeywordTokenKind),
      "expected one of [.caseKeyword] for 'caseKeyword' " + 
      "in node of kind forInStmt")
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
    let _typeAnnotation = raw[Cursor.typeAnnotation]
    precondition(_typeAnnotation.kind == .typeAnnotation,
                 "expected child of kind .typeAnnotation, " +
                 "got \(_typeAnnotation.kind)")
    let _inKeyword = raw[Cursor.inToken]
    guard let _inKeywordTokenKind = _inKeyword.tokenKind else {
      fatalError("expected token child, got \(_inKeyword.kind)")
    }
    precondition([.inKeyword].contains(_inKeywordTokenKind),
      "expected one of [.inKeyword] for 'inKeyword' " + 
      "in node of kind forInStmt")
    let _sequenceExpr = raw[Cursor.expr]
    precondition(_sequenceExpr.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_sequenceExpr.kind)")
    let _whereClause = raw[Cursor.whereClause]
    precondition(_whereClause.kind == .whereClause,
                 "expected child of kind .whereClause, " +
                 "got \(_whereClause.kind)")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var labelName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelName)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var labelColon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelColon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelColon)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var forKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.forKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `forKeyword` replaced.
  /// - param newChild: The new `forKeyword` to replace the node's
  ///                   current `forKeyword`, if present.
  public func withForKeyword(
    _ newChild: TokenSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.forKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.forKeyword)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var caseKeyword: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.caseKeyword)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `caseKeyword` replaced.
  /// - param newChild: The new `caseKeyword` to replace the node's
  ///                   current `caseKeyword`, if present.
  public func withCaseKeyword(
    _ newChild: TokenSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.caseKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.caseKeyword)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var pattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.pattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var typeAnnotation: TypeAnnotationSyntax? {
    let child = data.cachedChild(at: Cursor.typeAnnotation)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeAnnotationSyntax
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeAnnotation)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeAnnotation)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var inKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.inKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `inKeyword` replaced.
  /// - param newChild: The new `inKeyword` to replace the node's
  ///                   current `inKeyword`, if present.
  public func withInKeyword(
    _ newChild: TokenSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.inKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inKeyword)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var sequenceExpr: ExprSyntax {
    let child = data.cachedChild(at: Cursor.sequenceExpr)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `sequenceExpr` replaced.
  /// - param newChild: The new `sequenceExpr` to replace the node's
  ///                   current `sequenceExpr`, if present.
  public func withSequenceExpr(
    _ newChild: ExprSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.sequenceExpr)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var whereClause: WhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.whereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? WhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: WhereClauseSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.whereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.whereClause)
    return ForInStmtSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> ForInStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return ForInStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `ForInStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: ForInStmtSyntax, rhs: ForInStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SwitchStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case labelName
    case labelColon
    case switchKeyword
    case expression
    case leftBrace
    case cases
    case rightBrace
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SwitchStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 7)
    let _labelName = raw[Cursor.identifierToken]
    guard let _labelNameTokenKind = _labelName.tokenKind else {
      fatalError("expected token child, got \(_labelName.kind)")
    }
    precondition([.identifier].contains(_labelNameTokenKind),
      "expected one of [.identifier] for 'labelName' " + 
      "in node of kind switchStmt")
    let _labelColon = raw[Cursor.colonToken]
    guard let _labelColonTokenKind = _labelColon.tokenKind else {
      fatalError("expected token child, got \(_labelColon.kind)")
    }
    precondition([.colon].contains(_labelColonTokenKind),
      "expected one of [.colon] for 'labelColon' " + 
      "in node of kind switchStmt")
    let _switchKeyword = raw[Cursor.switchToken]
    guard let _switchKeywordTokenKind = _switchKeyword.tokenKind else {
      fatalError("expected token child, got \(_switchKeyword.kind)")
    }
    precondition([.switchKeyword].contains(_switchKeywordTokenKind),
      "expected one of [.switchKeyword] for 'switchKeyword' " + 
      "in node of kind switchStmt")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
    let _leftBrace = raw[Cursor.leftBraceToken]
    guard let _leftBraceTokenKind = _leftBrace.tokenKind else {
      fatalError("expected token child, got \(_leftBrace.kind)")
    }
    precondition([.leftBrace].contains(_leftBraceTokenKind),
      "expected one of [.leftBrace] for 'leftBrace' " + 
      "in node of kind switchStmt")
    let _cases = raw[Cursor.switchCaseList]
    precondition(_cases.kind == .switchCaseList,
                 "expected child of kind .switchCaseList, " +
                 "got \(_cases.kind)")
    let _rightBrace = raw[Cursor.rightBraceToken]
    guard let _rightBraceTokenKind = _rightBrace.tokenKind else {
      fatalError("expected token child, got \(_rightBrace.kind)")
    }
    precondition([.rightBrace].contains(_rightBraceTokenKind),
      "expected one of [.rightBrace] for 'rightBrace' " + 
      "in node of kind switchStmt")
  }
#endif
  public var labelName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> SwitchStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelName)
    return SwitchStmtSyntax(root: root, data: newData)
  }
  public var labelColon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelColon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> SwitchStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelColon)
    return SwitchStmtSyntax(root: root, data: newData)
  }
  public var switchKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.switchKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `switchKeyword` replaced.
  /// - param newChild: The new `switchKeyword` to replace the node's
  ///                   current `switchKeyword`, if present.
  public func withSwitchKeyword(
    _ newChild: TokenSyntax?) -> SwitchStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.switchKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.switchKeyword)
    return SwitchStmtSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> SwitchStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return SwitchStmtSyntax(root: root, data: newData)
  }
  public var leftBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftBrace` replaced.
  /// - param newChild: The new `leftBrace` to replace the node's
  ///                   current `leftBrace`, if present.
  public func withLeftBrace(
    _ newChild: TokenSyntax?) -> SwitchStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftBrace)
    return SwitchStmtSyntax(root: root, data: newData)
  }
  public var cases: SwitchCaseListSyntax {
    let child = data.cachedChild(at: Cursor.cases)
    return makeSyntax(root: _root, data: child!) as! SwitchCaseListSyntax
  }

  /// Adds the provided `SwitchCase` to the node's `cases`
  /// collection.
  /// - param element: The new `SwitchCase` to add to the node's
  ///                  `cases` collection.
  /// - returns: A copy of the receiver with the provided `SwitchCase`
  ///            appended to its `cases` collection.
  public func addSwitchCase(_ element: SwitchCaseSyntax) -> SwitchStmtSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.cases] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.switchCaseList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.cases)
    return SwitchStmtSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `cases` replaced.
  /// - param newChild: The new `cases` to replace the node's
  ///                   current `cases`, if present.
  public func withCases(
    _ newChild: SwitchCaseListSyntax?) -> SwitchStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.switchCaseList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.cases)
    return SwitchStmtSyntax(root: root, data: newData)
  }
  public var rightBrace: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightBrace)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightBrace` replaced.
  /// - param newChild: The new `rightBrace` to replace the node's
  ///                   current `rightBrace`, if present.
  public func withRightBrace(
    _ newChild: TokenSyntax?) -> SwitchStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightBrace)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightBrace)
    return SwitchStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `SwitchStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: SwitchStmtSyntax, rhs: SwitchStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DoStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case labelName
    case labelColon
    case doKeyword
    case body
    case catchClauses
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DoStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _labelName = raw[Cursor.identifierToken]
    guard let _labelNameTokenKind = _labelName.tokenKind else {
      fatalError("expected token child, got \(_labelName.kind)")
    }
    precondition([.identifier].contains(_labelNameTokenKind),
      "expected one of [.identifier] for 'labelName' " + 
      "in node of kind doStmt")
    let _labelColon = raw[Cursor.colonToken]
    guard let _labelColonTokenKind = _labelColon.tokenKind else {
      fatalError("expected token child, got \(_labelColon.kind)")
    }
    precondition([.colon].contains(_labelColonTokenKind),
      "expected one of [.colon] for 'labelColon' " + 
      "in node of kind doStmt")
    let _doKeyword = raw[Cursor.doToken]
    guard let _doKeywordTokenKind = _doKeyword.tokenKind else {
      fatalError("expected token child, got \(_doKeyword.kind)")
    }
    precondition([.doKeyword].contains(_doKeywordTokenKind),
      "expected one of [.doKeyword] for 'doKeyword' " + 
      "in node of kind doStmt")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
    let _catchClauses = raw[Cursor.catchClauseList]
    precondition(_catchClauses.kind == .catchClauseList,
                 "expected child of kind .catchClauseList, " +
                 "got \(_catchClauses.kind)")
  }
#endif
  public var labelName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> DoStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelName)
    return DoStmtSyntax(root: root, data: newData)
  }
  public var labelColon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelColon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> DoStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelColon)
    return DoStmtSyntax(root: root, data: newData)
  }
  public var doKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.doKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `doKeyword` replaced.
  /// - param newChild: The new `doKeyword` to replace the node's
  ///                   current `doKeyword`, if present.
  public func withDoKeyword(
    _ newChild: TokenSyntax?) -> DoStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.doKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.doKeyword)
    return DoStmtSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> DoStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return DoStmtSyntax(root: root, data: newData)
  }
  public var catchClauses: CatchClauseListSyntax? {
    let child = data.cachedChild(at: Cursor.catchClauses)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? CatchClauseListSyntax
  }

  /// Adds the provided `CatchClause` to the node's `catchClauses`
  /// collection.
  /// - param element: The new `CatchClause` to add to the node's
  ///                  `catchClauses` collection.
  /// - returns: A copy of the receiver with the provided `CatchClause`
  ///            appended to its `catchClauses` collection.
  public func addCatchClause(_ element: CatchClauseSyntax) -> DoStmtSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.catchClauses] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.catchClauseList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.catchClauses)
    return DoStmtSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `catchClauses` replaced.
  /// - param newChild: The new `catchClauses` to replace the node's
  ///                   current `catchClauses`, if present.
  public func withCatchClauses(
    _ newChild: CatchClauseListSyntax?) -> DoStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.catchClauseList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.catchClauses)
    return DoStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `DoStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: DoStmtSyntax, rhs: DoStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ReturnStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case returnKeyword
    case expression
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ReturnStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _returnKeyword = raw[Cursor.returnToken]
    guard let _returnKeywordTokenKind = _returnKeyword.tokenKind else {
      fatalError("expected token child, got \(_returnKeyword.kind)")
    }
    precondition([.returnKeyword].contains(_returnKeywordTokenKind),
      "expected one of [.returnKeyword] for 'returnKeyword' " + 
      "in node of kind returnStmt")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
  }
#endif
  public var returnKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.returnKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `returnKeyword` replaced.
  /// - param newChild: The new `returnKeyword` to replace the node's
  ///                   current `returnKeyword`, if present.
  public func withReturnKeyword(
    _ newChild: TokenSyntax?) -> ReturnStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.returnKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.returnKeyword)
    return ReturnStmtSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax? {
    let child = data.cachedChild(at: Cursor.expression)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ReturnStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return ReturnStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `ReturnStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: ReturnStmtSyntax, rhs: ReturnStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct FallthroughStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case fallthroughKeyword
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `FallthroughStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _fallthroughKeyword = raw[Cursor.fallthroughToken]
    guard let _fallthroughKeywordTokenKind = _fallthroughKeyword.tokenKind else {
      fatalError("expected token child, got \(_fallthroughKeyword.kind)")
    }
    precondition([.fallthroughKeyword].contains(_fallthroughKeywordTokenKind),
      "expected one of [.fallthroughKeyword] for 'fallthroughKeyword' " + 
      "in node of kind fallthroughStmt")
  }
#endif
  public var fallthroughKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.fallthroughKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `fallthroughKeyword` replaced.
  /// - param newChild: The new `fallthroughKeyword` to replace the node's
  ///                   current `fallthroughKeyword`, if present.
  public func withFallthroughKeyword(
    _ newChild: TokenSyntax?) -> FallthroughStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.fallthroughKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.fallthroughKeyword)
    return FallthroughStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `FallthroughStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: FallthroughStmtSyntax, rhs: FallthroughStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct BreakStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case breakKeyword
    case label
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `BreakStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _breakKeyword = raw[Cursor.breakToken]
    guard let _breakKeywordTokenKind = _breakKeyword.tokenKind else {
      fatalError("expected token child, got \(_breakKeyword.kind)")
    }
    precondition([.breakKeyword].contains(_breakKeywordTokenKind),
      "expected one of [.breakKeyword] for 'breakKeyword' " + 
      "in node of kind breakStmt")
    let _label = raw[Cursor.identifierToken]
    guard let _labelTokenKind = _label.tokenKind else {
      fatalError("expected token child, got \(_label.kind)")
    }
    precondition([.identifier].contains(_labelTokenKind),
      "expected one of [.identifier] for 'label' " + 
      "in node of kind breakStmt")
  }
#endif
  public var breakKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.breakKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `breakKeyword` replaced.
  /// - param newChild: The new `breakKeyword` to replace the node's
  ///                   current `breakKeyword`, if present.
  public func withBreakKeyword(
    _ newChild: TokenSyntax?) -> BreakStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.breakKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.breakKeyword)
    return BreakStmtSyntax(root: root, data: newData)
  }
  public var label: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.label)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: TokenSyntax?) -> BreakStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.label)
    return BreakStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `BreakStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: BreakStmtSyntax, rhs: BreakStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ConditionElementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case condition
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ConditionElementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _condition = raw[Cursor.syntax]
    precondition(_condition.kind == .syntax,
                 "expected child of kind .syntax, " +
                 "got \(_condition.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind conditionElement")
  }
#endif
  public var condition: Syntax {
    let child = data.cachedChild(at: Cursor.condition)
    return makeSyntax(root: _root, data: child!) 
  }

  /// Returns a copy of the receiver with its `condition` replaced.
  /// - param newChild: The new `condition` to replace the node's
  ///                   current `condition`, if present.
  public func withCondition(
    _ newChild: Syntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.condition)
    return ConditionElementSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ConditionElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return ConditionElementSyntax(root: root, data: newData)
  }

  /// Determines if two `ConditionElementSyntax` nodes are equal to each other.
  public static func ==(lhs: ConditionElementSyntax, rhs: ConditionElementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AvailabilityConditionSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case poundAvailableKeyword
    case arguments
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AvailabilityConditionSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _poundAvailableKeyword = raw[Cursor.poundAvailableToken]
    guard let _poundAvailableKeywordTokenKind = _poundAvailableKeyword.tokenKind else {
      fatalError("expected token child, got \(_poundAvailableKeyword.kind)")
    }
    precondition([.poundAvailableKeyword].contains(_poundAvailableKeywordTokenKind),
      "expected one of [.poundAvailableKeyword] for 'poundAvailableKeyword' " + 
      "in node of kind availabilityCondition")
    let _arguments = raw[Cursor.tokenList]
    precondition(_arguments.kind == .tokenList,
                 "expected child of kind .tokenList, " +
                 "got \(_arguments.kind)")
  }
#endif
  public var poundAvailableKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.poundAvailableKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `poundAvailableKeyword` replaced.
  /// - param newChild: The new `poundAvailableKeyword` to replace the node's
  ///                   current `poundAvailableKeyword`, if present.
  public func withPoundAvailableKeyword(
    _ newChild: TokenSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.poundAvailableKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.poundAvailableKeyword)
    return AvailabilityConditionSyntax(root: root, data: newData)
  }
  public var arguments: TokenListSyntax {
    let child = data.cachedChild(at: Cursor.arguments)
    return makeSyntax(root: _root, data: child!) as! TokenListSyntax
  }

  /// Adds the provided `Token` to the node's `arguments`
  /// collection.
  /// - param element: The new `Token` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `Token`
  ///            appended to its `arguments` collection.
  public func addToken(_ element: TokenSyntax) -> AvailabilityConditionSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.arguments] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.tokenList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.arguments)
    return AvailabilityConditionSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: TokenListSyntax?) -> AvailabilityConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.arguments)
    return AvailabilityConditionSyntax(root: root, data: newData)
  }

  /// Determines if two `AvailabilityConditionSyntax` nodes are equal to each other.
  public static func ==(lhs: AvailabilityConditionSyntax, rhs: AvailabilityConditionSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct MatchingPatternConditionSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case caseKeyword
    case pattern
    case typeAnnotation
    case initializer
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `MatchingPatternConditionSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _caseKeyword = raw[Cursor.caseToken]
    guard let _caseKeywordTokenKind = _caseKeyword.tokenKind else {
      fatalError("expected token child, got \(_caseKeyword.kind)")
    }
    precondition([.caseKeyword].contains(_caseKeywordTokenKind),
      "expected one of [.caseKeyword] for 'caseKeyword' " + 
      "in node of kind matchingPatternCondition")
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
    let _typeAnnotation = raw[Cursor.typeAnnotation]
    precondition(_typeAnnotation.kind == .typeAnnotation,
                 "expected child of kind .typeAnnotation, " +
                 "got \(_typeAnnotation.kind)")
    let _initializer = raw[Cursor.initializerClause]
    precondition(_initializer.kind == .initializerClause,
                 "expected child of kind .initializerClause, " +
                 "got \(_initializer.kind)")
  }
#endif
  public var caseKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.caseKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `caseKeyword` replaced.
  /// - param newChild: The new `caseKeyword` to replace the node's
  ///                   current `caseKeyword`, if present.
  public func withCaseKeyword(
    _ newChild: TokenSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.caseKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.caseKeyword)
    return MatchingPatternConditionSyntax(root: root, data: newData)
  }
  public var pattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.pattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return MatchingPatternConditionSyntax(root: root, data: newData)
  }
  public var typeAnnotation: TypeAnnotationSyntax? {
    let child = data.cachedChild(at: Cursor.typeAnnotation)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeAnnotationSyntax
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeAnnotation)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeAnnotation)
    return MatchingPatternConditionSyntax(root: root, data: newData)
  }
  public var initializer: InitializerClauseSyntax {
    let child = data.cachedChild(at: Cursor.initializer)
    return makeSyntax(root: _root, data: child!) as! InitializerClauseSyntax
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> MatchingPatternConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.initializerClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.initializer)
    return MatchingPatternConditionSyntax(root: root, data: newData)
  }

  /// Determines if two `MatchingPatternConditionSyntax` nodes are equal to each other.
  public static func ==(lhs: MatchingPatternConditionSyntax, rhs: MatchingPatternConditionSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct OptionalBindingConditionSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case letOrVarKeyword
    case pattern
    case typeAnnotation
    case initializer
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `OptionalBindingConditionSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _letOrVarKeyword = raw[Cursor.token]
    guard let _letOrVarKeywordTokenKind = _letOrVarKeyword.tokenKind else {
      fatalError("expected token child, got \(_letOrVarKeyword.kind)")
    }
    precondition([.letKeyword, .varKeyword].contains(_letOrVarKeywordTokenKind),
      "expected one of [.letKeyword, .varKeyword] for 'letOrVarKeyword' " + 
      "in node of kind optionalBindingCondition")
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
    let _typeAnnotation = raw[Cursor.typeAnnotation]
    precondition(_typeAnnotation.kind == .typeAnnotation,
                 "expected child of kind .typeAnnotation, " +
                 "got \(_typeAnnotation.kind)")
    let _initializer = raw[Cursor.initializerClause]
    precondition(_initializer.kind == .initializerClause,
                 "expected child of kind .initializerClause, " +
                 "got \(_initializer.kind)")
  }
#endif
  public var letOrVarKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.letOrVarKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `letOrVarKeyword` replaced.
  /// - param newChild: The new `letOrVarKeyword` to replace the node's
  ///                   current `letOrVarKeyword`, if present.
  public func withLetOrVarKeyword(
    _ newChild: TokenSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.letKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.letOrVarKeyword)
    return OptionalBindingConditionSyntax(root: root, data: newData)
  }
  public var pattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.pattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return OptionalBindingConditionSyntax(root: root, data: newData)
  }
  public var typeAnnotation: TypeAnnotationSyntax? {
    let child = data.cachedChild(at: Cursor.typeAnnotation)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeAnnotationSyntax
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeAnnotation)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeAnnotation)
    return OptionalBindingConditionSyntax(root: root, data: newData)
  }
  public var initializer: InitializerClauseSyntax {
    let child = data.cachedChild(at: Cursor.initializer)
    return makeSyntax(root: _root, data: child!) as! InitializerClauseSyntax
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> OptionalBindingConditionSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.initializerClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.initializer)
    return OptionalBindingConditionSyntax(root: root, data: newData)
  }

  /// Determines if two `OptionalBindingConditionSyntax` nodes are equal to each other.
  public static func ==(lhs: OptionalBindingConditionSyntax, rhs: OptionalBindingConditionSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DeclarationStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case declaration
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DeclarationStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _declaration = raw[Cursor.decl]
    precondition(_declaration.kind == .decl,
                 "expected child of kind .decl, " +
                 "got \(_declaration.kind)")
  }
#endif
  public var declaration: DeclSyntax {
    let child = data.cachedChild(at: Cursor.declaration)
    return makeSyntax(root: _root, data: child!) as! DeclSyntax
  }

  /// Returns a copy of the receiver with its `declaration` replaced.
  /// - param newChild: The new `declaration` to replace the node's
  ///                   current `declaration`, if present.
  public func withDeclaration(
    _ newChild: DeclSyntax?) -> DeclarationStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.decl)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.declaration)
    return DeclarationStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `DeclarationStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: DeclarationStmtSyntax, rhs: DeclarationStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ThrowStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case throwKeyword
    case expression
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ThrowStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _throwKeyword = raw[Cursor.throwToken]
    guard let _throwKeywordTokenKind = _throwKeyword.tokenKind else {
      fatalError("expected token child, got \(_throwKeyword.kind)")
    }
    precondition([.throwKeyword].contains(_throwKeywordTokenKind),
      "expected one of [.throwKeyword] for 'throwKeyword' " + 
      "in node of kind throwStmt")
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
  }
#endif
  public var throwKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.throwKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `throwKeyword` replaced.
  /// - param newChild: The new `throwKeyword` to replace the node's
  ///                   current `throwKeyword`, if present.
  public func withThrowKeyword(
    _ newChild: TokenSyntax?) -> ThrowStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.throwKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.throwKeyword)
    return ThrowStmtSyntax(root: root, data: newData)
  }
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ThrowStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return ThrowStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `ThrowStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: ThrowStmtSyntax, rhs: ThrowStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct IfStmtSyntax: StmtSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case labelName
    case labelColon
    case ifKeyword
    case conditions
    case body
    case elseKeyword
    case elseBody
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `IfStmtSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 7)
    let _labelName = raw[Cursor.identifierToken]
    guard let _labelNameTokenKind = _labelName.tokenKind else {
      fatalError("expected token child, got \(_labelName.kind)")
    }
    precondition([.identifier].contains(_labelNameTokenKind),
      "expected one of [.identifier] for 'labelName' " + 
      "in node of kind ifStmt")
    let _labelColon = raw[Cursor.colonToken]
    guard let _labelColonTokenKind = _labelColon.tokenKind else {
      fatalError("expected token child, got \(_labelColon.kind)")
    }
    precondition([.colon].contains(_labelColonTokenKind),
      "expected one of [.colon] for 'labelColon' " + 
      "in node of kind ifStmt")
    let _ifKeyword = raw[Cursor.ifToken]
    guard let _ifKeywordTokenKind = _ifKeyword.tokenKind else {
      fatalError("expected token child, got \(_ifKeyword.kind)")
    }
    precondition([.ifKeyword].contains(_ifKeywordTokenKind),
      "expected one of [.ifKeyword] for 'ifKeyword' " + 
      "in node of kind ifStmt")
    let _conditions = raw[Cursor.conditionElementList]
    precondition(_conditions.kind == .conditionElementList,
                 "expected child of kind .conditionElementList, " +
                 "got \(_conditions.kind)")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
    let _elseKeyword = raw[Cursor.elseToken]
    guard let _elseKeywordTokenKind = _elseKeyword.tokenKind else {
      fatalError("expected token child, got \(_elseKeyword.kind)")
    }
    precondition([.elseKeyword].contains(_elseKeywordTokenKind),
      "expected one of [.elseKeyword] for 'elseKeyword' " + 
      "in node of kind ifStmt")
    let _elseBody = raw[Cursor.syntax]
    precondition(_elseBody.kind == .syntax,
                 "expected child of kind .syntax, " +
                 "got \(_elseBody.kind)")
  }
#endif
  public var labelName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> IfStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelName)
    return IfStmtSyntax(root: root, data: newData)
  }
  public var labelColon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelColon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> IfStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelColon)
    return IfStmtSyntax(root: root, data: newData)
  }
  public var ifKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.ifKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `ifKeyword` replaced.
  /// - param newChild: The new `ifKeyword` to replace the node's
  ///                   current `ifKeyword`, if present.
  public func withIfKeyword(
    _ newChild: TokenSyntax?) -> IfStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.ifKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.ifKeyword)
    return IfStmtSyntax(root: root, data: newData)
  }
  public var conditions: ConditionElementListSyntax {
    let child = data.cachedChild(at: Cursor.conditions)
    return makeSyntax(root: _root, data: child!) as! ConditionElementListSyntax
  }

  /// Adds the provided `ConditionElement` to the node's `conditions`
  /// collection.
  /// - param element: The new `ConditionElement` to add to the node's
  ///                  `conditions` collection.
  /// - returns: A copy of the receiver with the provided `ConditionElement`
  ///            appended to its `conditions` collection.
  public func addConditionElement(_ element: ConditionElementSyntax) -> IfStmtSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.conditions] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.conditionElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.conditions)
    return IfStmtSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `conditions` replaced.
  /// - param newChild: The new `conditions` to replace the node's
  ///                   current `conditions`, if present.
  public func withConditions(
    _ newChild: ConditionElementListSyntax?) -> IfStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.conditionElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.conditions)
    return IfStmtSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> IfStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return IfStmtSyntax(root: root, data: newData)
  }
  public var elseKeyword: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.elseKeyword)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `elseKeyword` replaced.
  /// - param newChild: The new `elseKeyword` to replace the node's
  ///                   current `elseKeyword`, if present.
  public func withElseKeyword(
    _ newChild: TokenSyntax?) -> IfStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.elseKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elseKeyword)
    return IfStmtSyntax(root: root, data: newData)
  }
  public var elseBody: Syntax? {
    let child = data.cachedChild(at: Cursor.elseBody)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) 
  }

  /// Returns a copy of the receiver with its `elseBody` replaced.
  /// - param newChild: The new `elseBody` to replace the node's
  ///                   current `elseBody`, if present.
  public func withElseBody(
    _ newChild: Syntax?) -> IfStmtSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elseBody)
    return IfStmtSyntax(root: root, data: newData)
  }

  /// Determines if two `IfStmtSyntax` nodes are equal to each other.
  public static func ==(lhs: IfStmtSyntax, rhs: IfStmtSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ElseIfContinuationSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case ifStatement
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ElseIfContinuationSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _ifStatement = raw[Cursor.ifStmt]
    precondition(_ifStatement.kind == .ifStmt,
                 "expected child of kind .ifStmt, " +
                 "got \(_ifStatement.kind)")
  }
#endif
  public var ifStatement: IfStmtSyntax {
    let child = data.cachedChild(at: Cursor.ifStatement)
    return makeSyntax(root: _root, data: child!) as! IfStmtSyntax
  }

  /// Returns a copy of the receiver with its `ifStatement` replaced.
  /// - param newChild: The new `ifStatement` to replace the node's
  ///                   current `ifStatement`, if present.
  public func withIfStatement(
    _ newChild: IfStmtSyntax?) -> ElseIfContinuationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.ifStmt)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.ifStatement)
    return ElseIfContinuationSyntax(root: root, data: newData)
  }

  /// Determines if two `ElseIfContinuationSyntax` nodes are equal to each other.
  public static func ==(lhs: ElseIfContinuationSyntax, rhs: ElseIfContinuationSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ElseBlockSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case elseKeyword
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ElseBlockSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _elseKeyword = raw[Cursor.elseToken]
    guard let _elseKeywordTokenKind = _elseKeyword.tokenKind else {
      fatalError("expected token child, got \(_elseKeyword.kind)")
    }
    precondition([.elseKeyword].contains(_elseKeywordTokenKind),
      "expected one of [.elseKeyword] for 'elseKeyword' " + 
      "in node of kind elseBlock")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var elseKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.elseKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `elseKeyword` replaced.
  /// - param newChild: The new `elseKeyword` to replace the node's
  ///                   current `elseKeyword`, if present.
  public func withElseKeyword(
    _ newChild: TokenSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.elseKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elseKeyword)
    return ElseBlockSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> ElseBlockSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return ElseBlockSyntax(root: root, data: newData)
  }

  /// Determines if two `ElseBlockSyntax` nodes are equal to each other.
  public static func ==(lhs: ElseBlockSyntax, rhs: ElseBlockSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SwitchCaseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case label
    case statements
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SwitchCaseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _label = raw[Cursor.syntax]
    precondition(_label.kind == .syntax,
                 "expected child of kind .syntax, " +
                 "got \(_label.kind)")
    let _statements = raw[Cursor.codeBlockItemList]
    precondition(_statements.kind == .codeBlockItemList,
                 "expected child of kind .codeBlockItemList, " +
                 "got \(_statements.kind)")
  }
#endif
  public var label: Syntax {
    let child = data.cachedChild(at: Cursor.label)
    return makeSyntax(root: _root, data: child!) 
  }

  /// Returns a copy of the receiver with its `label` replaced.
  /// - param newChild: The new `label` to replace the node's
  ///                   current `label`, if present.
  public func withLabel(
    _ newChild: Syntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.label)
    return SwitchCaseSyntax(root: root, data: newData)
  }
  public var statements: CodeBlockItemListSyntax {
    let child = data.cachedChild(at: Cursor.statements)
    return makeSyntax(root: _root, data: child!) as! CodeBlockItemListSyntax
  }

  /// Adds the provided `CodeBlockItem` to the node's `statements`
  /// collection.
  /// - param element: The new `CodeBlockItem` to add to the node's
  ///                  `statements` collection.
  /// - returns: A copy of the receiver with the provided `CodeBlockItem`
  ///            appended to its `statements` collection.
  public func addCodeBlockItem(_ element: CodeBlockItemSyntax) -> SwitchCaseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.statements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.codeBlockItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.statements)
    return SwitchCaseSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `statements` replaced.
  /// - param newChild: The new `statements` to replace the node's
  ///                   current `statements`, if present.
  public func withStatements(
    _ newChild: CodeBlockItemListSyntax?) -> SwitchCaseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlockItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.statements)
    return SwitchCaseSyntax(root: root, data: newData)
  }

  /// Determines if two `SwitchCaseSyntax` nodes are equal to each other.
  public static func ==(lhs: SwitchCaseSyntax, rhs: SwitchCaseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SwitchDefaultLabelSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case defaultKeyword
    case colon
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SwitchDefaultLabelSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _defaultKeyword = raw[Cursor.defaultToken]
    guard let _defaultKeywordTokenKind = _defaultKeyword.tokenKind else {
      fatalError("expected token child, got \(_defaultKeyword.kind)")
    }
    precondition([.defaultKeyword].contains(_defaultKeywordTokenKind),
      "expected one of [.defaultKeyword] for 'defaultKeyword' " + 
      "in node of kind switchDefaultLabel")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind switchDefaultLabel")
  }
#endif
  public var defaultKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.defaultKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `defaultKeyword` replaced.
  /// - param newChild: The new `defaultKeyword` to replace the node's
  ///                   current `defaultKeyword`, if present.
  public func withDefaultKeyword(
    _ newChild: TokenSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.defaultKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.defaultKeyword)
    return SwitchDefaultLabelSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> SwitchDefaultLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return SwitchDefaultLabelSyntax(root: root, data: newData)
  }

  /// Determines if two `SwitchDefaultLabelSyntax` nodes are equal to each other.
  public static func ==(lhs: SwitchDefaultLabelSyntax, rhs: SwitchDefaultLabelSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct CaseItemSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case pattern
    case whereClause
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `CaseItemSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
    let _whereClause = raw[Cursor.whereClause]
    precondition(_whereClause.kind == .whereClause,
                 "expected child of kind .whereClause, " +
                 "got \(_whereClause.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind caseItem")
  }
#endif
  public var pattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.pattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return CaseItemSyntax(root: root, data: newData)
  }
  public var whereClause: WhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.whereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? WhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: WhereClauseSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.whereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.whereClause)
    return CaseItemSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> CaseItemSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return CaseItemSyntax(root: root, data: newData)
  }

  /// Determines if two `CaseItemSyntax` nodes are equal to each other.
  public static func ==(lhs: CaseItemSyntax, rhs: CaseItemSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SwitchCaseLabelSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case caseKeyword
    case caseItems
    case colon
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SwitchCaseLabelSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _caseKeyword = raw[Cursor.caseToken]
    guard let _caseKeywordTokenKind = _caseKeyword.tokenKind else {
      fatalError("expected token child, got \(_caseKeyword.kind)")
    }
    precondition([.caseKeyword].contains(_caseKeywordTokenKind),
      "expected one of [.caseKeyword] for 'caseKeyword' " + 
      "in node of kind switchCaseLabel")
    let _caseItems = raw[Cursor.caseItemList]
    precondition(_caseItems.kind == .caseItemList,
                 "expected child of kind .caseItemList, " +
                 "got \(_caseItems.kind)")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind switchCaseLabel")
  }
#endif
  public var caseKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.caseKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `caseKeyword` replaced.
  /// - param newChild: The new `caseKeyword` to replace the node's
  ///                   current `caseKeyword`, if present.
  public func withCaseKeyword(
    _ newChild: TokenSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.caseKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.caseKeyword)
    return SwitchCaseLabelSyntax(root: root, data: newData)
  }
  public var caseItems: CaseItemListSyntax {
    let child = data.cachedChild(at: Cursor.caseItems)
    return makeSyntax(root: _root, data: child!) as! CaseItemListSyntax
  }

  /// Adds the provided `CaseItem` to the node's `caseItems`
  /// collection.
  /// - param element: The new `CaseItem` to add to the node's
  ///                  `caseItems` collection.
  /// - returns: A copy of the receiver with the provided `CaseItem`
  ///            appended to its `caseItems` collection.
  public func addCaseItem(_ element: CaseItemSyntax) -> SwitchCaseLabelSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.caseItems] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.caseItemList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.caseItems)
    return SwitchCaseLabelSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `caseItems` replaced.
  /// - param newChild: The new `caseItems` to replace the node's
  ///                   current `caseItems`, if present.
  public func withCaseItems(
    _ newChild: CaseItemListSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.caseItemList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.caseItems)
    return SwitchCaseLabelSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> SwitchCaseLabelSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return SwitchCaseLabelSyntax(root: root, data: newData)
  }

  /// Determines if two `SwitchCaseLabelSyntax` nodes are equal to each other.
  public static func ==(lhs: SwitchCaseLabelSyntax, rhs: SwitchCaseLabelSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct CatchClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case catchKeyword
    case pattern
    case whereClause
    case body
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `CatchClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _catchKeyword = raw[Cursor.catchToken]
    guard let _catchKeywordTokenKind = _catchKeyword.tokenKind else {
      fatalError("expected token child, got \(_catchKeyword.kind)")
    }
    precondition([.catchKeyword].contains(_catchKeywordTokenKind),
      "expected one of [.catchKeyword] for 'catchKeyword' " + 
      "in node of kind catchClause")
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
    let _whereClause = raw[Cursor.whereClause]
    precondition(_whereClause.kind == .whereClause,
                 "expected child of kind .whereClause, " +
                 "got \(_whereClause.kind)")
    let _body = raw[Cursor.codeBlock]
    precondition(_body.kind == .codeBlock,
                 "expected child of kind .codeBlock, " +
                 "got \(_body.kind)")
  }
#endif
  public var catchKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.catchKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `catchKeyword` replaced.
  /// - param newChild: The new `catchKeyword` to replace the node's
  ///                   current `catchKeyword`, if present.
  public func withCatchKeyword(
    _ newChild: TokenSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.catchKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.catchKeyword)
    return CatchClauseSyntax(root: root, data: newData)
  }
  public var pattern: PatternSyntax? {
    let child = data.cachedChild(at: Cursor.pattern)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return CatchClauseSyntax(root: root, data: newData)
  }
  public var whereClause: WhereClauseSyntax? {
    let child = data.cachedChild(at: Cursor.whereClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? WhereClauseSyntax
  }

  /// Returns a copy of the receiver with its `whereClause` replaced.
  /// - param newChild: The new `whereClause` to replace the node's
  ///                   current `whereClause`, if present.
  public func withWhereClause(
    _ newChild: WhereClauseSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.whereClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.whereClause)
    return CatchClauseSyntax(root: root, data: newData)
  }
  public var body: CodeBlockSyntax {
    let child = data.cachedChild(at: Cursor.body)
    return makeSyntax(root: _root, data: child!) as! CodeBlockSyntax
  }

  /// Returns a copy of the receiver with its `body` replaced.
  /// - param newChild: The new `body` to replace the node's
  ///                   current `body`, if present.
  public func withBody(
    _ newChild: CodeBlockSyntax?) -> CatchClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.codeBlock)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.body)
    return CatchClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `CatchClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: CatchClauseSyntax, rhs: CatchClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct GenericWhereClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case whereKeyword
    case requirementList
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `GenericWhereClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _whereKeyword = raw[Cursor.whereToken]
    guard let _whereKeywordTokenKind = _whereKeyword.tokenKind else {
      fatalError("expected token child, got \(_whereKeyword.kind)")
    }
    precondition([.whereKeyword].contains(_whereKeywordTokenKind),
      "expected one of [.whereKeyword] for 'whereKeyword' " + 
      "in node of kind genericWhereClause")
    let _requirementList = raw[Cursor.genericRequirementList]
    precondition(_requirementList.kind == .genericRequirementList,
                 "expected child of kind .genericRequirementList, " +
                 "got \(_requirementList.kind)")
  }
#endif
  public var whereKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.whereKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `whereKeyword` replaced.
  /// - param newChild: The new `whereKeyword` to replace the node's
  ///                   current `whereKeyword`, if present.
  public func withWhereKeyword(
    _ newChild: TokenSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.whereKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.whereKeyword)
    return GenericWhereClauseSyntax(root: root, data: newData)
  }
  public var requirementList: GenericRequirementListSyntax {
    let child = data.cachedChild(at: Cursor.requirementList)
    return makeSyntax(root: _root, data: child!) as! GenericRequirementListSyntax
  }

  /// Adds the provided `GenericRequirement` to the node's `requirementList`
  /// collection.
  /// - param element: The new `GenericRequirement` to add to the node's
  ///                  `requirementList` collection.
  /// - returns: A copy of the receiver with the provided `GenericRequirement`
  ///            appended to its `requirementList` collection.
  public func addGenericRequirement(_ element: Syntax) -> GenericWhereClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.requirementList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.genericRequirementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.requirementList)
    return GenericWhereClauseSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `requirementList` replaced.
  /// - param newChild: The new `requirementList` to replace the node's
  ///                   current `requirementList`, if present.
  public func withRequirementList(
    _ newChild: GenericRequirementListSyntax?) -> GenericWhereClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericRequirementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.requirementList)
    return GenericWhereClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `GenericWhereClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: GenericWhereClauseSyntax, rhs: GenericWhereClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SameTypeRequirementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftTypeIdentifier
    case equalityToken
    case rightTypeIdentifier
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SameTypeRequirementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _leftTypeIdentifier = raw[Cursor.type]
    precondition(_leftTypeIdentifier.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_leftTypeIdentifier.kind)")
    let _equalityToken = raw[Cursor.token]
    guard let _equalityTokenTokenKind = _equalityToken.tokenKind else {
      fatalError("expected token child, got \(_equalityToken.kind)")
    }
    precondition([.spacedBinaryOperator, .unspacedBinaryOperator].contains(_equalityTokenTokenKind),
      "expected one of [.spacedBinaryOperator, .unspacedBinaryOperator] for 'equalityToken' " + 
      "in node of kind sameTypeRequirement")
    let _rightTypeIdentifier = raw[Cursor.type]
    precondition(_rightTypeIdentifier.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_rightTypeIdentifier.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind sameTypeRequirement")
  }
#endif
  public var leftTypeIdentifier: TypeSyntax {
    let child = data.cachedChild(at: Cursor.leftTypeIdentifier)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `leftTypeIdentifier` replaced.
  /// - param newChild: The new `leftTypeIdentifier` to replace the node's
  ///                   current `leftTypeIdentifier`, if present.
  public func withLeftTypeIdentifier(
    _ newChild: TypeSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftTypeIdentifier)
    return SameTypeRequirementSyntax(root: root, data: newData)
  }
  public var equalityToken: TokenSyntax {
    let child = data.cachedChild(at: Cursor.equalityToken)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `equalityToken` replaced.
  /// - param newChild: The new `equalityToken` to replace the node's
  ///                   current `equalityToken`, if present.
  public func withEqualityToken(
    _ newChild: TokenSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.spacedBinaryOperator(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.equalityToken)
    return SameTypeRequirementSyntax(root: root, data: newData)
  }
  public var rightTypeIdentifier: TypeSyntax {
    let child = data.cachedChild(at: Cursor.rightTypeIdentifier)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `rightTypeIdentifier` replaced.
  /// - param newChild: The new `rightTypeIdentifier` to replace the node's
  ///                   current `rightTypeIdentifier`, if present.
  public func withRightTypeIdentifier(
    _ newChild: TypeSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightTypeIdentifier)
    return SameTypeRequirementSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> SameTypeRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return SameTypeRequirementSyntax(root: root, data: newData)
  }

  /// Determines if two `SameTypeRequirementSyntax` nodes are equal to each other.
  public static func ==(lhs: SameTypeRequirementSyntax, rhs: SameTypeRequirementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct GenericParameterSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case attributes
    case name
    case colon
    case inheritedType
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `GenericParameterSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _name = raw[Cursor.identifierToken]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier].contains(_nameTokenKind),
      "expected one of [.identifier] for 'name' " + 
      "in node of kind genericParameter")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind genericParameter")
    let _inheritedType = raw[Cursor.type]
    precondition(_inheritedType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_inheritedType.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind genericParameter")
  }
#endif
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> GenericParameterSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return GenericParameterSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return GenericParameterSyntax(root: root, data: newData)
  }
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return GenericParameterSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.colon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return GenericParameterSyntax(root: root, data: newData)
  }
  public var inheritedType: TypeSyntax? {
    let child = data.cachedChild(at: Cursor.inheritedType)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeSyntax
  }

  /// Returns a copy of the receiver with its `inheritedType` replaced.
  /// - param newChild: The new `inheritedType` to replace the node's
  ///                   current `inheritedType`, if present.
  public func withInheritedType(
    _ newChild: TypeSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inheritedType)
    return GenericParameterSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> GenericParameterSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return GenericParameterSyntax(root: root, data: newData)
  }

  /// Determines if two `GenericParameterSyntax` nodes are equal to each other.
  public static func ==(lhs: GenericParameterSyntax, rhs: GenericParameterSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct GenericParameterClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftAngleBracket
    case genericParameterList
    case rightAngleBracket
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `GenericParameterClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftAngleBracket = raw[Cursor.leftAngleToken]
    guard let _leftAngleBracketTokenKind = _leftAngleBracket.tokenKind else {
      fatalError("expected token child, got \(_leftAngleBracket.kind)")
    }
    precondition([.leftAngle].contains(_leftAngleBracketTokenKind),
      "expected one of [.leftAngle] for 'leftAngleBracket' " + 
      "in node of kind genericParameterClause")
    let _genericParameterList = raw[Cursor.genericParameterList]
    precondition(_genericParameterList.kind == .genericParameterList,
                 "expected child of kind .genericParameterList, " +
                 "got \(_genericParameterList.kind)")
    let _rightAngleBracket = raw[Cursor.rightAngleToken]
    guard let _rightAngleBracketTokenKind = _rightAngleBracket.tokenKind else {
      fatalError("expected token child, got \(_rightAngleBracket.kind)")
    }
    precondition([.rightAngle].contains(_rightAngleBracketTokenKind),
      "expected one of [.rightAngle] for 'rightAngleBracket' " + 
      "in node of kind genericParameterClause")
  }
#endif
  public var leftAngleBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftAngleBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftAngleBracket` replaced.
  /// - param newChild: The new `leftAngleBracket` to replace the node's
  ///                   current `leftAngleBracket`, if present.
  public func withLeftAngleBracket(
    _ newChild: TokenSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftAngle)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftAngleBracket)
    return GenericParameterClauseSyntax(root: root, data: newData)
  }
  public var genericParameterList: GenericParameterListSyntax {
    let child = data.cachedChild(at: Cursor.genericParameterList)
    return makeSyntax(root: _root, data: child!) as! GenericParameterListSyntax
  }

  /// Adds the provided `GenericParameter` to the node's `genericParameterList`
  /// collection.
  /// - param element: The new `GenericParameter` to add to the node's
  ///                  `genericParameterList` collection.
  /// - returns: A copy of the receiver with the provided `GenericParameter`
  ///            appended to its `genericParameterList` collection.
  public func addGenericParameter(_ element: GenericParameterSyntax) -> GenericParameterClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.genericParameterList] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.genericParameterList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.genericParameterList)
    return GenericParameterClauseSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `genericParameterList` replaced.
  /// - param newChild: The new `genericParameterList` to replace the node's
  ///                   current `genericParameterList`, if present.
  public func withGenericParameterList(
    _ newChild: GenericParameterListSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericParameterList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericParameterList)
    return GenericParameterClauseSyntax(root: root, data: newData)
  }
  public var rightAngleBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightAngleBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightAngleBracket` replaced.
  /// - param newChild: The new `rightAngleBracket` to replace the node's
  ///                   current `rightAngleBracket`, if present.
  public func withRightAngleBracket(
    _ newChild: TokenSyntax?) -> GenericParameterClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightAngle)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightAngleBracket)
    return GenericParameterClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `GenericParameterClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: GenericParameterClauseSyntax, rhs: GenericParameterClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ConformanceRequirementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftTypeIdentifier
    case colon
    case rightTypeIdentifier
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ConformanceRequirementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _leftTypeIdentifier = raw[Cursor.type]
    precondition(_leftTypeIdentifier.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_leftTypeIdentifier.kind)")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind conformanceRequirement")
    let _rightTypeIdentifier = raw[Cursor.type]
    precondition(_rightTypeIdentifier.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_rightTypeIdentifier.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind conformanceRequirement")
  }
#endif
  public var leftTypeIdentifier: TypeSyntax {
    let child = data.cachedChild(at: Cursor.leftTypeIdentifier)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `leftTypeIdentifier` replaced.
  /// - param newChild: The new `leftTypeIdentifier` to replace the node's
  ///                   current `leftTypeIdentifier`, if present.
  public func withLeftTypeIdentifier(
    _ newChild: TypeSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftTypeIdentifier)
    return ConformanceRequirementSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return ConformanceRequirementSyntax(root: root, data: newData)
  }
  public var rightTypeIdentifier: TypeSyntax {
    let child = data.cachedChild(at: Cursor.rightTypeIdentifier)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `rightTypeIdentifier` replaced.
  /// - param newChild: The new `rightTypeIdentifier` to replace the node's
  ///                   current `rightTypeIdentifier`, if present.
  public func withRightTypeIdentifier(
    _ newChild: TypeSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightTypeIdentifier)
    return ConformanceRequirementSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> ConformanceRequirementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return ConformanceRequirementSyntax(root: root, data: newData)
  }

  /// Determines if two `ConformanceRequirementSyntax` nodes are equal to each other.
  public static func ==(lhs: ConformanceRequirementSyntax, rhs: ConformanceRequirementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct SimpleTypeIdentifierSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case name
    case genericArgumentClause
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `SimpleTypeIdentifierSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _name = raw[Cursor.token]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier, .capitalSelfKeyword, .anyKeyword].contains(_nameTokenKind),
      "expected one of [.identifier, .capitalSelfKeyword, .anyKeyword] for 'name' " + 
      "in node of kind simpleTypeIdentifier")
    let _genericArgumentClause = raw[Cursor.genericArgumentClause]
    precondition(_genericArgumentClause.kind == .genericArgumentClause,
                 "expected child of kind .genericArgumentClause, " +
                 "got \(_genericArgumentClause.kind)")
  }
#endif
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> SimpleTypeIdentifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return SimpleTypeIdentifierSyntax(root: root, data: newData)
  }
  public var genericArgumentClause: GenericArgumentClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericArgumentClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericArgumentClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericArgumentClause` replaced.
  /// - param newChild: The new `genericArgumentClause` to replace the node's
  ///                   current `genericArgumentClause`, if present.
  public func withGenericArgumentClause(
    _ newChild: GenericArgumentClauseSyntax?) -> SimpleTypeIdentifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericArgumentClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericArgumentClause)
    return SimpleTypeIdentifierSyntax(root: root, data: newData)
  }

  /// Determines if two `SimpleTypeIdentifierSyntax` nodes are equal to each other.
  public static func ==(lhs: SimpleTypeIdentifierSyntax, rhs: SimpleTypeIdentifierSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct MemberTypeIdentifierSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case baseType
    case period
    case name
    case genericArgumentClause
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `MemberTypeIdentifierSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _baseType = raw[Cursor.type]
    precondition(_baseType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_baseType.kind)")
    let _period = raw[Cursor.token]
    guard let _periodTokenKind = _period.tokenKind else {
      fatalError("expected token child, got \(_period.kind)")
    }
    precondition([.period, .prefixPeriod].contains(_periodTokenKind),
      "expected one of [.period, .prefixPeriod] for 'period' " + 
      "in node of kind memberTypeIdentifier")
    let _name = raw[Cursor.token]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier, .capitalSelfKeyword, .anyKeyword].contains(_nameTokenKind),
      "expected one of [.identifier, .capitalSelfKeyword, .anyKeyword] for 'name' " + 
      "in node of kind memberTypeIdentifier")
    let _genericArgumentClause = raw[Cursor.genericArgumentClause]
    precondition(_genericArgumentClause.kind == .genericArgumentClause,
                 "expected child of kind .genericArgumentClause, " +
                 "got \(_genericArgumentClause.kind)")
  }
#endif
  public var baseType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.baseType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `baseType` replaced.
  /// - param newChild: The new `baseType` to replace the node's
  ///                   current `baseType`, if present.
  public func withBaseType(
    _ newChild: TypeSyntax?) -> MemberTypeIdentifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.baseType)
    return MemberTypeIdentifierSyntax(root: root, data: newData)
  }
  public var period: TokenSyntax {
    let child = data.cachedChild(at: Cursor.period)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `period` replaced.
  /// - param newChild: The new `period` to replace the node's
  ///                   current `period`, if present.
  public func withPeriod(
    _ newChild: TokenSyntax?) -> MemberTypeIdentifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.period)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.period)
    return MemberTypeIdentifierSyntax(root: root, data: newData)
  }
  public var name: TokenSyntax {
    let child = data.cachedChild(at: Cursor.name)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> MemberTypeIdentifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return MemberTypeIdentifierSyntax(root: root, data: newData)
  }
  public var genericArgumentClause: GenericArgumentClauseSyntax? {
    let child = data.cachedChild(at: Cursor.genericArgumentClause)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? GenericArgumentClauseSyntax
  }

  /// Returns a copy of the receiver with its `genericArgumentClause` replaced.
  /// - param newChild: The new `genericArgumentClause` to replace the node's
  ///                   current `genericArgumentClause`, if present.
  public func withGenericArgumentClause(
    _ newChild: GenericArgumentClauseSyntax?) -> MemberTypeIdentifierSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericArgumentClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.genericArgumentClause)
    return MemberTypeIdentifierSyntax(root: root, data: newData)
  }

  /// Determines if two `MemberTypeIdentifierSyntax` nodes are equal to each other.
  public static func ==(lhs: MemberTypeIdentifierSyntax, rhs: MemberTypeIdentifierSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ArrayTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftSquareBracket
    case elementType
    case rightSquareBracket
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ArrayTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftSquareBracket = raw[Cursor.leftSquareBracketToken]
    guard let _leftSquareBracketTokenKind = _leftSquareBracket.tokenKind else {
      fatalError("expected token child, got \(_leftSquareBracket.kind)")
    }
    precondition([.leftSquareBracket].contains(_leftSquareBracketTokenKind),
      "expected one of [.leftSquareBracket] for 'leftSquareBracket' " + 
      "in node of kind arrayType")
    let _elementType = raw[Cursor.type]
    precondition(_elementType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_elementType.kind)")
    let _rightSquareBracket = raw[Cursor.rightSquareBracketToken]
    guard let _rightSquareBracketTokenKind = _rightSquareBracket.tokenKind else {
      fatalError("expected token child, got \(_rightSquareBracket.kind)")
    }
    precondition([.rightSquareBracket].contains(_rightSquareBracketTokenKind),
      "expected one of [.rightSquareBracket] for 'rightSquareBracket' " + 
      "in node of kind arrayType")
  }
#endif
  public var leftSquareBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftSquareBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftSquareBracket` replaced.
  /// - param newChild: The new `leftSquareBracket` to replace the node's
  ///                   current `leftSquareBracket`, if present.
  public func withLeftSquareBracket(
    _ newChild: TokenSyntax?) -> ArrayTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftSquareBracket)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftSquareBracket)
    return ArrayTypeSyntax(root: root, data: newData)
  }
  public var elementType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.elementType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `elementType` replaced.
  /// - param newChild: The new `elementType` to replace the node's
  ///                   current `elementType`, if present.
  public func withElementType(
    _ newChild: TypeSyntax?) -> ArrayTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elementType)
    return ArrayTypeSyntax(root: root, data: newData)
  }
  public var rightSquareBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightSquareBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightSquareBracket` replaced.
  /// - param newChild: The new `rightSquareBracket` to replace the node's
  ///                   current `rightSquareBracket`, if present.
  public func withRightSquareBracket(
    _ newChild: TokenSyntax?) -> ArrayTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightSquareBracket)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightSquareBracket)
    return ArrayTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `ArrayTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: ArrayTypeSyntax, rhs: ArrayTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct DictionaryTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftSquareBracket
    case keyType
    case colon
    case valueType
    case rightSquareBracket
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `DictionaryTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 5)
    let _leftSquareBracket = raw[Cursor.leftSquareBracketToken]
    guard let _leftSquareBracketTokenKind = _leftSquareBracket.tokenKind else {
      fatalError("expected token child, got \(_leftSquareBracket.kind)")
    }
    precondition([.leftSquareBracket].contains(_leftSquareBracketTokenKind),
      "expected one of [.leftSquareBracket] for 'leftSquareBracket' " + 
      "in node of kind dictionaryType")
    let _keyType = raw[Cursor.type]
    precondition(_keyType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_keyType.kind)")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind dictionaryType")
    let _valueType = raw[Cursor.type]
    precondition(_valueType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_valueType.kind)")
    let _rightSquareBracket = raw[Cursor.rightSquareBracketToken]
    guard let _rightSquareBracketTokenKind = _rightSquareBracket.tokenKind else {
      fatalError("expected token child, got \(_rightSquareBracket.kind)")
    }
    precondition([.rightSquareBracket].contains(_rightSquareBracketTokenKind),
      "expected one of [.rightSquareBracket] for 'rightSquareBracket' " + 
      "in node of kind dictionaryType")
  }
#endif
  public var leftSquareBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftSquareBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftSquareBracket` replaced.
  /// - param newChild: The new `leftSquareBracket` to replace the node's
  ///                   current `leftSquareBracket`, if present.
  public func withLeftSquareBracket(
    _ newChild: TokenSyntax?) -> DictionaryTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftSquareBracket)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftSquareBracket)
    return DictionaryTypeSyntax(root: root, data: newData)
  }
  public var keyType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.keyType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `keyType` replaced.
  /// - param newChild: The new `keyType` to replace the node's
  ///                   current `keyType`, if present.
  public func withKeyType(
    _ newChild: TypeSyntax?) -> DictionaryTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.keyType)
    return DictionaryTypeSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> DictionaryTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return DictionaryTypeSyntax(root: root, data: newData)
  }
  public var valueType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.valueType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `valueType` replaced.
  /// - param newChild: The new `valueType` to replace the node's
  ///                   current `valueType`, if present.
  public func withValueType(
    _ newChild: TypeSyntax?) -> DictionaryTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.valueType)
    return DictionaryTypeSyntax(root: root, data: newData)
  }
  public var rightSquareBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightSquareBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightSquareBracket` replaced.
  /// - param newChild: The new `rightSquareBracket` to replace the node's
  ///                   current `rightSquareBracket`, if present.
  public func withRightSquareBracket(
    _ newChild: TokenSyntax?) -> DictionaryTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightSquareBracket)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightSquareBracket)
    return DictionaryTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `DictionaryTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: DictionaryTypeSyntax, rhs: DictionaryTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct MetatypeTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case baseType
    case period
    case typeOrProtocol
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `MetatypeTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _baseType = raw[Cursor.type]
    precondition(_baseType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_baseType.kind)")
    let _period = raw[Cursor.periodToken]
    guard let _periodTokenKind = _period.tokenKind else {
      fatalError("expected token child, got \(_period.kind)")
    }
    precondition([.period].contains(_periodTokenKind),
      "expected one of [.period] for 'period' " + 
      "in node of kind metatypeType")
    let _typeOrProtocol = raw[Cursor.identifierToken]
    guard let _typeOrProtocolTokenKind = _typeOrProtocol.tokenKind else {
      fatalError("expected token child, got \(_typeOrProtocol.kind)")
    }
    precondition([.identifier].contains(_typeOrProtocolTokenKind),
      "expected one of [.identifier] for 'typeOrProtocol' " + 
      "in node of kind metatypeType")
  }
#endif
  public var baseType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.baseType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `baseType` replaced.
  /// - param newChild: The new `baseType` to replace the node's
  ///                   current `baseType`, if present.
  public func withBaseType(
    _ newChild: TypeSyntax?) -> MetatypeTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.baseType)
    return MetatypeTypeSyntax(root: root, data: newData)
  }
  public var period: TokenSyntax {
    let child = data.cachedChild(at: Cursor.period)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `period` replaced.
  /// - param newChild: The new `period` to replace the node's
  ///                   current `period`, if present.
  public func withPeriod(
    _ newChild: TokenSyntax?) -> MetatypeTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.period)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.period)
    return MetatypeTypeSyntax(root: root, data: newData)
  }
  public var typeOrProtocol: TokenSyntax {
    let child = data.cachedChild(at: Cursor.typeOrProtocol)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `typeOrProtocol` replaced.
  /// - param newChild: The new `typeOrProtocol` to replace the node's
  ///                   current `typeOrProtocol`, if present.
  public func withTypeOrProtocol(
    _ newChild: TokenSyntax?) -> MetatypeTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeOrProtocol)
    return MetatypeTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `MetatypeTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: MetatypeTypeSyntax, rhs: MetatypeTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct OptionalTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case wrappedType
    case questionMark
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `OptionalTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _wrappedType = raw[Cursor.type]
    precondition(_wrappedType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_wrappedType.kind)")
    let _questionMark = raw[Cursor.postfixQuestionMarkToken]
    guard let _questionMarkTokenKind = _questionMark.tokenKind else {
      fatalError("expected token child, got \(_questionMark.kind)")
    }
    precondition([.postfixQuestionMark].contains(_questionMarkTokenKind),
      "expected one of [.postfixQuestionMark] for 'questionMark' " + 
      "in node of kind optionalType")
  }
#endif
  public var wrappedType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.wrappedType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `wrappedType` replaced.
  /// - param newChild: The new `wrappedType` to replace the node's
  ///                   current `wrappedType`, if present.
  public func withWrappedType(
    _ newChild: TypeSyntax?) -> OptionalTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.wrappedType)
    return OptionalTypeSyntax(root: root, data: newData)
  }
  public var questionMark: TokenSyntax {
    let child = data.cachedChild(at: Cursor.questionMark)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `questionMark` replaced.
  /// - param newChild: The new `questionMark` to replace the node's
  ///                   current `questionMark`, if present.
  public func withQuestionMark(
    _ newChild: TokenSyntax?) -> OptionalTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.postfixQuestionMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.questionMark)
    return OptionalTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `OptionalTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: OptionalTypeSyntax, rhs: OptionalTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ImplicitlyUnwrappedOptionalTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case wrappedType
    case exclamationMark
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ImplicitlyUnwrappedOptionalTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _wrappedType = raw[Cursor.type]
    precondition(_wrappedType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_wrappedType.kind)")
    let _exclamationMark = raw[Cursor.exclamationMarkToken]
    guard let _exclamationMarkTokenKind = _exclamationMark.tokenKind else {
      fatalError("expected token child, got \(_exclamationMark.kind)")
    }
    precondition([.exclamationMark].contains(_exclamationMarkTokenKind),
      "expected one of [.exclamationMark] for 'exclamationMark' " + 
      "in node of kind implicitlyUnwrappedOptionalType")
  }
#endif
  public var wrappedType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.wrappedType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `wrappedType` replaced.
  /// - param newChild: The new `wrappedType` to replace the node's
  ///                   current `wrappedType`, if present.
  public func withWrappedType(
    _ newChild: TypeSyntax?) -> ImplicitlyUnwrappedOptionalTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.wrappedType)
    return ImplicitlyUnwrappedOptionalTypeSyntax(root: root, data: newData)
  }
  public var exclamationMark: TokenSyntax {
    let child = data.cachedChild(at: Cursor.exclamationMark)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `exclamationMark` replaced.
  /// - param newChild: The new `exclamationMark` to replace the node's
  ///                   current `exclamationMark`, if present.
  public func withExclamationMark(
    _ newChild: TokenSyntax?) -> ImplicitlyUnwrappedOptionalTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.exclamationMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.exclamationMark)
    return ImplicitlyUnwrappedOptionalTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `ImplicitlyUnwrappedOptionalTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: ImplicitlyUnwrappedOptionalTypeSyntax, rhs: ImplicitlyUnwrappedOptionalTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct CompositionTypeElementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case type
    case ampersand
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `CompositionTypeElementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _type = raw[Cursor.type]
    precondition(_type.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_type.kind)")
    let _ampersand = raw[Cursor.token]
    guard let _ampersandTokenKind = _ampersand.tokenKind else {
      fatalError("expected token child, got \(_ampersand.kind)")
    }
    precondition(["&"].contains(_ampersandTokenKind.text),
                 "expected one of '[&]', got " +
                 "'\(_ampersandTokenKind.text)'")
  }
#endif
  public var type: TypeSyntax {
    let child = data.cachedChild(at: Cursor.type)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.type)
    return CompositionTypeElementSyntax(root: root, data: newData)
  }
  public var ampersand: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.ampersand)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `ampersand` replaced.
  /// - param newChild: The new `ampersand` to replace the node's
  ///                   current `ampersand`, if present.
  public func withAmpersand(
    _ newChild: TokenSyntax?) -> CompositionTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.ampersand)
    return CompositionTypeElementSyntax(root: root, data: newData)
  }

  /// Determines if two `CompositionTypeElementSyntax` nodes are equal to each other.
  public static func ==(lhs: CompositionTypeElementSyntax, rhs: CompositionTypeElementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct CompositionTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case elements
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `CompositionTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _elements = raw[Cursor.compositionTypeElementList]
    precondition(_elements.kind == .compositionTypeElementList,
                 "expected child of kind .compositionTypeElementList, " +
                 "got \(_elements.kind)")
  }
#endif
  public var elements: CompositionTypeElementListSyntax {
    let child = data.cachedChild(at: Cursor.elements)
    return makeSyntax(root: _root, data: child!) as! CompositionTypeElementListSyntax
  }

  /// Adds the provided `CompositionTypeElement` to the node's `elements`
  /// collection.
  /// - param element: The new `CompositionTypeElement` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `CompositionTypeElement`
  ///            appended to its `elements` collection.
  public func addCompositionTypeElement(_ element: CompositionTypeElementSyntax) -> CompositionTypeSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.elements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.compositionTypeElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.elements)
    return CompositionTypeSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(
    _ newChild: CompositionTypeElementListSyntax?) -> CompositionTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.compositionTypeElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elements)
    return CompositionTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `CompositionTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: CompositionTypeSyntax, rhs: CompositionTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TupleTypeElementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case inOut
    case name
    case secondName
    case colon
    case type
    case ellipsis
    case initializer
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TupleTypeElementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 8)
    let _inOut = raw[Cursor.inOutToken]
    precondition(_inOut.kind == .inOutToken,
                 "expected child of kind .inOutToken, " +
                 "got \(_inOut.kind)")
    let _name = raw[Cursor.token]
    guard let _nameTokenKind = _name.tokenKind else {
      fatalError("expected token child, got \(_name.kind)")
    }
    precondition([.identifier, .wildcardKeyword].contains(_nameTokenKind),
      "expected one of [.identifier, .wildcardKeyword] for 'name' " + 
      "in node of kind tupleTypeElement")
    let _secondName = raw[Cursor.token]
    guard let _secondNameTokenKind = _secondName.tokenKind else {
      fatalError("expected token child, got \(_secondName.kind)")
    }
    precondition([.identifier, .wildcardKeyword].contains(_secondNameTokenKind),
      "expected one of [.identifier, .wildcardKeyword] for 'secondName' " + 
      "in node of kind tupleTypeElement")
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind tupleTypeElement")
    let _type = raw[Cursor.type]
    precondition(_type.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_type.kind)")
    let _ellipsis = raw[Cursor.token]
    precondition(_ellipsis.kind == .token,
                 "expected child of kind .token, " +
                 "got \(_ellipsis.kind)")
    let _initializer = raw[Cursor.initializerClause]
    precondition(_initializer.kind == .initializerClause,
                 "expected child of kind .initializerClause, " +
                 "got \(_initializer.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind tupleTypeElement")
  }
#endif
  public var inOut: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.inOut)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `inOut` replaced.
  /// - param newChild: The new `inOut` to replace the node's
  ///                   current `inOut`, if present.
  public func withInOut(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.inOut)
    return TupleTypeElementSyntax(root: root, data: newData)
  }
  public var name: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.name)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `name` replaced.
  /// - param newChild: The new `name` to replace the node's
  ///                   current `name`, if present.
  public func withName(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.name)
    return TupleTypeElementSyntax(root: root, data: newData)
  }
  public var secondName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.secondName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `secondName` replaced.
  /// - param newChild: The new `secondName` to replace the node's
  ///                   current `secondName`, if present.
  public func withSecondName(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.secondName)
    return TupleTypeElementSyntax(root: root, data: newData)
  }
  public var colon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.colon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return TupleTypeElementSyntax(root: root, data: newData)
  }
  public var type: TypeSyntax {
    let child = data.cachedChild(at: Cursor.type)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.type)
    return TupleTypeElementSyntax(root: root, data: newData)
  }
  public var ellipsis: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.ellipsis)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `ellipsis` replaced.
  /// - param newChild: The new `ellipsis` to replace the node's
  ///                   current `ellipsis`, if present.
  public func withEllipsis(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.ellipsis)
    return TupleTypeElementSyntax(root: root, data: newData)
  }
  public var initializer: InitializerClauseSyntax? {
    let child = data.cachedChild(at: Cursor.initializer)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? InitializerClauseSyntax
  }

  /// Returns a copy of the receiver with its `initializer` replaced.
  /// - param newChild: The new `initializer` to replace the node's
  ///                   current `initializer`, if present.
  public func withInitializer(
    _ newChild: InitializerClauseSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.initializerClause)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.initializer)
    return TupleTypeElementSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TupleTypeElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return TupleTypeElementSyntax(root: root, data: newData)
  }

  /// Determines if two `TupleTypeElementSyntax` nodes are equal to each other.
  public static func ==(lhs: TupleTypeElementSyntax, rhs: TupleTypeElementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TupleTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftParen
    case elements
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TupleTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind tupleType")
    let _elements = raw[Cursor.tupleTypeElementList]
    precondition(_elements.kind == .tupleTypeElementList,
                 "expected child of kind .tupleTypeElementList, " +
                 "got \(_elements.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind tupleType")
  }
#endif
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> TupleTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return TupleTypeSyntax(root: root, data: newData)
  }
  public var elements: TupleTypeElementListSyntax {
    let child = data.cachedChild(at: Cursor.elements)
    return makeSyntax(root: _root, data: child!) as! TupleTypeElementListSyntax
  }

  /// Adds the provided `TupleTypeElement` to the node's `elements`
  /// collection.
  /// - param element: The new `TupleTypeElement` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `TupleTypeElement`
  ///            appended to its `elements` collection.
  public func addTupleTypeElement(_ element: TupleTypeElementSyntax) -> TupleTypeSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.elements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.tupleTypeElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.elements)
    return TupleTypeSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(
    _ newChild: TupleTypeElementListSyntax?) -> TupleTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.tupleTypeElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elements)
    return TupleTypeSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> TupleTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return TupleTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `TupleTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: TupleTypeSyntax, rhs: TupleTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct FunctionTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftParen
    case arguments
    case rightParen
    case throwsOrRethrowsKeyword
    case arrow
    case returnType
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `FunctionTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 6)
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind functionType")
    let _arguments = raw[Cursor.tupleTypeElementList]
    precondition(_arguments.kind == .tupleTypeElementList,
                 "expected child of kind .tupleTypeElementList, " +
                 "got \(_arguments.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind functionType")
    let _throwsOrRethrowsKeyword = raw[Cursor.token]
    guard let _throwsOrRethrowsKeywordTokenKind = _throwsOrRethrowsKeyword.tokenKind else {
      fatalError("expected token child, got \(_throwsOrRethrowsKeyword.kind)")
    }
    precondition([.throwsKeyword, .rethrowsKeyword, .throwKeyword].contains(_throwsOrRethrowsKeywordTokenKind),
      "expected one of [.throwsKeyword, .rethrowsKeyword, .throwKeyword] for 'throwsOrRethrowsKeyword' " + 
      "in node of kind functionType")
    let _arrow = raw[Cursor.arrowToken]
    guard let _arrowTokenKind = _arrow.tokenKind else {
      fatalError("expected token child, got \(_arrow.kind)")
    }
    precondition([.arrow].contains(_arrowTokenKind),
      "expected one of [.arrow] for 'arrow' " + 
      "in node of kind functionType")
    let _returnType = raw[Cursor.type]
    precondition(_returnType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_returnType.kind)")
  }
#endif
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> FunctionTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return FunctionTypeSyntax(root: root, data: newData)
  }
  public var arguments: TupleTypeElementListSyntax {
    let child = data.cachedChild(at: Cursor.arguments)
    return makeSyntax(root: _root, data: child!) as! TupleTypeElementListSyntax
  }

  /// Adds the provided `TupleTypeElement` to the node's `arguments`
  /// collection.
  /// - param element: The new `TupleTypeElement` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `TupleTypeElement`
  ///            appended to its `arguments` collection.
  public func addTupleTypeElement(_ element: TupleTypeElementSyntax) -> FunctionTypeSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.arguments] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.tupleTypeElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.arguments)
    return FunctionTypeSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: TupleTypeElementListSyntax?) -> FunctionTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.tupleTypeElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.arguments)
    return FunctionTypeSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> FunctionTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return FunctionTypeSyntax(root: root, data: newData)
  }
  public var throwsOrRethrowsKeyword: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.throwsOrRethrowsKeyword)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `throwsOrRethrowsKeyword` replaced.
  /// - param newChild: The new `throwsOrRethrowsKeyword` to replace the node's
  ///                   current `throwsOrRethrowsKeyword`, if present.
  public func withThrowsOrRethrowsKeyword(
    _ newChild: TokenSyntax?) -> FunctionTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.throwsKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.throwsOrRethrowsKeyword)
    return FunctionTypeSyntax(root: root, data: newData)
  }
  public var arrow: TokenSyntax {
    let child = data.cachedChild(at: Cursor.arrow)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `arrow` replaced.
  /// - param newChild: The new `arrow` to replace the node's
  ///                   current `arrow`, if present.
  public func withArrow(
    _ newChild: TokenSyntax?) -> FunctionTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.arrow)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.arrow)
    return FunctionTypeSyntax(root: root, data: newData)
  }
  public var returnType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.returnType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `returnType` replaced.
  /// - param newChild: The new `returnType` to replace the node's
  ///                   current `returnType`, if present.
  public func withReturnType(
    _ newChild: TypeSyntax?) -> FunctionTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.returnType)
    return FunctionTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `FunctionTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: FunctionTypeSyntax, rhs: FunctionTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AttributedTypeSyntax: TypeSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case specifier
    case attributes
    case baseType
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AttributedTypeSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _specifier = raw[Cursor.token]
    guard let _specifierTokenKind = _specifier.tokenKind else {
      fatalError("expected token child, got \(_specifier.kind)")
    }
    precondition(["inout", "__shared", "__owned"].contains(_specifierTokenKind.text),
                 "expected one of '[inout, __shared, __owned]', got " +
                 "'\(_specifierTokenKind.text)'")
    let _attributes = raw[Cursor.attributeList]
    precondition(_attributes.kind == .attributeList,
                 "expected child of kind .attributeList, " +
                 "got \(_attributes.kind)")
    let _baseType = raw[Cursor.type]
    precondition(_baseType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_baseType.kind)")
  }
#endif
  public var specifier: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.specifier)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `specifier` replaced.
  /// - param newChild: The new `specifier` to replace the node's
  ///                   current `specifier`, if present.
  public func withSpecifier(
    _ newChild: TokenSyntax?) -> AttributedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.unknown)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.specifier)
    return AttributedTypeSyntax(root: root, data: newData)
  }
  public var attributes: AttributeListSyntax? {
    let child = data.cachedChild(at: Cursor.attributes)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? AttributeListSyntax
  }

  /// Adds the provided `Attribute` to the node's `attributes`
  /// collection.
  /// - param element: The new `Attribute` to add to the node's
  ///                  `attributes` collection.
  /// - returns: A copy of the receiver with the provided `Attribute`
  ///            appended to its `attributes` collection.
  public func addAttribute(_ element: AttributeSyntax) -> AttributedTypeSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.attributes] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.attributeList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.attributes)
    return AttributedTypeSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `attributes` replaced.
  /// - param newChild: The new `attributes` to replace the node's
  ///                   current `attributes`, if present.
  public func withAttributes(
    _ newChild: AttributeListSyntax?) -> AttributedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.attributeList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.attributes)
    return AttributedTypeSyntax(root: root, data: newData)
  }
  public var baseType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.baseType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `baseType` replaced.
  /// - param newChild: The new `baseType` to replace the node's
  ///                   current `baseType`, if present.
  public func withBaseType(
    _ newChild: TypeSyntax?) -> AttributedTypeSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.baseType)
    return AttributedTypeSyntax(root: root, data: newData)
  }

  /// Determines if two `AttributedTypeSyntax` nodes are equal to each other.
  public static func ==(lhs: AttributedTypeSyntax, rhs: AttributedTypeSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct GenericArgumentSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case argumentType
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `GenericArgumentSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _argumentType = raw[Cursor.type]
    precondition(_argumentType.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_argumentType.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind genericArgument")
  }
#endif
  public var argumentType: TypeSyntax {
    let child = data.cachedChild(at: Cursor.argumentType)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `argumentType` replaced.
  /// - param newChild: The new `argumentType` to replace the node's
  ///                   current `argumentType`, if present.
  public func withArgumentType(
    _ newChild: TypeSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.argumentType)
    return GenericArgumentSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> GenericArgumentSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return GenericArgumentSyntax(root: root, data: newData)
  }

  /// Determines if two `GenericArgumentSyntax` nodes are equal to each other.
  public static func ==(lhs: GenericArgumentSyntax, rhs: GenericArgumentSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct GenericArgumentClauseSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftAngleBracket
    case arguments
    case rightAngleBracket
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `GenericArgumentClauseSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftAngleBracket = raw[Cursor.leftAngleToken]
    guard let _leftAngleBracketTokenKind = _leftAngleBracket.tokenKind else {
      fatalError("expected token child, got \(_leftAngleBracket.kind)")
    }
    precondition([.leftAngle].contains(_leftAngleBracketTokenKind),
      "expected one of [.leftAngle] for 'leftAngleBracket' " + 
      "in node of kind genericArgumentClause")
    let _arguments = raw[Cursor.genericArgumentList]
    precondition(_arguments.kind == .genericArgumentList,
                 "expected child of kind .genericArgumentList, " +
                 "got \(_arguments.kind)")
    let _rightAngleBracket = raw[Cursor.rightAngleToken]
    guard let _rightAngleBracketTokenKind = _rightAngleBracket.tokenKind else {
      fatalError("expected token child, got \(_rightAngleBracket.kind)")
    }
    precondition([.rightAngle].contains(_rightAngleBracketTokenKind),
      "expected one of [.rightAngle] for 'rightAngleBracket' " + 
      "in node of kind genericArgumentClause")
  }
#endif
  public var leftAngleBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftAngleBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftAngleBracket` replaced.
  /// - param newChild: The new `leftAngleBracket` to replace the node's
  ///                   current `leftAngleBracket`, if present.
  public func withLeftAngleBracket(
    _ newChild: TokenSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftAngle)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftAngleBracket)
    return GenericArgumentClauseSyntax(root: root, data: newData)
  }
  public var arguments: GenericArgumentListSyntax {
    let child = data.cachedChild(at: Cursor.arguments)
    return makeSyntax(root: _root, data: child!) as! GenericArgumentListSyntax
  }

  /// Adds the provided `GenericArgument` to the node's `arguments`
  /// collection.
  /// - param element: The new `GenericArgument` to add to the node's
  ///                  `arguments` collection.
  /// - returns: A copy of the receiver with the provided `GenericArgument`
  ///            appended to its `arguments` collection.
  public func addGenericArgument(_ element: GenericArgumentSyntax) -> GenericArgumentClauseSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.arguments] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.genericArgumentList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.arguments)
    return GenericArgumentClauseSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `arguments` replaced.
  /// - param newChild: The new `arguments` to replace the node's
  ///                   current `arguments`, if present.
  public func withArguments(
    _ newChild: GenericArgumentListSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.genericArgumentList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.arguments)
    return GenericArgumentClauseSyntax(root: root, data: newData)
  }
  public var rightAngleBracket: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightAngleBracket)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightAngleBracket` replaced.
  /// - param newChild: The new `rightAngleBracket` to replace the node's
  ///                   current `rightAngleBracket`, if present.
  public func withRightAngleBracket(
    _ newChild: TokenSyntax?) -> GenericArgumentClauseSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightAngle)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightAngleBracket)
    return GenericArgumentClauseSyntax(root: root, data: newData)
  }

  /// Determines if two `GenericArgumentClauseSyntax` nodes are equal to each other.
  public static func ==(lhs: GenericArgumentClauseSyntax, rhs: GenericArgumentClauseSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TypeAnnotationSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case colon
    case type
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TypeAnnotationSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _colon = raw[Cursor.colonToken]
    guard let _colonTokenKind = _colon.tokenKind else {
      fatalError("expected token child, got \(_colon.kind)")
    }
    precondition([.colon].contains(_colonTokenKind),
      "expected one of [.colon] for 'colon' " + 
      "in node of kind typeAnnotation")
    let _type = raw[Cursor.type]
    precondition(_type.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_type.kind)")
  }
#endif
  public var colon: TokenSyntax {
    let child = data.cachedChild(at: Cursor.colon)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `colon` replaced.
  /// - param newChild: The new `colon` to replace the node's
  ///                   current `colon`, if present.
  public func withColon(
    _ newChild: TokenSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.colon)
    return TypeAnnotationSyntax(root: root, data: newData)
  }
  public var type: TypeSyntax {
    let child = data.cachedChild(at: Cursor.type)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> TypeAnnotationSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.type)
    return TypeAnnotationSyntax(root: root, data: newData)
  }

  /// Determines if two `TypeAnnotationSyntax` nodes are equal to each other.
  public static func ==(lhs: TypeAnnotationSyntax, rhs: TypeAnnotationSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct EnumCasePatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case type
    case period
    case caseName
    case associatedTuple
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `EnumCasePatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _type = raw[Cursor.type]
    precondition(_type.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_type.kind)")
    let _period = raw[Cursor.periodToken]
    guard let _periodTokenKind = _period.tokenKind else {
      fatalError("expected token child, got \(_period.kind)")
    }
    precondition([.period].contains(_periodTokenKind),
      "expected one of [.period] for 'period' " + 
      "in node of kind enumCasePattern")
    let _caseName = raw[Cursor.identifierToken]
    guard let _caseNameTokenKind = _caseName.tokenKind else {
      fatalError("expected token child, got \(_caseName.kind)")
    }
    precondition([.identifier].contains(_caseNameTokenKind),
      "expected one of [.identifier] for 'caseName' " + 
      "in node of kind enumCasePattern")
    let _associatedTuple = raw[Cursor.tuplePattern]
    precondition(_associatedTuple.kind == .tuplePattern,
                 "expected child of kind .tuplePattern, " +
                 "got \(_associatedTuple.kind)")
  }
#endif
  public var type: TypeSyntax? {
    let child = data.cachedChild(at: Cursor.type)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeSyntax
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> EnumCasePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.type)
    return EnumCasePatternSyntax(root: root, data: newData)
  }
  public var period: TokenSyntax {
    let child = data.cachedChild(at: Cursor.period)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `period` replaced.
  /// - param newChild: The new `period` to replace the node's
  ///                   current `period`, if present.
  public func withPeriod(
    _ newChild: TokenSyntax?) -> EnumCasePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.period)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.period)
    return EnumCasePatternSyntax(root: root, data: newData)
  }
  public var caseName: TokenSyntax {
    let child = data.cachedChild(at: Cursor.caseName)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `caseName` replaced.
  /// - param newChild: The new `caseName` to replace the node's
  ///                   current `caseName`, if present.
  public func withCaseName(
    _ newChild: TokenSyntax?) -> EnumCasePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.caseName)
    return EnumCasePatternSyntax(root: root, data: newData)
  }
  public var associatedTuple: TuplePatternSyntax? {
    let child = data.cachedChild(at: Cursor.associatedTuple)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TuplePatternSyntax
  }

  /// Returns a copy of the receiver with its `associatedTuple` replaced.
  /// - param newChild: The new `associatedTuple` to replace the node's
  ///                   current `associatedTuple`, if present.
  public func withAssociatedTuple(
    _ newChild: TuplePatternSyntax?) -> EnumCasePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.tuplePattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.associatedTuple)
    return EnumCasePatternSyntax(root: root, data: newData)
  }

  /// Determines if two `EnumCasePatternSyntax` nodes are equal to each other.
  public static func ==(lhs: EnumCasePatternSyntax, rhs: EnumCasePatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct IsTypePatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case isKeyword
    case type
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `IsTypePatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _isKeyword = raw[Cursor.isToken]
    guard let _isKeywordTokenKind = _isKeyword.tokenKind else {
      fatalError("expected token child, got \(_isKeyword.kind)")
    }
    precondition([.isKeyword].contains(_isKeywordTokenKind),
      "expected one of [.isKeyword] for 'isKeyword' " + 
      "in node of kind isTypePattern")
    let _type = raw[Cursor.type]
    precondition(_type.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_type.kind)")
  }
#endif
  public var isKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.isKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `isKeyword` replaced.
  /// - param newChild: The new `isKeyword` to replace the node's
  ///                   current `isKeyword`, if present.
  public func withIsKeyword(
    _ newChild: TokenSyntax?) -> IsTypePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.isKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.isKeyword)
    return IsTypePatternSyntax(root: root, data: newData)
  }
  public var type: TypeSyntax {
    let child = data.cachedChild(at: Cursor.type)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> IsTypePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.type)
    return IsTypePatternSyntax(root: root, data: newData)
  }

  /// Determines if two `IsTypePatternSyntax` nodes are equal to each other.
  public static func ==(lhs: IsTypePatternSyntax, rhs: IsTypePatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct OptionalPatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case subPattern
    case questionMark
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `OptionalPatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _subPattern = raw[Cursor.pattern]
    precondition(_subPattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_subPattern.kind)")
    let _questionMark = raw[Cursor.postfixQuestionMarkToken]
    guard let _questionMarkTokenKind = _questionMark.tokenKind else {
      fatalError("expected token child, got \(_questionMark.kind)")
    }
    precondition([.postfixQuestionMark].contains(_questionMarkTokenKind),
      "expected one of [.postfixQuestionMark] for 'questionMark' " + 
      "in node of kind optionalPattern")
  }
#endif
  public var subPattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.subPattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `subPattern` replaced.
  /// - param newChild: The new `subPattern` to replace the node's
  ///                   current `subPattern`, if present.
  public func withSubPattern(
    _ newChild: PatternSyntax?) -> OptionalPatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.subPattern)
    return OptionalPatternSyntax(root: root, data: newData)
  }
  public var questionMark: TokenSyntax {
    let child = data.cachedChild(at: Cursor.questionMark)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `questionMark` replaced.
  /// - param newChild: The new `questionMark` to replace the node's
  ///                   current `questionMark`, if present.
  public func withQuestionMark(
    _ newChild: TokenSyntax?) -> OptionalPatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.postfixQuestionMark)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.questionMark)
    return OptionalPatternSyntax(root: root, data: newData)
  }

  /// Determines if two `OptionalPatternSyntax` nodes are equal to each other.
  public static func ==(lhs: OptionalPatternSyntax, rhs: OptionalPatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct IdentifierPatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case identifier
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `IdentifierPatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _identifier = raw[Cursor.identifierToken]
    guard let _identifierTokenKind = _identifier.tokenKind else {
      fatalError("expected token child, got \(_identifier.kind)")
    }
    precondition([.identifier].contains(_identifierTokenKind),
      "expected one of [.identifier] for 'identifier' " + 
      "in node of kind identifierPattern")
  }
#endif
  public var identifier: TokenSyntax {
    let child = data.cachedChild(at: Cursor.identifier)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `identifier` replaced.
  /// - param newChild: The new `identifier` to replace the node's
  ///                   current `identifier`, if present.
  public func withIdentifier(
    _ newChild: TokenSyntax?) -> IdentifierPatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.identifier)
    return IdentifierPatternSyntax(root: root, data: newData)
  }

  /// Determines if two `IdentifierPatternSyntax` nodes are equal to each other.
  public static func ==(lhs: IdentifierPatternSyntax, rhs: IdentifierPatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct AsTypePatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case pattern
    case asKeyword
    case type
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `AsTypePatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
    let _asKeyword = raw[Cursor.asToken]
    guard let _asKeywordTokenKind = _asKeyword.tokenKind else {
      fatalError("expected token child, got \(_asKeyword.kind)")
    }
    precondition([.asKeyword].contains(_asKeywordTokenKind),
      "expected one of [.asKeyword] for 'asKeyword' " + 
      "in node of kind asTypePattern")
    let _type = raw[Cursor.type]
    precondition(_type.kind == .type,
                 "expected child of kind .type, " +
                 "got \(_type.kind)")
  }
#endif
  public var pattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.pattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> AsTypePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return AsTypePatternSyntax(root: root, data: newData)
  }
  public var asKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.asKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `asKeyword` replaced.
  /// - param newChild: The new `asKeyword` to replace the node's
  ///                   current `asKeyword`, if present.
  public func withAsKeyword(
    _ newChild: TokenSyntax?) -> AsTypePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.asKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.asKeyword)
    return AsTypePatternSyntax(root: root, data: newData)
  }
  public var type: TypeSyntax {
    let child = data.cachedChild(at: Cursor.type)
    return makeSyntax(root: _root, data: child!) as! TypeSyntax
  }

  /// Returns a copy of the receiver with its `type` replaced.
  /// - param newChild: The new `type` to replace the node's
  ///                   current `type`, if present.
  public func withType(
    _ newChild: TypeSyntax?) -> AsTypePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.type)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.type)
    return AsTypePatternSyntax(root: root, data: newData)
  }

  /// Determines if two `AsTypePatternSyntax` nodes are equal to each other.
  public static func ==(lhs: AsTypePatternSyntax, rhs: AsTypePatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TuplePatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case leftParen
    case elements
    case rightParen
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TuplePatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 3)
    let _leftParen = raw[Cursor.leftParenToken]
    guard let _leftParenTokenKind = _leftParen.tokenKind else {
      fatalError("expected token child, got \(_leftParen.kind)")
    }
    precondition([.leftParen].contains(_leftParenTokenKind),
      "expected one of [.leftParen] for 'leftParen' " + 
      "in node of kind tuplePattern")
    let _elements = raw[Cursor.tuplePatternElementList]
    precondition(_elements.kind == .tuplePatternElementList,
                 "expected child of kind .tuplePatternElementList, " +
                 "got \(_elements.kind)")
    let _rightParen = raw[Cursor.rightParenToken]
    guard let _rightParenTokenKind = _rightParen.tokenKind else {
      fatalError("expected token child, got \(_rightParen.kind)")
    }
    precondition([.rightParen].contains(_rightParenTokenKind),
      "expected one of [.rightParen] for 'rightParen' " + 
      "in node of kind tuplePattern")
  }
#endif
  public var leftParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.leftParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `leftParen` replaced.
  /// - param newChild: The new `leftParen` to replace the node's
  ///                   current `leftParen`, if present.
  public func withLeftParen(
    _ newChild: TokenSyntax?) -> TuplePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.leftParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.leftParen)
    return TuplePatternSyntax(root: root, data: newData)
  }
  public var elements: TuplePatternElementListSyntax {
    let child = data.cachedChild(at: Cursor.elements)
    return makeSyntax(root: _root, data: child!) as! TuplePatternElementListSyntax
  }

  /// Adds the provided `TuplePatternElement` to the node's `elements`
  /// collection.
  /// - param element: The new `TuplePatternElement` to add to the node's
  ///                  `elements` collection.
  /// - returns: A copy of the receiver with the provided `TuplePatternElement`
  ///            appended to its `elements` collection.
  public func addTuplePatternElement(_ element: TuplePatternElementSyntax) -> TuplePatternSyntax {
    var collection: RawSyntax
    if let col = raw[Cursor.elements] {
      collection = col.appending(element.raw)
    } else {
      collection = RawSyntax.node(SyntaxKind.tuplePatternElementList,
                                  [element.raw], .present)
    }
    let (root, newData) = data.replacingChild(collection,
                                              at: Cursor.elements)
    return TuplePatternSyntax(root: root, data: newData)
  }

  /// Returns a copy of the receiver with its `elements` replaced.
  /// - param newChild: The new `elements` to replace the node's
  ///                   current `elements`, if present.
  public func withElements(
    _ newChild: TuplePatternElementListSyntax?) -> TuplePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.tuplePatternElementList)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.elements)
    return TuplePatternSyntax(root: root, data: newData)
  }
  public var rightParen: TokenSyntax {
    let child = data.cachedChild(at: Cursor.rightParen)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `rightParen` replaced.
  /// - param newChild: The new `rightParen` to replace the node's
  ///                   current `rightParen`, if present.
  public func withRightParen(
    _ newChild: TokenSyntax?) -> TuplePatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.rightParen)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.rightParen)
    return TuplePatternSyntax(root: root, data: newData)
  }

  /// Determines if two `TuplePatternSyntax` nodes are equal to each other.
  public static func ==(lhs: TuplePatternSyntax, rhs: TuplePatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct WildcardPatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case wildcard
    case typeAnnotation
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `WildcardPatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _wildcard = raw[Cursor.wildcardToken]
    guard let _wildcardTokenKind = _wildcard.tokenKind else {
      fatalError("expected token child, got \(_wildcard.kind)")
    }
    precondition([.wildcardKeyword].contains(_wildcardTokenKind),
      "expected one of [.wildcardKeyword] for 'wildcard' " + 
      "in node of kind wildcardPattern")
    let _typeAnnotation = raw[Cursor.typeAnnotation]
    precondition(_typeAnnotation.kind == .typeAnnotation,
                 "expected child of kind .typeAnnotation, " +
                 "got \(_typeAnnotation.kind)")
  }
#endif
  public var wildcard: TokenSyntax {
    let child = data.cachedChild(at: Cursor.wildcard)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `wildcard` replaced.
  /// - param newChild: The new `wildcard` to replace the node's
  ///                   current `wildcard`, if present.
  public func withWildcard(
    _ newChild: TokenSyntax?) -> WildcardPatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.wildcardKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.wildcard)
    return WildcardPatternSyntax(root: root, data: newData)
  }
  public var typeAnnotation: TypeAnnotationSyntax? {
    let child = data.cachedChild(at: Cursor.typeAnnotation)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TypeAnnotationSyntax
  }

  /// Returns a copy of the receiver with its `typeAnnotation` replaced.
  /// - param newChild: The new `typeAnnotation` to replace the node's
  ///                   current `typeAnnotation`, if present.
  public func withTypeAnnotation(
    _ newChild: TypeAnnotationSyntax?) -> WildcardPatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.typeAnnotation)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.typeAnnotation)
    return WildcardPatternSyntax(root: root, data: newData)
  }

  /// Determines if two `WildcardPatternSyntax` nodes are equal to each other.
  public static func ==(lhs: WildcardPatternSyntax, rhs: WildcardPatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct TuplePatternElementSyntax: Syntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case labelName
    case labelColon
    case pattern
    case trailingComma
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `TuplePatternElementSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 4)
    let _labelName = raw[Cursor.identifierToken]
    guard let _labelNameTokenKind = _labelName.tokenKind else {
      fatalError("expected token child, got \(_labelName.kind)")
    }
    precondition([.identifier].contains(_labelNameTokenKind),
      "expected one of [.identifier] for 'labelName' " + 
      "in node of kind tuplePatternElement")
    let _labelColon = raw[Cursor.colonToken]
    guard let _labelColonTokenKind = _labelColon.tokenKind else {
      fatalError("expected token child, got \(_labelColon.kind)")
    }
    precondition([.colon].contains(_labelColonTokenKind),
      "expected one of [.colon] for 'labelColon' " + 
      "in node of kind tuplePatternElement")
    let _pattern = raw[Cursor.pattern]
    precondition(_pattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_pattern.kind)")
    let _trailingComma = raw[Cursor.commaToken]
    guard let _trailingCommaTokenKind = _trailingComma.tokenKind else {
      fatalError("expected token child, got \(_trailingComma.kind)")
    }
    precondition([.comma].contains(_trailingCommaTokenKind),
      "expected one of [.comma] for 'trailingComma' " + 
      "in node of kind tuplePatternElement")
  }
#endif
  public var labelName: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelName)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelName` replaced.
  /// - param newChild: The new `labelName` to replace the node's
  ///                   current `labelName`, if present.
  public func withLabelName(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.identifier(""))
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelName)
    return TuplePatternElementSyntax(root: root, data: newData)
  }
  public var labelColon: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.labelColon)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `labelColon` replaced.
  /// - param newChild: The new `labelColon` to replace the node's
  ///                   current `labelColon`, if present.
  public func withLabelColon(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.colon)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.labelColon)
    return TuplePatternElementSyntax(root: root, data: newData)
  }
  public var pattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.pattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `pattern` replaced.
  /// - param newChild: The new `pattern` to replace the node's
  ///                   current `pattern`, if present.
  public func withPattern(
    _ newChild: PatternSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.pattern)
    return TuplePatternElementSyntax(root: root, data: newData)
  }
  public var trailingComma: TokenSyntax? {
    let child = data.cachedChild(at: Cursor.trailingComma)
    if child == nil { return nil }
    return makeSyntax(root: _root, data: child!) as? TokenSyntax
  }

  /// Returns a copy of the receiver with its `trailingComma` replaced.
  /// - param newChild: The new `trailingComma` to replace the node's
  ///                   current `trailingComma`, if present.
  public func withTrailingComma(
    _ newChild: TokenSyntax?) -> TuplePatternElementSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.comma)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.trailingComma)
    return TuplePatternElementSyntax(root: root, data: newData)
  }

  /// Determines if two `TuplePatternElementSyntax` nodes are equal to each other.
  public static func ==(lhs: TuplePatternElementSyntax, rhs: TuplePatternElementSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ExpressionPatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case expression
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ExpressionPatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 1)
    let _expression = raw[Cursor.expr]
    precondition(_expression.kind == .expr,
                 "expected child of kind .expr, " +
                 "got \(_expression.kind)")
  }
#endif
  public var expression: ExprSyntax {
    let child = data.cachedChild(at: Cursor.expression)
    return makeSyntax(root: _root, data: child!) as! ExprSyntax
  }

  /// Returns a copy of the receiver with its `expression` replaced.
  /// - param newChild: The new `expression` to replace the node's
  ///                   current `expression`, if present.
  public func withExpression(
    _ newChild: ExprSyntax?) -> ExpressionPatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.expr)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.expression)
    return ExpressionPatternSyntax(root: root, data: newData)
  }

  /// Determines if two `ExpressionPatternSyntax` nodes are equal to each other.
  public static func ==(lhs: ExpressionPatternSyntax, rhs: ExpressionPatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public struct ValueBindingPatternSyntax: PatternSyntax, _SyntaxBase, Hashable {
  enum Cursor: Int {
    case letOrVarKeyword
    case valuePattern
  }

  let _root: SyntaxData
  unowned let _data: SyntaxData 

  /// Creates a `ValueBindingPatternSyntax` node from the provided root and data.
  internal init(root: SyntaxData, data: SyntaxData) {
    self._root = root
    self._data = data
#if DEBUG
    validate()
#endif
  }

#if DEBUG
  func validate() {
      if isMissing { return }
    precondition(raw.layout.count == 2)
    let _letOrVarKeyword = raw[Cursor.token]
    guard let _letOrVarKeywordTokenKind = _letOrVarKeyword.tokenKind else {
      fatalError("expected token child, got \(_letOrVarKeyword.kind)")
    }
    precondition([.letKeyword, .varKeyword].contains(_letOrVarKeywordTokenKind),
      "expected one of [.letKeyword, .varKeyword] for 'letOrVarKeyword' " + 
      "in node of kind valueBindingPattern")
    let _valuePattern = raw[Cursor.pattern]
    precondition(_valuePattern.kind == .pattern,
                 "expected child of kind .pattern, " +
                 "got \(_valuePattern.kind)")
  }
#endif
  public var letOrVarKeyword: TokenSyntax {
    let child = data.cachedChild(at: Cursor.letOrVarKeyword)
    return makeSyntax(root: _root, data: child!) as! TokenSyntax
  }

  /// Returns a copy of the receiver with its `letOrVarKeyword` replaced.
  /// - param newChild: The new `letOrVarKeyword` to replace the node's
  ///                   current `letOrVarKeyword`, if present.
  public func withLetOrVarKeyword(
    _ newChild: TokenSyntax?) -> ValueBindingPatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missingToken(.letKeyword)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.letOrVarKeyword)
    return ValueBindingPatternSyntax(root: root, data: newData)
  }
  public var valuePattern: PatternSyntax {
    let child = data.cachedChild(at: Cursor.valuePattern)
    return makeSyntax(root: _root, data: child!) as! PatternSyntax
  }

  /// Returns a copy of the receiver with its `valuePattern` replaced.
  /// - param newChild: The new `valuePattern` to replace the node's
  ///                   current `valuePattern`, if present.
  public func withValuePattern(
    _ newChild: PatternSyntax?) -> ValueBindingPatternSyntax {
    let raw = newChild?.raw ?? RawSyntax.missing(.pattern)
    let (root, newData) = data.replacingChild(raw,
                                              at: Cursor.valuePattern)
    return ValueBindingPatternSyntax(root: root, data: newData)
  }

  /// Determines if two `ValueBindingPatternSyntax` nodes are equal to each other.
  public static func ==(lhs: ValueBindingPatternSyntax, rhs: ValueBindingPatternSyntax) -> Bool {
    return lhs._data === rhs._data
  }

  /// A unique hash value for this node.
  public var hashValue: Int {
    return ObjectIdentifier(_data).hashValue
  }
}


public protocol DeclGroupSyntax {
  var attributes: AttributeListSyntax? { get }
  func withAttributes(_ newChild: AttributeListSyntax?) -> Self
  var accessLevelModifier: DeclModifierSyntax? { get }
  func withAccessLevelModifier(_ newChild: DeclModifierSyntax?) -> Self
  var members: MemberDeclBlockSyntax { get }
  func withMembers(_ newChild: MemberDeclBlockSyntax?) -> Self
}
public protocol BracedSyntax {
  var leftBrace: TokenSyntax { get }
  func withLeftBrace(_ newChild: TokenSyntax?) -> Self
  var rightBrace: TokenSyntax { get }
  func withRightBrace(_ newChild: TokenSyntax?) -> Self
}
public protocol IdentifiedDeclSyntax {
  var identifier: TokenSyntax { get }
  func withIdentifier(_ newChild: TokenSyntax?) -> Self
}
public protocol WithCodeBlockSyntax {
  var body: CodeBlockSyntax { get }
  func withBody(_ newChild: CodeBlockSyntax?) -> Self
}
public protocol ParenthesizedSyntax {
  var leftParen: TokenSyntax { get }
  func withLeftParen(_ newChild: TokenSyntax?) -> Self
  var rightParen: TokenSyntax { get }
  func withRightParen(_ newChild: TokenSyntax?) -> Self
}
public protocol WithTrailingCommaSyntax {
  var trailingComma: TokenSyntax? { get }
  func withTrailingComma(_ newChild: TokenSyntax?) -> Self
}
public protocol LabeledSyntax {
  var labelName: TokenSyntax? { get }
  func withLabelName(_ newChild: TokenSyntax?) -> Self
  var labelColon: TokenSyntax? { get }
  func withLabelColon(_ newChild: TokenSyntax?) -> Self
}
public protocol WithStatementsSyntax {
  var statements: CodeBlockItemListSyntax { get }
  func withStatements(_ newChild: CodeBlockItemListSyntax?) -> Self
}

extension CodeBlockSyntax: BracedSyntax, WithStatementsSyntax {}
extension DeclNameArgumentsSyntax: ParenthesizedSyntax {}
extension TupleExprSyntax: ParenthesizedSyntax {}
extension FunctionCallArgumentSyntax: WithTrailingCommaSyntax {}
extension TupleElementSyntax: WithTrailingCommaSyntax {}
extension ArrayElementSyntax: WithTrailingCommaSyntax {}
extension DictionaryElementSyntax: WithTrailingCommaSyntax {}
extension ClosureCaptureItemSyntax: WithTrailingCommaSyntax {}
extension ClosureParamSyntax: WithTrailingCommaSyntax {}
extension ClosureExprSyntax: BracedSyntax, WithStatementsSyntax {}
extension ExpressionSegmentSyntax: ParenthesizedSyntax {}
extension ObjcKeyPathExprSyntax: ParenthesizedSyntax {}
extension ObjectLiteralExprSyntax: ParenthesizedSyntax {}
extension TypealiasDeclSyntax: IdentifiedDeclSyntax {}
extension AssociatedtypeDeclSyntax: IdentifiedDeclSyntax {}
extension ParameterClauseSyntax: ParenthesizedSyntax {}
extension ElseifDirectiveClauseSyntax: WithStatementsSyntax {}
extension IfConfigDeclSyntax: WithStatementsSyntax {}
extension PoundErrorDeclSyntax: ParenthesizedSyntax {}
extension PoundWarningDeclSyntax: ParenthesizedSyntax {}
extension InheritedTypeSyntax: WithTrailingCommaSyntax {}
extension ClassDeclSyntax: DeclGroupSyntax, IdentifiedDeclSyntax {}
extension StructDeclSyntax: DeclGroupSyntax, IdentifiedDeclSyntax {}
extension ProtocolDeclSyntax: DeclGroupSyntax, IdentifiedDeclSyntax {}
extension ExtensionDeclSyntax: DeclGroupSyntax {}
extension MemberDeclBlockSyntax: BracedSyntax {}
extension SourceFileSyntax: WithStatementsSyntax {}
extension FunctionParameterSyntax: WithTrailingCommaSyntax {}
extension FunctionDeclSyntax: IdentifiedDeclSyntax {}
extension ElseDirectiveClauseSyntax: WithStatementsSyntax {}
extension AccessorParameterSyntax: ParenthesizedSyntax {}
extension AccessorBlockSyntax: BracedSyntax {}
extension PatternBindingSyntax: WithTrailingCommaSyntax {}
extension WhileStmtSyntax: WithCodeBlockSyntax, LabeledSyntax {}
extension DeferStmtSyntax: WithCodeBlockSyntax {}
extension RepeatWhileStmtSyntax: WithCodeBlockSyntax, LabeledSyntax {}
extension GuardStmtSyntax: WithCodeBlockSyntax {}
extension ForInStmtSyntax: WithCodeBlockSyntax, LabeledSyntax {}
extension SwitchStmtSyntax: BracedSyntax, LabeledSyntax {}
extension DoStmtSyntax: WithCodeBlockSyntax, LabeledSyntax {}
extension ConditionElementSyntax: WithTrailingCommaSyntax {}
extension IfStmtSyntax: WithCodeBlockSyntax, LabeledSyntax {}
extension ElseBlockSyntax: WithCodeBlockSyntax {}
extension SwitchCaseSyntax: WithStatementsSyntax {}
extension CaseItemSyntax: WithTrailingCommaSyntax {}
extension SameTypeRequirementSyntax: WithTrailingCommaSyntax {}
extension GenericParameterSyntax: WithTrailingCommaSyntax {}
extension ConformanceRequirementSyntax: WithTrailingCommaSyntax {}
extension TupleTypeElementSyntax: WithTrailingCommaSyntax {}
extension TupleTypeSyntax: ParenthesizedSyntax {}
extension FunctionTypeSyntax: ParenthesizedSyntax {}
extension GenericArgumentSyntax: WithTrailingCommaSyntax {}
extension TuplePatternSyntax: ParenthesizedSyntax {}
extension TuplePatternElementSyntax: WithTrailingCommaSyntax, LabeledSyntax {}

/// MARK: Convenience methods

extension StructDeclSyntax {
  /// Creates a new StructDeclSyntax with the provided name as its identifier.
  /// - param name: The new struct's name.
  /// - returns: A new StructDeclSyntax with the same fields as the receiver,
  ///            but with the provided identifier.
  func withIdentifier(_ name: String) -> StructDeclSyntax {
    let newToken = SyntaxFactory.makeIdentifier(name,
      leadingTrivia: identifier.leadingTrivia,
      trailingTrivia: identifier.trailingTrivia)
    return withIdentifier(newToken)
  }
}
