//// Automatically Generated From SyntaxFactory.swift.gyb.
//// Do Not Edit Directly!
//===------- SyntaxFactory.swift - Syntax Factory implementations ---------===//
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
//
// This file defines the SyntaxFactory, one of the most important client-facing
// types in lib/Syntax and likely to be very commonly used.
//
// Effectively a namespace, SyntaxFactory is never instantiated, but is *the*
// one-stop shop for making new Syntax nodes. Putting all of these into a
// collection of static methods provides a single point of API lookup for
// clients' convenience.
//
//===----------------------------------------------------------------------===//

public enum SyntaxFactory {
  public static func makeToken(_ kind: TokenKind, presence: SourcePresence,
                 leadingTrivia: Trivia = [],
                 trailingTrivia: Trivia = []) -> TokenSyntax {
    let data = SyntaxData(raw: .token(kind, leadingTrivia,
                                      trailingTrivia, presence))
    return TokenSyntax(root: data, data: data)
  }

  public static func makeUnknownSyntax(tokens: [TokenSyntax]) -> Syntax {
    let data = SyntaxData(raw: .node(.unknown, 
                                     tokens.map { $0.data.raw },
                                     .present))
    return UnknownSyntax(root: data, data: data)
  }

/// MARK: Syntax Node Creation APIs







  public static func makeBlankUnknownDecl() -> UnknownDeclSyntax {
    let data = SyntaxData(raw: .node(.unknownDecl, [
    ], .present))
    return UnknownDeclSyntax(root: data, data: data)
  }

  public static func makeBlankUnknownExpr() -> UnknownExprSyntax {
    let data = SyntaxData(raw: .node(.unknownExpr, [
    ], .present))
    return UnknownExprSyntax(root: data, data: data)
  }

  public static func makeBlankUnknownStmt() -> UnknownStmtSyntax {
    let data = SyntaxData(raw: .node(.unknownStmt, [
    ], .present))
    return UnknownStmtSyntax(root: data, data: data)
  }

  public static func makeBlankUnknownType() -> UnknownTypeSyntax {
    let data = SyntaxData(raw: .node(.unknownType, [
    ], .present))
    return UnknownTypeSyntax(root: data, data: data)
  }

  public static func makeBlankUnknownPattern() -> UnknownPatternSyntax {
    let data = SyntaxData(raw: .node(.unknownPattern, [
    ], .present))
    return UnknownPatternSyntax(root: data, data: data)
  }
  public static func makeCodeBlockItem(item: Syntax, semicolon: TokenSyntax?) -> CodeBlockItemSyntax {
    let data = SyntaxData(raw: .node(.codeBlockItem, [
      item.data.raw,
      semicolon?.data.raw ?? RawSyntax.missingToken(.semicolon),
    ], .present))
    return CodeBlockItemSyntax(root: data, data: data)
  }

  public static func makeBlankCodeBlockItem() -> CodeBlockItemSyntax {
    let data = SyntaxData(raw: .node(.codeBlockItem, [
      RawSyntax.missing(.unknown),
      RawSyntax.missingToken(.semicolon),
    ], .present))
    return CodeBlockItemSyntax(root: data, data: data)
  }
  public static func makeCodeBlockItemList(
    _ elements: [CodeBlockItemSyntax]) -> CodeBlockItemListSyntax {
    let data = SyntaxData(raw: .node(.codeBlockItemList,
                                     elements.map { $0.data.raw }, .present))
    return CodeBlockItemListSyntax(root: data, data: data)
  }

  public static func makeBlankCodeBlockItemList() -> CodeBlockItemListSyntax {
    let data = SyntaxData(raw: .node(.codeBlockItemList, [
    ], .present))
    return CodeBlockItemListSyntax(root: data, data: data)
  }
  public static func makeCodeBlock(leftBrace: TokenSyntax, statements: CodeBlockItemListSyntax, rightBrace: TokenSyntax) -> CodeBlockSyntax {
    let data = SyntaxData(raw: .node(.codeBlock, [
      leftBrace.data.raw,
      statements.data.raw,
      rightBrace.data.raw,
    ], .present))
    return CodeBlockSyntax(root: data, data: data)
  }

  public static func makeBlankCodeBlock() -> CodeBlockSyntax {
    let data = SyntaxData(raw: .node(.codeBlock, [
      RawSyntax.missingToken(.leftBrace),
      RawSyntax.missing(.codeBlockItemList),
      RawSyntax.missingToken(.rightBrace),
    ], .present))
    return CodeBlockSyntax(root: data, data: data)
  }
  public static func makeInOutExpr(ampersand: TokenSyntax, expression: ExprSyntax) -> InOutExprSyntax {
    let data = SyntaxData(raw: .node(.inOutExpr, [
      ampersand.data.raw,
      expression.data.raw,
    ], .present))
    return InOutExprSyntax(root: data, data: data)
  }

  public static func makeBlankInOutExpr() -> InOutExprSyntax {
    let data = SyntaxData(raw: .node(.inOutExpr, [
      RawSyntax.missingToken(.prefixAmpersand),
      RawSyntax.missing(.expr),
    ], .present))
    return InOutExprSyntax(root: data, data: data)
  }
  public static func makePoundColumnExpr(poundColumn: TokenSyntax) -> PoundColumnExprSyntax {
    let data = SyntaxData(raw: .node(.poundColumnExpr, [
      poundColumn.data.raw,
    ], .present))
    return PoundColumnExprSyntax(root: data, data: data)
  }

  public static func makeBlankPoundColumnExpr() -> PoundColumnExprSyntax {
    let data = SyntaxData(raw: .node(.poundColumnExpr, [
      RawSyntax.missingToken(.poundColumnKeyword),
    ], .present))
    return PoundColumnExprSyntax(root: data, data: data)
  }
  public static func makeFunctionCallArgumentList(
    _ elements: [FunctionCallArgumentSyntax]) -> FunctionCallArgumentListSyntax {
    let data = SyntaxData(raw: .node(.functionCallArgumentList,
                                     elements.map { $0.data.raw }, .present))
    return FunctionCallArgumentListSyntax(root: data, data: data)
  }

  public static func makeBlankFunctionCallArgumentList() -> FunctionCallArgumentListSyntax {
    let data = SyntaxData(raw: .node(.functionCallArgumentList, [
    ], .present))
    return FunctionCallArgumentListSyntax(root: data, data: data)
  }
  public static func makeTupleElementList(
    _ elements: [TupleElementSyntax]) -> TupleElementListSyntax {
    let data = SyntaxData(raw: .node(.tupleElementList,
                                     elements.map { $0.data.raw }, .present))
    return TupleElementListSyntax(root: data, data: data)
  }

  public static func makeBlankTupleElementList() -> TupleElementListSyntax {
    let data = SyntaxData(raw: .node(.tupleElementList, [
    ], .present))
    return TupleElementListSyntax(root: data, data: data)
  }
  public static func makeArrayElementList(
    _ elements: [ArrayElementSyntax]) -> ArrayElementListSyntax {
    let data = SyntaxData(raw: .node(.arrayElementList,
                                     elements.map { $0.data.raw }, .present))
    return ArrayElementListSyntax(root: data, data: data)
  }

  public static func makeBlankArrayElementList() -> ArrayElementListSyntax {
    let data = SyntaxData(raw: .node(.arrayElementList, [
    ], .present))
    return ArrayElementListSyntax(root: data, data: data)
  }
  public static func makeDictionaryElementList(
    _ elements: [DictionaryElementSyntax]) -> DictionaryElementListSyntax {
    let data = SyntaxData(raw: .node(.dictionaryElementList,
                                     elements.map { $0.data.raw }, .present))
    return DictionaryElementListSyntax(root: data, data: data)
  }

  public static func makeBlankDictionaryElementList() -> DictionaryElementListSyntax {
    let data = SyntaxData(raw: .node(.dictionaryElementList, [
    ], .present))
    return DictionaryElementListSyntax(root: data, data: data)
  }
  public static func makeStringInterpolationSegments(
    _ elements: [Syntax]) -> StringInterpolationSegmentsSyntax {
    let data = SyntaxData(raw: .node(.stringInterpolationSegments,
                                     elements.map { $0.data.raw }, .present))
    return StringInterpolationSegmentsSyntax(root: data, data: data)
  }

  public static func makeBlankStringInterpolationSegments() -> StringInterpolationSegmentsSyntax {
    let data = SyntaxData(raw: .node(.stringInterpolationSegments, [
    ], .present))
    return StringInterpolationSegmentsSyntax(root: data, data: data)
  }
  public static func makeTryExpr(tryKeyword: TokenSyntax, questionOrExclamationMark: TokenSyntax?, expression: ExprSyntax) -> TryExprSyntax {
    let data = SyntaxData(raw: .node(.tryExpr, [
      tryKeyword.data.raw,
      questionOrExclamationMark?.data.raw ?? RawSyntax.missingToken(.postfixQuestionMark),
      expression.data.raw,
    ], .present))
    return TryExprSyntax(root: data, data: data)
  }

  public static func makeBlankTryExpr() -> TryExprSyntax {
    let data = SyntaxData(raw: .node(.tryExpr, [
      RawSyntax.missingToken(.tryKeyword),
      RawSyntax.missingToken(.postfixQuestionMark),
      RawSyntax.missing(.expr),
    ], .present))
    return TryExprSyntax(root: data, data: data)
  }
  public static func makeDeclNameArgument(name: TokenSyntax, colon: TokenSyntax) -> DeclNameArgumentSyntax {
    let data = SyntaxData(raw: .node(.declNameArgument, [
      name.data.raw,
      colon.data.raw,
    ], .present))
    return DeclNameArgumentSyntax(root: data, data: data)
  }

  public static func makeBlankDeclNameArgument() -> DeclNameArgumentSyntax {
    let data = SyntaxData(raw: .node(.declNameArgument, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missingToken(.colon),
    ], .present))
    return DeclNameArgumentSyntax(root: data, data: data)
  }
  public static func makeDeclNameArgumentList(
    _ elements: [DeclNameArgumentSyntax]) -> DeclNameArgumentListSyntax {
    let data = SyntaxData(raw: .node(.declNameArgumentList,
                                     elements.map { $0.data.raw }, .present))
    return DeclNameArgumentListSyntax(root: data, data: data)
  }

  public static func makeBlankDeclNameArgumentList() -> DeclNameArgumentListSyntax {
    let data = SyntaxData(raw: .node(.declNameArgumentList, [
    ], .present))
    return DeclNameArgumentListSyntax(root: data, data: data)
  }
  public static func makeDeclNameArguments(leftParen: TokenSyntax, arguments: DeclNameArgumentListSyntax, rightParen: TokenSyntax) -> DeclNameArgumentsSyntax {
    let data = SyntaxData(raw: .node(.declNameArguments, [
      leftParen.data.raw,
      arguments.data.raw,
      rightParen.data.raw,
    ], .present))
    return DeclNameArgumentsSyntax(root: data, data: data)
  }

  public static func makeBlankDeclNameArguments() -> DeclNameArgumentsSyntax {
    let data = SyntaxData(raw: .node(.declNameArguments, [
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.declNameArgumentList),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return DeclNameArgumentsSyntax(root: data, data: data)
  }
  public static func makeIdentifierExpr(identifier: TokenSyntax, declNameArguments: DeclNameArgumentsSyntax?) -> IdentifierExprSyntax {
    let data = SyntaxData(raw: .node(.identifierExpr, [
      identifier.data.raw,
      declNameArguments?.data.raw ?? RawSyntax.missing(.declNameArguments),
    ], .present))
    return IdentifierExprSyntax(root: data, data: data)
  }

  public static func makeBlankIdentifierExpr() -> IdentifierExprSyntax {
    let data = SyntaxData(raw: .node(.identifierExpr, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.declNameArguments),
    ], .present))
    return IdentifierExprSyntax(root: data, data: data)
  }
  public static func makeSuperRefExpr(superKeyword: TokenSyntax) -> SuperRefExprSyntax {
    let data = SyntaxData(raw: .node(.superRefExpr, [
      superKeyword.data.raw,
    ], .present))
    return SuperRefExprSyntax(root: data, data: data)
  }

  public static func makeBlankSuperRefExpr() -> SuperRefExprSyntax {
    let data = SyntaxData(raw: .node(.superRefExpr, [
      RawSyntax.missingToken(.superKeyword),
    ], .present))
    return SuperRefExprSyntax(root: data, data: data)
  }
  public static func makeNilLiteralExpr(nilKeyword: TokenSyntax) -> NilLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.nilLiteralExpr, [
      nilKeyword.data.raw,
    ], .present))
    return NilLiteralExprSyntax(root: data, data: data)
  }

  public static func makeBlankNilLiteralExpr() -> NilLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.nilLiteralExpr, [
      RawSyntax.missingToken(.nilKeyword),
    ], .present))
    return NilLiteralExprSyntax(root: data, data: data)
  }
  public static func makeDiscardAssignmentExpr(wildcard: TokenSyntax) -> DiscardAssignmentExprSyntax {
    let data = SyntaxData(raw: .node(.discardAssignmentExpr, [
      wildcard.data.raw,
    ], .present))
    return DiscardAssignmentExprSyntax(root: data, data: data)
  }

  public static func makeBlankDiscardAssignmentExpr() -> DiscardAssignmentExprSyntax {
    let data = SyntaxData(raw: .node(.discardAssignmentExpr, [
      RawSyntax.missingToken(.wildcardKeyword),
    ], .present))
    return DiscardAssignmentExprSyntax(root: data, data: data)
  }
  public static func makeAssignmentExpr(assignToken: TokenSyntax) -> AssignmentExprSyntax {
    let data = SyntaxData(raw: .node(.assignmentExpr, [
      assignToken.data.raw,
    ], .present))
    return AssignmentExprSyntax(root: data, data: data)
  }

  public static func makeBlankAssignmentExpr() -> AssignmentExprSyntax {
    let data = SyntaxData(raw: .node(.assignmentExpr, [
      RawSyntax.missingToken(.equal),
    ], .present))
    return AssignmentExprSyntax(root: data, data: data)
  }
  public static func makeSequenceExpr(elements: ExprListSyntax) -> SequenceExprSyntax {
    let data = SyntaxData(raw: .node(.sequenceExpr, [
      elements.data.raw,
    ], .present))
    return SequenceExprSyntax(root: data, data: data)
  }

  public static func makeBlankSequenceExpr() -> SequenceExprSyntax {
    let data = SyntaxData(raw: .node(.sequenceExpr, [
      RawSyntax.missing(.exprList),
    ], .present))
    return SequenceExprSyntax(root: data, data: data)
  }
  public static func makeExprList(
    _ elements: [ExprSyntax]) -> ExprListSyntax {
    let data = SyntaxData(raw: .node(.exprList,
                                     elements.map { $0.data.raw }, .present))
    return ExprListSyntax(root: data, data: data)
  }

  public static func makeBlankExprList() -> ExprListSyntax {
    let data = SyntaxData(raw: .node(.exprList, [
    ], .present))
    return ExprListSyntax(root: data, data: data)
  }
  public static func makePoundLineExpr(poundLine: TokenSyntax) -> PoundLineExprSyntax {
    let data = SyntaxData(raw: .node(.poundLineExpr, [
      poundLine.data.raw,
    ], .present))
    return PoundLineExprSyntax(root: data, data: data)
  }

  public static func makeBlankPoundLineExpr() -> PoundLineExprSyntax {
    let data = SyntaxData(raw: .node(.poundLineExpr, [
      RawSyntax.missingToken(.poundLineKeyword),
    ], .present))
    return PoundLineExprSyntax(root: data, data: data)
  }
  public static func makePoundFileExpr(poundFile: TokenSyntax) -> PoundFileExprSyntax {
    let data = SyntaxData(raw: .node(.poundFileExpr, [
      poundFile.data.raw,
    ], .present))
    return PoundFileExprSyntax(root: data, data: data)
  }

  public static func makeBlankPoundFileExpr() -> PoundFileExprSyntax {
    let data = SyntaxData(raw: .node(.poundFileExpr, [
      RawSyntax.missingToken(.poundFileKeyword),
    ], .present))
    return PoundFileExprSyntax(root: data, data: data)
  }
  public static func makePoundFunctionExpr(poundFunction: TokenSyntax) -> PoundFunctionExprSyntax {
    let data = SyntaxData(raw: .node(.poundFunctionExpr, [
      poundFunction.data.raw,
    ], .present))
    return PoundFunctionExprSyntax(root: data, data: data)
  }

  public static func makeBlankPoundFunctionExpr() -> PoundFunctionExprSyntax {
    let data = SyntaxData(raw: .node(.poundFunctionExpr, [
      RawSyntax.missingToken(.poundFunctionKeyword),
    ], .present))
    return PoundFunctionExprSyntax(root: data, data: data)
  }
  public static func makePoundDsohandleExpr(poundDsohandle: TokenSyntax) -> PoundDsohandleExprSyntax {
    let data = SyntaxData(raw: .node(.poundDsohandleExpr, [
      poundDsohandle.data.raw,
    ], .present))
    return PoundDsohandleExprSyntax(root: data, data: data)
  }

  public static func makeBlankPoundDsohandleExpr() -> PoundDsohandleExprSyntax {
    let data = SyntaxData(raw: .node(.poundDsohandleExpr, [
      RawSyntax.missingToken(.poundDsohandleKeyword),
    ], .present))
    return PoundDsohandleExprSyntax(root: data, data: data)
  }
  public static func makeSymbolicReferenceExpr(identifier: TokenSyntax, genericArgumentClause: GenericArgumentClauseSyntax?) -> SymbolicReferenceExprSyntax {
    let data = SyntaxData(raw: .node(.symbolicReferenceExpr, [
      identifier.data.raw,
      genericArgumentClause?.data.raw ?? RawSyntax.missing(.genericArgumentClause),
    ], .present))
    return SymbolicReferenceExprSyntax(root: data, data: data)
  }

  public static func makeBlankSymbolicReferenceExpr() -> SymbolicReferenceExprSyntax {
    let data = SyntaxData(raw: .node(.symbolicReferenceExpr, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.genericArgumentClause),
    ], .present))
    return SymbolicReferenceExprSyntax(root: data, data: data)
  }
  public static func makePrefixOperatorExpr(operatorToken: TokenSyntax?, postfixExpression: ExprSyntax) -> PrefixOperatorExprSyntax {
    let data = SyntaxData(raw: .node(.prefixOperatorExpr, [
      operatorToken?.data.raw ?? RawSyntax.missingToken(.prefixOperator("")),
      postfixExpression.data.raw,
    ], .present))
    return PrefixOperatorExprSyntax(root: data, data: data)
  }

  public static func makeBlankPrefixOperatorExpr() -> PrefixOperatorExprSyntax {
    let data = SyntaxData(raw: .node(.prefixOperatorExpr, [
      RawSyntax.missingToken(.prefixOperator("")),
      RawSyntax.missing(.expr),
    ], .present))
    return PrefixOperatorExprSyntax(root: data, data: data)
  }
  public static func makeBinaryOperatorExpr(operatorToken: TokenSyntax) -> BinaryOperatorExprSyntax {
    let data = SyntaxData(raw: .node(.binaryOperatorExpr, [
      operatorToken.data.raw,
    ], .present))
    return BinaryOperatorExprSyntax(root: data, data: data)
  }

  public static func makeBlankBinaryOperatorExpr() -> BinaryOperatorExprSyntax {
    let data = SyntaxData(raw: .node(.binaryOperatorExpr, [
      RawSyntax.missingToken(.unknown),
    ], .present))
    return BinaryOperatorExprSyntax(root: data, data: data)
  }
  public static func makeArrowExpr(throwsToken: TokenSyntax?, arrowToken: TokenSyntax) -> ArrowExprSyntax {
    let data = SyntaxData(raw: .node(.arrowExpr, [
      throwsToken?.data.raw ?? RawSyntax.missingToken(.throwsKeyword),
      arrowToken.data.raw,
    ], .present))
    return ArrowExprSyntax(root: data, data: data)
  }

  public static func makeBlankArrowExpr() -> ArrowExprSyntax {
    let data = SyntaxData(raw: .node(.arrowExpr, [
      RawSyntax.missingToken(.throwsKeyword),
      RawSyntax.missingToken(.arrow),
    ], .present))
    return ArrowExprSyntax(root: data, data: data)
  }
  public static func makeFloatLiteralExpr(floatingDigits: TokenSyntax) -> FloatLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.floatLiteralExpr, [
      floatingDigits.data.raw,
    ], .present))
    return FloatLiteralExprSyntax(root: data, data: data)
  }

  public static func makeBlankFloatLiteralExpr() -> FloatLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.floatLiteralExpr, [
      RawSyntax.missingToken(.floatingLiteral("")),
    ], .present))
    return FloatLiteralExprSyntax(root: data, data: data)
  }
  public static func makeTupleExpr(leftParen: TokenSyntax, elementList: TupleElementListSyntax, rightParen: TokenSyntax) -> TupleExprSyntax {
    let data = SyntaxData(raw: .node(.tupleExpr, [
      leftParen.data.raw,
      elementList.data.raw,
      rightParen.data.raw,
    ], .present))
    return TupleExprSyntax(root: data, data: data)
  }

  public static func makeBlankTupleExpr() -> TupleExprSyntax {
    let data = SyntaxData(raw: .node(.tupleExpr, [
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.tupleElementList),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return TupleExprSyntax(root: data, data: data)
  }
  public static func makeArrayExpr(leftSquare: TokenSyntax, elements: ArrayElementListSyntax, rightSquare: TokenSyntax) -> ArrayExprSyntax {
    let data = SyntaxData(raw: .node(.arrayExpr, [
      leftSquare.data.raw,
      elements.data.raw,
      rightSquare.data.raw,
    ], .present))
    return ArrayExprSyntax(root: data, data: data)
  }

  public static func makeBlankArrayExpr() -> ArrayExprSyntax {
    let data = SyntaxData(raw: .node(.arrayExpr, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.arrayElementList),
      RawSyntax.missingToken(.unknown),
    ], .present))
    return ArrayExprSyntax(root: data, data: data)
  }
  public static func makeDictionaryExpr(leftSquare: TokenSyntax, content: Syntax, rightSquare: TokenSyntax) -> DictionaryExprSyntax {
    let data = SyntaxData(raw: .node(.dictionaryExpr, [
      leftSquare.data.raw,
      content.data.raw,
      rightSquare.data.raw,
    ], .present))
    return DictionaryExprSyntax(root: data, data: data)
  }

  public static func makeBlankDictionaryExpr() -> DictionaryExprSyntax {
    let data = SyntaxData(raw: .node(.dictionaryExpr, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.unknown),
      RawSyntax.missingToken(.unknown),
    ], .present))
    return DictionaryExprSyntax(root: data, data: data)
  }
  public static func makeImplicitMemberExpr(dot: TokenSyntax, name: TokenSyntax, declNameArguments: DeclNameArgumentsSyntax?) -> ImplicitMemberExprSyntax {
    let data = SyntaxData(raw: .node(.implicitMemberExpr, [
      dot.data.raw,
      name.data.raw,
      declNameArguments?.data.raw ?? RawSyntax.missing(.declNameArguments),
    ], .present))
    return ImplicitMemberExprSyntax(root: data, data: data)
  }

  public static func makeBlankImplicitMemberExpr() -> ImplicitMemberExprSyntax {
    let data = SyntaxData(raw: .node(.implicitMemberExpr, [
      RawSyntax.missingToken(.prefixPeriod),
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.declNameArguments),
    ], .present))
    return ImplicitMemberExprSyntax(root: data, data: data)
  }
  public static func makeFunctionCallArgument(label: TokenSyntax?, colon: TokenSyntax?, expression: ExprSyntax, trailingComma: TokenSyntax?) -> FunctionCallArgumentSyntax {
    let data = SyntaxData(raw: .node(.functionCallArgument, [
      label?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      colon?.data.raw ?? RawSyntax.missingToken(.colon),
      expression.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return FunctionCallArgumentSyntax(root: data, data: data)
  }

  public static func makeBlankFunctionCallArgument() -> FunctionCallArgumentSyntax {
    let data = SyntaxData(raw: .node(.functionCallArgument, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.comma),
    ], .present))
    return FunctionCallArgumentSyntax(root: data, data: data)
  }
  public static func makeTupleElement(label: TokenSyntax?, colon: TokenSyntax?, expression: ExprSyntax, trailingComma: TokenSyntax?) -> TupleElementSyntax {
    let data = SyntaxData(raw: .node(.tupleElement, [
      label?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      colon?.data.raw ?? RawSyntax.missingToken(.colon),
      expression.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return TupleElementSyntax(root: data, data: data)
  }

  public static func makeBlankTupleElement() -> TupleElementSyntax {
    let data = SyntaxData(raw: .node(.tupleElement, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.comma),
    ], .present))
    return TupleElementSyntax(root: data, data: data)
  }
  public static func makeArrayElement(expression: ExprSyntax, trailingComma: TokenSyntax?) -> ArrayElementSyntax {
    let data = SyntaxData(raw: .node(.arrayElement, [
      expression.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return ArrayElementSyntax(root: data, data: data)
  }

  public static func makeBlankArrayElement() -> ArrayElementSyntax {
    let data = SyntaxData(raw: .node(.arrayElement, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.comma),
    ], .present))
    return ArrayElementSyntax(root: data, data: data)
  }
  public static func makeDictionaryElement(keyExpression: ExprSyntax, colon: TokenSyntax, valueExpression: ExprSyntax, trailingComma: TokenSyntax?) -> DictionaryElementSyntax {
    let data = SyntaxData(raw: .node(.dictionaryElement, [
      keyExpression.data.raw,
      colon.data.raw,
      valueExpression.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return DictionaryElementSyntax(root: data, data: data)
  }

  public static func makeBlankDictionaryElement() -> DictionaryElementSyntax {
    let data = SyntaxData(raw: .node(.dictionaryElement, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.comma),
    ], .present))
    return DictionaryElementSyntax(root: data, data: data)
  }
  public static func makeIntegerLiteralExpr(digits: TokenSyntax) -> IntegerLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.integerLiteralExpr, [
      digits.data.raw,
    ], .present))
    return IntegerLiteralExprSyntax(root: data, data: data)
  }

  public static func makeBlankIntegerLiteralExpr() -> IntegerLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.integerLiteralExpr, [
      RawSyntax.missingToken(.integerLiteral("")),
    ], .present))
    return IntegerLiteralExprSyntax(root: data, data: data)
  }
  public static func makeStringLiteralExpr(stringLiteral: TokenSyntax) -> StringLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.stringLiteralExpr, [
      stringLiteral.data.raw,
    ], .present))
    return StringLiteralExprSyntax(root: data, data: data)
  }

  public static func makeBlankStringLiteralExpr() -> StringLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.stringLiteralExpr, [
      RawSyntax.missingToken(.stringLiteral("")),
    ], .present))
    return StringLiteralExprSyntax(root: data, data: data)
  }
  public static func makeBooleanLiteralExpr(booleanLiteral: TokenSyntax) -> BooleanLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.booleanLiteralExpr, [
      booleanLiteral.data.raw,
    ], .present))
    return BooleanLiteralExprSyntax(root: data, data: data)
  }

  public static func makeBlankBooleanLiteralExpr() -> BooleanLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.booleanLiteralExpr, [
      RawSyntax.missingToken(.trueKeyword),
    ], .present))
    return BooleanLiteralExprSyntax(root: data, data: data)
  }
  public static func makeTernaryExpr(conditionExpression: ExprSyntax, questionMark: TokenSyntax, firstChoice: ExprSyntax, colonMark: TokenSyntax, secondChoice: ExprSyntax) -> TernaryExprSyntax {
    let data = SyntaxData(raw: .node(.ternaryExpr, [
      conditionExpression.data.raw,
      questionMark.data.raw,
      firstChoice.data.raw,
      colonMark.data.raw,
      secondChoice.data.raw,
    ], .present))
    return TernaryExprSyntax(root: data, data: data)
  }

  public static func makeBlankTernaryExpr() -> TernaryExprSyntax {
    let data = SyntaxData(raw: .node(.ternaryExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.infixQuestionMark),
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.expr),
    ], .present))
    return TernaryExprSyntax(root: data, data: data)
  }
  public static func makeMemberAccessExpr(base: ExprSyntax, dot: TokenSyntax, name: TokenSyntax, declNameArguments: DeclNameArgumentsSyntax?) -> MemberAccessExprSyntax {
    let data = SyntaxData(raw: .node(.memberAccessExpr, [
      base.data.raw,
      dot.data.raw,
      name.data.raw,
      declNameArguments?.data.raw ?? RawSyntax.missing(.declNameArguments),
    ], .present))
    return MemberAccessExprSyntax(root: data, data: data)
  }

  public static func makeBlankMemberAccessExpr() -> MemberAccessExprSyntax {
    let data = SyntaxData(raw: .node(.memberAccessExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.period),
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.declNameArguments),
    ], .present))
    return MemberAccessExprSyntax(root: data, data: data)
  }
  public static func makeDotSelfExpr(expression: ExprSyntax, dot: TokenSyntax, selfKeyword: TokenSyntax) -> DotSelfExprSyntax {
    let data = SyntaxData(raw: .node(.dotSelfExpr, [
      expression.data.raw,
      dot.data.raw,
      selfKeyword.data.raw,
    ], .present))
    return DotSelfExprSyntax(root: data, data: data)
  }

  public static func makeBlankDotSelfExpr() -> DotSelfExprSyntax {
    let data = SyntaxData(raw: .node(.dotSelfExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.period),
      RawSyntax.missingToken(.selfKeyword),
    ], .present))
    return DotSelfExprSyntax(root: data, data: data)
  }
  public static func makeIsExpr(isTok: TokenSyntax, typeName: TypeSyntax) -> IsExprSyntax {
    let data = SyntaxData(raw: .node(.isExpr, [
      isTok.data.raw,
      typeName.data.raw,
    ], .present))
    return IsExprSyntax(root: data, data: data)
  }

  public static func makeBlankIsExpr() -> IsExprSyntax {
    let data = SyntaxData(raw: .node(.isExpr, [
      RawSyntax.missingToken(.isKeyword),
      RawSyntax.missing(.type),
    ], .present))
    return IsExprSyntax(root: data, data: data)
  }
  public static func makeAsExpr(asTok: TokenSyntax, questionOrExclamationMark: TokenSyntax?, typeName: TypeSyntax) -> AsExprSyntax {
    let data = SyntaxData(raw: .node(.asExpr, [
      asTok.data.raw,
      questionOrExclamationMark?.data.raw ?? RawSyntax.missingToken(.postfixQuestionMark),
      typeName.data.raw,
    ], .present))
    return AsExprSyntax(root: data, data: data)
  }

  public static func makeBlankAsExpr() -> AsExprSyntax {
    let data = SyntaxData(raw: .node(.asExpr, [
      RawSyntax.missingToken(.asKeyword),
      RawSyntax.missingToken(.postfixQuestionMark),
      RawSyntax.missing(.type),
    ], .present))
    return AsExprSyntax(root: data, data: data)
  }
  public static func makeTypeExpr(type: TypeSyntax) -> TypeExprSyntax {
    let data = SyntaxData(raw: .node(.typeExpr, [
      type.data.raw,
    ], .present))
    return TypeExprSyntax(root: data, data: data)
  }

  public static func makeBlankTypeExpr() -> TypeExprSyntax {
    let data = SyntaxData(raw: .node(.typeExpr, [
      RawSyntax.missing(.type),
    ], .present))
    return TypeExprSyntax(root: data, data: data)
  }
  public static func makeClosureCaptureItem(specifier: TokenListSyntax?, name: TokenSyntax?, assignToken: TokenSyntax?, expression: ExprSyntax, trailingComma: TokenSyntax?) -> ClosureCaptureItemSyntax {
    let data = SyntaxData(raw: .node(.closureCaptureItem, [
      specifier?.data.raw ?? RawSyntax.missingToken(.unknown),
      name?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      assignToken?.data.raw ?? RawSyntax.missingToken(.equal),
      expression.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return ClosureCaptureItemSyntax(root: data, data: data)
  }

  public static func makeBlankClosureCaptureItem() -> ClosureCaptureItemSyntax {
    let data = SyntaxData(raw: .node(.closureCaptureItem, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.equal),
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.comma),
    ], .present))
    return ClosureCaptureItemSyntax(root: data, data: data)
  }
  public static func makeClosureCaptureItemList(
    _ elements: [ClosureCaptureItemSyntax]) -> ClosureCaptureItemListSyntax {
    let data = SyntaxData(raw: .node(.closureCaptureItemList,
                                     elements.map { $0.data.raw }, .present))
    return ClosureCaptureItemListSyntax(root: data, data: data)
  }

  public static func makeBlankClosureCaptureItemList() -> ClosureCaptureItemListSyntax {
    let data = SyntaxData(raw: .node(.closureCaptureItemList, [
    ], .present))
    return ClosureCaptureItemListSyntax(root: data, data: data)
  }
  public static func makeClosureCaptureSignature(leftSquare: TokenSyntax, items: ClosureCaptureItemListSyntax?, rightSquare: TokenSyntax) -> ClosureCaptureSignatureSyntax {
    let data = SyntaxData(raw: .node(.closureCaptureSignature, [
      leftSquare.data.raw,
      items?.data.raw ?? RawSyntax.missing(.closureCaptureItemList),
      rightSquare.data.raw,
    ], .present))
    return ClosureCaptureSignatureSyntax(root: data, data: data)
  }

  public static func makeBlankClosureCaptureSignature() -> ClosureCaptureSignatureSyntax {
    let data = SyntaxData(raw: .node(.closureCaptureSignature, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.closureCaptureItemList),
      RawSyntax.missingToken(.unknown),
    ], .present))
    return ClosureCaptureSignatureSyntax(root: data, data: data)
  }
  public static func makeClosureParam(name: TokenSyntax, trailingComma: TokenSyntax?) -> ClosureParamSyntax {
    let data = SyntaxData(raw: .node(.closureParam, [
      name.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return ClosureParamSyntax(root: data, data: data)
  }

  public static func makeBlankClosureParam() -> ClosureParamSyntax {
    let data = SyntaxData(raw: .node(.closureParam, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.comma),
    ], .present))
    return ClosureParamSyntax(root: data, data: data)
  }
  public static func makeClosureParamList(
    _ elements: [ClosureParamSyntax]) -> ClosureParamListSyntax {
    let data = SyntaxData(raw: .node(.closureParamList,
                                     elements.map { $0.data.raw }, .present))
    return ClosureParamListSyntax(root: data, data: data)
  }

  public static func makeBlankClosureParamList() -> ClosureParamListSyntax {
    let data = SyntaxData(raw: .node(.closureParamList, [
    ], .present))
    return ClosureParamListSyntax(root: data, data: data)
  }
  public static func makeClosureSignature(capture: ClosureCaptureSignatureSyntax?, input: Syntax?, throwsTok: TokenSyntax?, output: ReturnClauseSyntax?, inTok: TokenSyntax) -> ClosureSignatureSyntax {
    let data = SyntaxData(raw: .node(.closureSignature, [
      capture?.data.raw ?? RawSyntax.missing(.closureCaptureSignature),
      input?.data.raw ?? RawSyntax.missing(.unknown),
      throwsTok?.data.raw ?? RawSyntax.missingToken(.throwsKeyword),
      output?.data.raw ?? RawSyntax.missing(.returnClause),
      inTok.data.raw,
    ], .present))
    return ClosureSignatureSyntax(root: data, data: data)
  }

  public static func makeBlankClosureSignature() -> ClosureSignatureSyntax {
    let data = SyntaxData(raw: .node(.closureSignature, [
      RawSyntax.missing(.closureCaptureSignature),
      RawSyntax.missing(.unknown),
      RawSyntax.missingToken(.throwsKeyword),
      RawSyntax.missing(.returnClause),
      RawSyntax.missingToken(.inKeyword),
    ], .present))
    return ClosureSignatureSyntax(root: data, data: data)
  }
  public static func makeClosureExpr(leftBrace: TokenSyntax, signature: ClosureSignatureSyntax?, statements: CodeBlockItemListSyntax, rightBrace: TokenSyntax) -> ClosureExprSyntax {
    let data = SyntaxData(raw: .node(.closureExpr, [
      leftBrace.data.raw,
      signature?.data.raw ?? RawSyntax.missing(.closureSignature),
      statements.data.raw,
      rightBrace.data.raw,
    ], .present))
    return ClosureExprSyntax(root: data, data: data)
  }

  public static func makeBlankClosureExpr() -> ClosureExprSyntax {
    let data = SyntaxData(raw: .node(.closureExpr, [
      RawSyntax.missingToken(.leftBrace),
      RawSyntax.missing(.closureSignature),
      RawSyntax.missing(.codeBlockItemList),
      RawSyntax.missingToken(.rightBrace),
    ], .present))
    return ClosureExprSyntax(root: data, data: data)
  }
  public static func makeUnresolvedPatternExpr(pattern: PatternSyntax) -> UnresolvedPatternExprSyntax {
    let data = SyntaxData(raw: .node(.unresolvedPatternExpr, [
      pattern.data.raw,
    ], .present))
    return UnresolvedPatternExprSyntax(root: data, data: data)
  }

  public static func makeBlankUnresolvedPatternExpr() -> UnresolvedPatternExprSyntax {
    let data = SyntaxData(raw: .node(.unresolvedPatternExpr, [
      RawSyntax.missing(.pattern),
    ], .present))
    return UnresolvedPatternExprSyntax(root: data, data: data)
  }
  public static func makeFunctionCallExpr(calledExpression: ExprSyntax, leftParen: TokenSyntax?, argumentList: FunctionCallArgumentListSyntax, rightParen: TokenSyntax?, trailingClosure: ClosureExprSyntax?) -> FunctionCallExprSyntax {
    let data = SyntaxData(raw: .node(.functionCallExpr, [
      calledExpression.data.raw,
      leftParen?.data.raw ?? RawSyntax.missingToken(.leftParen),
      argumentList.data.raw,
      rightParen?.data.raw ?? RawSyntax.missingToken(.rightParen),
      trailingClosure?.data.raw ?? RawSyntax.missing(.closureExpr),
    ], .present))
    return FunctionCallExprSyntax(root: data, data: data)
  }

  public static func makeBlankFunctionCallExpr() -> FunctionCallExprSyntax {
    let data = SyntaxData(raw: .node(.functionCallExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.functionCallArgumentList),
      RawSyntax.missingToken(.rightParen),
      RawSyntax.missing(.closureExpr),
    ], .present))
    return FunctionCallExprSyntax(root: data, data: data)
  }
  public static func makeSubscriptExpr(calledExpression: ExprSyntax, leftBracket: TokenSyntax, argumentList: FunctionCallArgumentListSyntax, rightBracket: TokenSyntax, trailingClosure: ClosureExprSyntax?) -> SubscriptExprSyntax {
    let data = SyntaxData(raw: .node(.subscriptExpr, [
      calledExpression.data.raw,
      leftBracket.data.raw,
      argumentList.data.raw,
      rightBracket.data.raw,
      trailingClosure?.data.raw ?? RawSyntax.missing(.closureExpr),
    ], .present))
    return SubscriptExprSyntax(root: data, data: data)
  }

  public static func makeBlankSubscriptExpr() -> SubscriptExprSyntax {
    let data = SyntaxData(raw: .node(.subscriptExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.leftSquareBracket),
      RawSyntax.missing(.functionCallArgumentList),
      RawSyntax.missingToken(.rightSquareBracket),
      RawSyntax.missing(.closureExpr),
    ], .present))
    return SubscriptExprSyntax(root: data, data: data)
  }
  public static func makeOptionalChainingExpr(expression: ExprSyntax, quetionMark: TokenSyntax) -> OptionalChainingExprSyntax {
    let data = SyntaxData(raw: .node(.optionalChainingExpr, [
      expression.data.raw,
      quetionMark.data.raw,
    ], .present))
    return OptionalChainingExprSyntax(root: data, data: data)
  }

  public static func makeBlankOptionalChainingExpr() -> OptionalChainingExprSyntax {
    let data = SyntaxData(raw: .node(.optionalChainingExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.postfixQuestionMark),
    ], .present))
    return OptionalChainingExprSyntax(root: data, data: data)
  }
  public static func makeForcedValueExpr(expression: ExprSyntax, exclamationMark: TokenSyntax) -> ForcedValueExprSyntax {
    let data = SyntaxData(raw: .node(.forcedValueExpr, [
      expression.data.raw,
      exclamationMark.data.raw,
    ], .present))
    return ForcedValueExprSyntax(root: data, data: data)
  }

  public static func makeBlankForcedValueExpr() -> ForcedValueExprSyntax {
    let data = SyntaxData(raw: .node(.forcedValueExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.exclamationMark),
    ], .present))
    return ForcedValueExprSyntax(root: data, data: data)
  }
  public static func makePostfixUnaryExpr(expression: ExprSyntax, operatorToken: TokenSyntax) -> PostfixUnaryExprSyntax {
    let data = SyntaxData(raw: .node(.postfixUnaryExpr, [
      expression.data.raw,
      operatorToken.data.raw,
    ], .present))
    return PostfixUnaryExprSyntax(root: data, data: data)
  }

  public static func makeBlankPostfixUnaryExpr() -> PostfixUnaryExprSyntax {
    let data = SyntaxData(raw: .node(.postfixUnaryExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.postfixOperator("")),
    ], .present))
    return PostfixUnaryExprSyntax(root: data, data: data)
  }
  public static func makeSpecializeExpr(expression: ExprSyntax, genericArgumentClause: GenericArgumentClauseSyntax) -> SpecializeExprSyntax {
    let data = SyntaxData(raw: .node(.specializeExpr, [
      expression.data.raw,
      genericArgumentClause.data.raw,
    ], .present))
    return SpecializeExprSyntax(root: data, data: data)
  }

  public static func makeBlankSpecializeExpr() -> SpecializeExprSyntax {
    let data = SyntaxData(raw: .node(.specializeExpr, [
      RawSyntax.missing(.expr),
      RawSyntax.missing(.genericArgumentClause),
    ], .present))
    return SpecializeExprSyntax(root: data, data: data)
  }
  public static func makeStringSegment(content: TokenSyntax) -> StringSegmentSyntax {
    let data = SyntaxData(raw: .node(.stringSegment, [
      content.data.raw,
    ], .present))
    return StringSegmentSyntax(root: data, data: data)
  }

  public static func makeBlankStringSegment() -> StringSegmentSyntax {
    let data = SyntaxData(raw: .node(.stringSegment, [
      RawSyntax.missingToken(.stringSegment("")),
    ], .present))
    return StringSegmentSyntax(root: data, data: data)
  }
  public static func makeExpressionSegment(backslash: TokenSyntax, leftParen: TokenSyntax, expression: ExprSyntax, rightParen: TokenSyntax) -> ExpressionSegmentSyntax {
    let data = SyntaxData(raw: .node(.expressionSegment, [
      backslash.data.raw,
      leftParen.data.raw,
      expression.data.raw,
      rightParen.data.raw,
    ], .present))
    return ExpressionSegmentSyntax(root: data, data: data)
  }

  public static func makeBlankExpressionSegment() -> ExpressionSegmentSyntax {
    let data = SyntaxData(raw: .node(.expressionSegment, [
      RawSyntax.missingToken(.backslash),
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.stringInterpolationAnchor),
    ], .present))
    return ExpressionSegmentSyntax(root: data, data: data)
  }
  public static func makeStringInterpolationExpr(openQuote: TokenSyntax, segments: StringInterpolationSegmentsSyntax, closeQuote: TokenSyntax) -> StringInterpolationExprSyntax {
    let data = SyntaxData(raw: .node(.stringInterpolationExpr, [
      openQuote.data.raw,
      segments.data.raw,
      closeQuote.data.raw,
    ], .present))
    return StringInterpolationExprSyntax(root: data, data: data)
  }

  public static func makeBlankStringInterpolationExpr() -> StringInterpolationExprSyntax {
    let data = SyntaxData(raw: .node(.stringInterpolationExpr, [
      RawSyntax.missingToken(.stringQuote),
      RawSyntax.missing(.stringInterpolationSegments),
      RawSyntax.missingToken(.stringQuote),
    ], .present))
    return StringInterpolationExprSyntax(root: data, data: data)
  }
  public static func makeKeyPathExpr(backslash: TokenSyntax, expression: ExprSyntax) -> KeyPathExprSyntax {
    let data = SyntaxData(raw: .node(.keyPathExpr, [
      backslash.data.raw,
      expression.data.raw,
    ], .present))
    return KeyPathExprSyntax(root: data, data: data)
  }

  public static func makeBlankKeyPathExpr() -> KeyPathExprSyntax {
    let data = SyntaxData(raw: .node(.keyPathExpr, [
      RawSyntax.missingToken(.backslash),
      RawSyntax.missing(.expr),
    ], .present))
    return KeyPathExprSyntax(root: data, data: data)
  }
  public static func makeObjcNamePiece(name: TokenSyntax, dot: TokenSyntax?) -> ObjcNamePieceSyntax {
    let data = SyntaxData(raw: .node(.objcNamePiece, [
      name.data.raw,
      dot?.data.raw ?? RawSyntax.missingToken(.period),
    ], .present))
    return ObjcNamePieceSyntax(root: data, data: data)
  }

  public static func makeBlankObjcNamePiece() -> ObjcNamePieceSyntax {
    let data = SyntaxData(raw: .node(.objcNamePiece, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.period),
    ], .present))
    return ObjcNamePieceSyntax(root: data, data: data)
  }
  public static func makeObjcName(
    _ elements: [ObjcNamePieceSyntax]) -> ObjcNameSyntax {
    let data = SyntaxData(raw: .node(.objcName,
                                     elements.map { $0.data.raw }, .present))
    return ObjcNameSyntax(root: data, data: data)
  }

  public static func makeBlankObjcName() -> ObjcNameSyntax {
    let data = SyntaxData(raw: .node(.objcName, [
    ], .present))
    return ObjcNameSyntax(root: data, data: data)
  }
  public static func makeObjcKeyPathExpr(keyPath: TokenSyntax, leftParen: TokenSyntax, name: ObjcNameSyntax, rightParen: TokenSyntax) -> ObjcKeyPathExprSyntax {
    let data = SyntaxData(raw: .node(.objcKeyPathExpr, [
      keyPath.data.raw,
      leftParen.data.raw,
      name.data.raw,
      rightParen.data.raw,
    ], .present))
    return ObjcKeyPathExprSyntax(root: data, data: data)
  }

  public static func makeBlankObjcKeyPathExpr() -> ObjcKeyPathExprSyntax {
    let data = SyntaxData(raw: .node(.objcKeyPathExpr, [
      RawSyntax.missingToken(.poundKeyPathKeyword),
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.objcName),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return ObjcKeyPathExprSyntax(root: data, data: data)
  }
  public static func makeEditorPlaceholderExpr(identifier: TokenSyntax) -> EditorPlaceholderExprSyntax {
    let data = SyntaxData(raw: .node(.editorPlaceholderExpr, [
      identifier.data.raw,
    ], .present))
    return EditorPlaceholderExprSyntax(root: data, data: data)
  }

  public static func makeBlankEditorPlaceholderExpr() -> EditorPlaceholderExprSyntax {
    let data = SyntaxData(raw: .node(.editorPlaceholderExpr, [
      RawSyntax.missingToken(.identifier("")),
    ], .present))
    return EditorPlaceholderExprSyntax(root: data, data: data)
  }
  public static func makeObjectLiteralExpr(identifier: TokenSyntax, leftParen: TokenSyntax, arguments: FunctionCallArgumentListSyntax, rightParen: TokenSyntax) -> ObjectLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.objectLiteralExpr, [
      identifier.data.raw,
      leftParen.data.raw,
      arguments.data.raw,
      rightParen.data.raw,
    ], .present))
    return ObjectLiteralExprSyntax(root: data, data: data)
  }

  public static func makeBlankObjectLiteralExpr() -> ObjectLiteralExprSyntax {
    let data = SyntaxData(raw: .node(.objectLiteralExpr, [
      RawSyntax.missingToken(.poundColorLiteralKeyword),
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.functionCallArgumentList),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return ObjectLiteralExprSyntax(root: data, data: data)
  }
  public static func makeTypeInitializerClause(equal: TokenSyntax, value: TypeSyntax) -> TypeInitializerClauseSyntax {
    let data = SyntaxData(raw: .node(.typeInitializerClause, [
      equal.data.raw,
      value.data.raw,
    ], .present))
    return TypeInitializerClauseSyntax(root: data, data: data)
  }

  public static func makeBlankTypeInitializerClause() -> TypeInitializerClauseSyntax {
    let data = SyntaxData(raw: .node(.typeInitializerClause, [
      RawSyntax.missingToken(.equal),
      RawSyntax.missing(.type),
    ], .present))
    return TypeInitializerClauseSyntax(root: data, data: data)
  }
  public static func makeTypealiasDecl(attributes: AttributeListSyntax?, accessLevelModifier: DeclModifierSyntax?, typealiasKeyword: TokenSyntax, identifier: TokenSyntax, genericParameterClause: GenericParameterClauseSyntax?, initializer: TypeInitializerClauseSyntax?, genericWhereClause: GenericWhereClauseSyntax?) -> TypealiasDeclSyntax {
    let data = SyntaxData(raw: .node(.typealiasDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      accessLevelModifier?.data.raw ?? RawSyntax.missing(.declModifier),
      typealiasKeyword.data.raw,
      identifier.data.raw,
      genericParameterClause?.data.raw ?? RawSyntax.missing(.genericParameterClause),
      initializer?.data.raw ?? RawSyntax.missing(.typeInitializerClause),
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
    ], .present))
    return TypealiasDeclSyntax(root: data, data: data)
  }

  public static func makeBlankTypealiasDecl() -> TypealiasDeclSyntax {
    let data = SyntaxData(raw: .node(.typealiasDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.declModifier),
      RawSyntax.missingToken(.typealiasKeyword),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.genericParameterClause),
      RawSyntax.missing(.typeInitializerClause),
      RawSyntax.missing(.genericWhereClause),
    ], .present))
    return TypealiasDeclSyntax(root: data, data: data)
  }
  public static func makeAssociatedtypeDecl(attributes: AttributeListSyntax?, accessLevelModifier: DeclModifierSyntax?, associatedtypeKeyword: TokenSyntax, identifier: TokenSyntax, inheritanceClause: TypeInheritanceClauseSyntax?, initializer: TypeInitializerClauseSyntax?, genericWhereClause: GenericWhereClauseSyntax?) -> AssociatedtypeDeclSyntax {
    let data = SyntaxData(raw: .node(.associatedtypeDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      accessLevelModifier?.data.raw ?? RawSyntax.missing(.declModifier),
      associatedtypeKeyword.data.raw,
      identifier.data.raw,
      inheritanceClause?.data.raw ?? RawSyntax.missing(.typeInheritanceClause),
      initializer?.data.raw ?? RawSyntax.missing(.typeInitializerClause),
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
    ], .present))
    return AssociatedtypeDeclSyntax(root: data, data: data)
  }

  public static func makeBlankAssociatedtypeDecl() -> AssociatedtypeDeclSyntax {
    let data = SyntaxData(raw: .node(.associatedtypeDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.declModifier),
      RawSyntax.missingToken(.associatedtypeKeyword),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.typeInheritanceClause),
      RawSyntax.missing(.typeInitializerClause),
      RawSyntax.missing(.genericWhereClause),
    ], .present))
    return AssociatedtypeDeclSyntax(root: data, data: data)
  }
  public static func makeFunctionParameterList(
    _ elements: [FunctionParameterSyntax]) -> FunctionParameterListSyntax {
    let data = SyntaxData(raw: .node(.functionParameterList,
                                     elements.map { $0.data.raw }, .present))
    return FunctionParameterListSyntax(root: data, data: data)
  }

  public static func makeBlankFunctionParameterList() -> FunctionParameterListSyntax {
    let data = SyntaxData(raw: .node(.functionParameterList, [
    ], .present))
    return FunctionParameterListSyntax(root: data, data: data)
  }
  public static func makeParameterClause(leftParen: TokenSyntax, parameterList: FunctionParameterListSyntax, rightParen: TokenSyntax) -> ParameterClauseSyntax {
    let data = SyntaxData(raw: .node(.parameterClause, [
      leftParen.data.raw,
      parameterList.data.raw,
      rightParen.data.raw,
    ], .present))
    return ParameterClauseSyntax(root: data, data: data)
  }

  public static func makeBlankParameterClause() -> ParameterClauseSyntax {
    let data = SyntaxData(raw: .node(.parameterClause, [
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.functionParameterList),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return ParameterClauseSyntax(root: data, data: data)
  }
  public static func makeReturnClause(arrow: TokenSyntax, returnType: TypeSyntax) -> ReturnClauseSyntax {
    let data = SyntaxData(raw: .node(.returnClause, [
      arrow.data.raw,
      returnType.data.raw,
    ], .present))
    return ReturnClauseSyntax(root: data, data: data)
  }

  public static func makeBlankReturnClause() -> ReturnClauseSyntax {
    let data = SyntaxData(raw: .node(.returnClause, [
      RawSyntax.missingToken(.arrow),
      RawSyntax.missing(.type),
    ], .present))
    return ReturnClauseSyntax(root: data, data: data)
  }
  public static func makeFunctionSignature(input: ParameterClauseSyntax, throwsOrRethrowsKeyword: TokenSyntax?, output: ReturnClauseSyntax?) -> FunctionSignatureSyntax {
    let data = SyntaxData(raw: .node(.functionSignature, [
      input.data.raw,
      throwsOrRethrowsKeyword?.data.raw ?? RawSyntax.missingToken(.throwsKeyword),
      output?.data.raw ?? RawSyntax.missing(.returnClause),
    ], .present))
    return FunctionSignatureSyntax(root: data, data: data)
  }

  public static func makeBlankFunctionSignature() -> FunctionSignatureSyntax {
    let data = SyntaxData(raw: .node(.functionSignature, [
      RawSyntax.missing(.parameterClause),
      RawSyntax.missingToken(.throwsKeyword),
      RawSyntax.missing(.returnClause),
    ], .present))
    return FunctionSignatureSyntax(root: data, data: data)
  }
  public static func makeElseifDirectiveClause(poundElseif: TokenSyntax, condition: ExprSyntax, statements: CodeBlockItemListSyntax) -> ElseifDirectiveClauseSyntax {
    let data = SyntaxData(raw: .node(.elseifDirectiveClause, [
      poundElseif.data.raw,
      condition.data.raw,
      statements.data.raw,
    ], .present))
    return ElseifDirectiveClauseSyntax(root: data, data: data)
  }

  public static func makeBlankElseifDirectiveClause() -> ElseifDirectiveClauseSyntax {
    let data = SyntaxData(raw: .node(.elseifDirectiveClause, [
      RawSyntax.missingToken(.poundElseifKeyword),
      RawSyntax.missing(.expr),
      RawSyntax.missing(.codeBlockItemList),
    ], .present))
    return ElseifDirectiveClauseSyntax(root: data, data: data)
  }
  public static func makeIfConfigDecl(poundIf: TokenSyntax, condition: ExprSyntax, statements: CodeBlockItemListSyntax, elseifDirectiveClauses: ElseifDirectiveClauseListSyntax?, elseClause: ElseDirectiveClauseSyntax?, poundEndif: TokenSyntax) -> IfConfigDeclSyntax {
    let data = SyntaxData(raw: .node(.ifConfigDecl, [
      poundIf.data.raw,
      condition.data.raw,
      statements.data.raw,
      elseifDirectiveClauses?.data.raw ?? RawSyntax.missing(.elseifDirectiveClauseList),
      elseClause?.data.raw ?? RawSyntax.missing(.elseDirectiveClause),
      poundEndif.data.raw,
    ], .present))
    return IfConfigDeclSyntax(root: data, data: data)
  }

  public static func makeBlankIfConfigDecl() -> IfConfigDeclSyntax {
    let data = SyntaxData(raw: .node(.ifConfigDecl, [
      RawSyntax.missingToken(.poundIfKeyword),
      RawSyntax.missing(.expr),
      RawSyntax.missing(.codeBlockItemList),
      RawSyntax.missing(.elseifDirectiveClauseList),
      RawSyntax.missing(.elseDirectiveClause),
      RawSyntax.missingToken(.poundEndifKeyword),
    ], .present))
    return IfConfigDeclSyntax(root: data, data: data)
  }
  public static func makePoundErrorDecl(poundError: TokenSyntax, leftParen: TokenSyntax, message: StringLiteralExprSyntax, rightParen: TokenSyntax) -> PoundErrorDeclSyntax {
    let data = SyntaxData(raw: .node(.poundErrorDecl, [
      poundError.data.raw,
      leftParen.data.raw,
      message.data.raw,
      rightParen.data.raw,
    ], .present))
    return PoundErrorDeclSyntax(root: data, data: data)
  }

  public static func makeBlankPoundErrorDecl() -> PoundErrorDeclSyntax {
    let data = SyntaxData(raw: .node(.poundErrorDecl, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.stringLiteralExpr),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return PoundErrorDeclSyntax(root: data, data: data)
  }
  public static func makePoundWarningDecl(poundWarning: TokenSyntax, leftParen: TokenSyntax, message: StringLiteralExprSyntax, rightParen: TokenSyntax) -> PoundWarningDeclSyntax {
    let data = SyntaxData(raw: .node(.poundWarningDecl, [
      poundWarning.data.raw,
      leftParen.data.raw,
      message.data.raw,
      rightParen.data.raw,
    ], .present))
    return PoundWarningDeclSyntax(root: data, data: data)
  }

  public static func makeBlankPoundWarningDecl() -> PoundWarningDeclSyntax {
    let data = SyntaxData(raw: .node(.poundWarningDecl, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.stringLiteralExpr),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return PoundWarningDeclSyntax(root: data, data: data)
  }
  public static func makeDeclModifier(name: TokenSyntax, detail: TokenListSyntax?) -> DeclModifierSyntax {
    let data = SyntaxData(raw: .node(.declModifier, [
      name.data.raw,
      detail?.data.raw ?? RawSyntax.missingToken(.unknown),
    ], .present))
    return DeclModifierSyntax(root: data, data: data)
  }

  public static func makeBlankDeclModifier() -> DeclModifierSyntax {
    let data = SyntaxData(raw: .node(.declModifier, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missingToken(.unknown),
    ], .present))
    return DeclModifierSyntax(root: data, data: data)
  }
  public static func makeInheritedType(typeName: TypeSyntax, trailingComma: TokenSyntax?) -> InheritedTypeSyntax {
    let data = SyntaxData(raw: .node(.inheritedType, [
      typeName.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return InheritedTypeSyntax(root: data, data: data)
  }

  public static func makeBlankInheritedType() -> InheritedTypeSyntax {
    let data = SyntaxData(raw: .node(.inheritedType, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.comma),
    ], .present))
    return InheritedTypeSyntax(root: data, data: data)
  }
  public static func makeInheritedTypeList(
    _ elements: [InheritedTypeSyntax]) -> InheritedTypeListSyntax {
    let data = SyntaxData(raw: .node(.inheritedTypeList,
                                     elements.map { $0.data.raw }, .present))
    return InheritedTypeListSyntax(root: data, data: data)
  }

  public static func makeBlankInheritedTypeList() -> InheritedTypeListSyntax {
    let data = SyntaxData(raw: .node(.inheritedTypeList, [
    ], .present))
    return InheritedTypeListSyntax(root: data, data: data)
  }
  public static func makeTypeInheritanceClause(colon: TokenSyntax, inheritedTypeCollection: InheritedTypeListSyntax) -> TypeInheritanceClauseSyntax {
    let data = SyntaxData(raw: .node(.typeInheritanceClause, [
      colon.data.raw,
      inheritedTypeCollection.data.raw,
    ], .present))
    return TypeInheritanceClauseSyntax(root: data, data: data)
  }

  public static func makeBlankTypeInheritanceClause() -> TypeInheritanceClauseSyntax {
    let data = SyntaxData(raw: .node(.typeInheritanceClause, [
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.inheritedTypeList),
    ], .present))
    return TypeInheritanceClauseSyntax(root: data, data: data)
  }
  public static func makeClassDecl(attributes: AttributeListSyntax?, accessLevelModifier: DeclModifierSyntax?, classKeyword: TokenSyntax, identifier: TokenSyntax, genericParameterClause: GenericParameterClauseSyntax?, inheritanceClause: TypeInheritanceClauseSyntax?, genericWhereClause: GenericWhereClauseSyntax?, members: MemberDeclBlockSyntax) -> ClassDeclSyntax {
    let data = SyntaxData(raw: .node(.classDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      accessLevelModifier?.data.raw ?? RawSyntax.missing(.declModifier),
      classKeyword.data.raw,
      identifier.data.raw,
      genericParameterClause?.data.raw ?? RawSyntax.missing(.genericParameterClause),
      inheritanceClause?.data.raw ?? RawSyntax.missing(.typeInheritanceClause),
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
      members.data.raw,
    ], .present))
    return ClassDeclSyntax(root: data, data: data)
  }

  public static func makeBlankClassDecl() -> ClassDeclSyntax {
    let data = SyntaxData(raw: .node(.classDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.declModifier),
      RawSyntax.missingToken(.classKeyword),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.genericParameterClause),
      RawSyntax.missing(.typeInheritanceClause),
      RawSyntax.missing(.genericWhereClause),
      RawSyntax.missing(.memberDeclBlock),
    ], .present))
    return ClassDeclSyntax(root: data, data: data)
  }
  public static func makeStructDecl(attributes: AttributeListSyntax?, accessLevelModifier: DeclModifierSyntax?, structKeyword: TokenSyntax, identifier: TokenSyntax, genericParameterClause: GenericParameterClauseSyntax?, inheritanceClause: TypeInheritanceClauseSyntax?, genericWhereClause: GenericWhereClauseSyntax?, members: MemberDeclBlockSyntax) -> StructDeclSyntax {
    let data = SyntaxData(raw: .node(.structDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      accessLevelModifier?.data.raw ?? RawSyntax.missing(.declModifier),
      structKeyword.data.raw,
      identifier.data.raw,
      genericParameterClause?.data.raw ?? RawSyntax.missing(.genericParameterClause),
      inheritanceClause?.data.raw ?? RawSyntax.missing(.typeInheritanceClause),
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
      members.data.raw,
    ], .present))
    return StructDeclSyntax(root: data, data: data)
  }

  public static func makeBlankStructDecl() -> StructDeclSyntax {
    let data = SyntaxData(raw: .node(.structDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.declModifier),
      RawSyntax.missingToken(.structKeyword),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.genericParameterClause),
      RawSyntax.missing(.typeInheritanceClause),
      RawSyntax.missing(.genericWhereClause),
      RawSyntax.missing(.memberDeclBlock),
    ], .present))
    return StructDeclSyntax(root: data, data: data)
  }
  public static func makeProtocolDecl(attributes: AttributeListSyntax?, accessLevelModifier: DeclModifierSyntax?, protocolKeyword: TokenSyntax, identifier: TokenSyntax, inheritanceClause: TypeInheritanceClauseSyntax?, genericWhereClause: GenericWhereClauseSyntax?, members: MemberDeclBlockSyntax) -> ProtocolDeclSyntax {
    let data = SyntaxData(raw: .node(.protocolDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      accessLevelModifier?.data.raw ?? RawSyntax.missing(.declModifier),
      protocolKeyword.data.raw,
      identifier.data.raw,
      inheritanceClause?.data.raw ?? RawSyntax.missing(.typeInheritanceClause),
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
      members.data.raw,
    ], .present))
    return ProtocolDeclSyntax(root: data, data: data)
  }

  public static func makeBlankProtocolDecl() -> ProtocolDeclSyntax {
    let data = SyntaxData(raw: .node(.protocolDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.declModifier),
      RawSyntax.missingToken(.protocolKeyword),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.typeInheritanceClause),
      RawSyntax.missing(.genericWhereClause),
      RawSyntax.missing(.memberDeclBlock),
    ], .present))
    return ProtocolDeclSyntax(root: data, data: data)
  }
  public static func makeExtensionDecl(attributes: AttributeListSyntax?, accessLevelModifier: DeclModifierSyntax?, extensionKeyword: TokenSyntax, extendedType: TypeSyntax, inheritanceClause: TypeInheritanceClauseSyntax?, genericWhereClause: GenericWhereClauseSyntax?, members: MemberDeclBlockSyntax) -> ExtensionDeclSyntax {
    let data = SyntaxData(raw: .node(.extensionDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      accessLevelModifier?.data.raw ?? RawSyntax.missing(.declModifier),
      extensionKeyword.data.raw,
      extendedType.data.raw,
      inheritanceClause?.data.raw ?? RawSyntax.missing(.typeInheritanceClause),
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
      members.data.raw,
    ], .present))
    return ExtensionDeclSyntax(root: data, data: data)
  }

  public static func makeBlankExtensionDecl() -> ExtensionDeclSyntax {
    let data = SyntaxData(raw: .node(.extensionDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.declModifier),
      RawSyntax.missingToken(.extensionKeyword),
      RawSyntax.missing(.type),
      RawSyntax.missing(.typeInheritanceClause),
      RawSyntax.missing(.genericWhereClause),
      RawSyntax.missing(.memberDeclBlock),
    ], .present))
    return ExtensionDeclSyntax(root: data, data: data)
  }
  public static func makeMemberDeclBlock(leftBrace: TokenSyntax, members: DeclListSyntax, rightBrace: TokenSyntax) -> MemberDeclBlockSyntax {
    let data = SyntaxData(raw: .node(.memberDeclBlock, [
      leftBrace.data.raw,
      members.data.raw,
      rightBrace.data.raw,
    ], .present))
    return MemberDeclBlockSyntax(root: data, data: data)
  }

  public static func makeBlankMemberDeclBlock() -> MemberDeclBlockSyntax {
    let data = SyntaxData(raw: .node(.memberDeclBlock, [
      RawSyntax.missingToken(.leftBrace),
      RawSyntax.missing(.declList),
      RawSyntax.missingToken(.rightBrace),
    ], .present))
    return MemberDeclBlockSyntax(root: data, data: data)
  }
  public static func makeDeclList(
    _ elements: [DeclSyntax]) -> DeclListSyntax {
    let data = SyntaxData(raw: .node(.declList,
                                     elements.map { $0.data.raw }, .present))
    return DeclListSyntax(root: data, data: data)
  }

  public static func makeBlankDeclList() -> DeclListSyntax {
    let data = SyntaxData(raw: .node(.declList, [
    ], .present))
    return DeclListSyntax(root: data, data: data)
  }
  public static func makeSourceFile(statements: CodeBlockItemListSyntax, eofToken: TokenSyntax) -> SourceFileSyntax {
    let data = SyntaxData(raw: .node(.sourceFile, [
      statements.data.raw,
      eofToken.data.raw,
    ], .present))
    return SourceFileSyntax(root: data, data: data)
  }

  public static func makeBlankSourceFile() -> SourceFileSyntax {
    let data = SyntaxData(raw: .node(.sourceFile, [
      RawSyntax.missing(.codeBlockItemList),
      RawSyntax.missingToken(.unknown),
    ], .present))
    return SourceFileSyntax(root: data, data: data)
  }
  public static func makeInitializerClause(equal: TokenSyntax, value: ExprSyntax) -> InitializerClauseSyntax {
    let data = SyntaxData(raw: .node(.initializerClause, [
      equal.data.raw,
      value.data.raw,
    ], .present))
    return InitializerClauseSyntax(root: data, data: data)
  }

  public static func makeBlankInitializerClause() -> InitializerClauseSyntax {
    let data = SyntaxData(raw: .node(.initializerClause, [
      RawSyntax.missingToken(.equal),
      RawSyntax.missing(.expr),
    ], .present))
    return InitializerClauseSyntax(root: data, data: data)
  }
  public static func makeFunctionParameter(attributes: AttributeListSyntax?, firstName: TokenSyntax, secondName: TokenSyntax?, colon: TokenSyntax, typeAnnotation: TypeSyntax, ellipsis: TokenSyntax?, defaultArgument: InitializerClauseSyntax?, trailingComma: TokenSyntax?) -> FunctionParameterSyntax {
    let data = SyntaxData(raw: .node(.functionParameter, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      firstName.data.raw,
      secondName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      colon.data.raw,
      typeAnnotation.data.raw,
      ellipsis?.data.raw ?? RawSyntax.missingToken(.unknown),
      defaultArgument?.data.raw ?? RawSyntax.missing(.initializerClause),
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return FunctionParameterSyntax(root: data, data: data)
  }

  public static func makeBlankFunctionParameter() -> FunctionParameterSyntax {
    let data = SyntaxData(raw: .node(.functionParameter, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.initializerClause),
      RawSyntax.missingToken(.comma),
    ], .present))
    return FunctionParameterSyntax(root: data, data: data)
  }
  public static func makeModifierList(
    _ elements: [Syntax]) -> ModifierListSyntax {
    let data = SyntaxData(raw: .node(.modifierList,
                                     elements.map { $0.data.raw }, .present))
    return ModifierListSyntax(root: data, data: data)
  }

  public static func makeBlankModifierList() -> ModifierListSyntax {
    let data = SyntaxData(raw: .node(.modifierList, [
    ], .present))
    return ModifierListSyntax(root: data, data: data)
  }
  public static func makeFunctionDecl(attributes: AttributeListSyntax?, modifiers: ModifierListSyntax?, funcKeyword: TokenSyntax, identifier: TokenSyntax, genericParameterClause: GenericParameterClauseSyntax?, signature: FunctionSignatureSyntax, genericWhereClause: GenericWhereClauseSyntax?, body: CodeBlockSyntax?) -> FunctionDeclSyntax {
    let data = SyntaxData(raw: .node(.functionDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      modifiers?.data.raw ?? RawSyntax.missing(.modifierList),
      funcKeyword.data.raw,
      identifier.data.raw,
      genericParameterClause?.data.raw ?? RawSyntax.missing(.genericParameterClause),
      signature.data.raw,
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
      body?.data.raw ?? RawSyntax.missing(.codeBlock),
    ], .present))
    return FunctionDeclSyntax(root: data, data: data)
  }

  public static func makeBlankFunctionDecl() -> FunctionDeclSyntax {
    let data = SyntaxData(raw: .node(.functionDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.modifierList),
      RawSyntax.missingToken(.funcKeyword),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.genericParameterClause),
      RawSyntax.missing(.functionSignature),
      RawSyntax.missing(.genericWhereClause),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return FunctionDeclSyntax(root: data, data: data)
  }
  public static func makeInitializerDecl(attributes: AttributeListSyntax?, modifiers: ModifierListSyntax?, initKeyword: TokenSyntax, optionalMark: TokenSyntax?, genericParameterClause: GenericParameterClauseSyntax?, parameters: ParameterClauseSyntax, throwsOrRethrowsKeyword: TokenSyntax?, genericWhereClause: GenericWhereClauseSyntax?, body: CodeBlockSyntax?) -> InitializerDeclSyntax {
    let data = SyntaxData(raw: .node(.initializerDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      modifiers?.data.raw ?? RawSyntax.missing(.modifierList),
      initKeyword.data.raw,
      optionalMark?.data.raw ?? RawSyntax.missingToken(.postfixQuestionMark),
      genericParameterClause?.data.raw ?? RawSyntax.missing(.genericParameterClause),
      parameters.data.raw,
      throwsOrRethrowsKeyword?.data.raw ?? RawSyntax.missingToken(.throwsKeyword),
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
      body?.data.raw ?? RawSyntax.missing(.codeBlock),
    ], .present))
    return InitializerDeclSyntax(root: data, data: data)
  }

  public static func makeBlankInitializerDecl() -> InitializerDeclSyntax {
    let data = SyntaxData(raw: .node(.initializerDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.modifierList),
      RawSyntax.missingToken(.initKeyword),
      RawSyntax.missingToken(.postfixQuestionMark),
      RawSyntax.missing(.genericParameterClause),
      RawSyntax.missing(.parameterClause),
      RawSyntax.missingToken(.throwsKeyword),
      RawSyntax.missing(.genericWhereClause),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return InitializerDeclSyntax(root: data, data: data)
  }
  public static func makeDeinitializerDecl(attributes: AttributeListSyntax?, modifiers: ModifierListSyntax?, deinitKeyword: TokenSyntax, body: CodeBlockSyntax) -> DeinitializerDeclSyntax {
    let data = SyntaxData(raw: .node(.deinitializerDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      modifiers?.data.raw ?? RawSyntax.missing(.modifierList),
      deinitKeyword.data.raw,
      body.data.raw,
    ], .present))
    return DeinitializerDeclSyntax(root: data, data: data)
  }

  public static func makeBlankDeinitializerDecl() -> DeinitializerDeclSyntax {
    let data = SyntaxData(raw: .node(.deinitializerDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.modifierList),
      RawSyntax.missingToken(.deinitKeyword),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return DeinitializerDeclSyntax(root: data, data: data)
  }
  public static func makeSubscriptDecl(attributes: AttributeListSyntax?, modifiers: ModifierListSyntax?, subscriptKeyword: TokenSyntax, genericParameterClause: GenericParameterClauseSyntax?, indices: ParameterClauseSyntax, result: ReturnClauseSyntax, genericWhereClause: GenericWhereClauseSyntax?, accessor: AccessorBlockSyntax?) -> SubscriptDeclSyntax {
    let data = SyntaxData(raw: .node(.subscriptDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      modifiers?.data.raw ?? RawSyntax.missing(.modifierList),
      subscriptKeyword.data.raw,
      genericParameterClause?.data.raw ?? RawSyntax.missing(.genericParameterClause),
      indices.data.raw,
      result.data.raw,
      genericWhereClause?.data.raw ?? RawSyntax.missing(.genericWhereClause),
      accessor?.data.raw ?? RawSyntax.missing(.accessorBlock),
    ], .present))
    return SubscriptDeclSyntax(root: data, data: data)
  }

  public static func makeBlankSubscriptDecl() -> SubscriptDeclSyntax {
    let data = SyntaxData(raw: .node(.subscriptDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.modifierList),
      RawSyntax.missingToken(.subscriptKeyword),
      RawSyntax.missing(.genericParameterClause),
      RawSyntax.missing(.parameterClause),
      RawSyntax.missing(.returnClause),
      RawSyntax.missing(.genericWhereClause),
      RawSyntax.missing(.accessorBlock),
    ], .present))
    return SubscriptDeclSyntax(root: data, data: data)
  }
  public static func makeElseifDirectiveClauseList(
    _ elements: [ElseifDirectiveClauseSyntax]) -> ElseifDirectiveClauseListSyntax {
    let data = SyntaxData(raw: .node(.elseifDirectiveClauseList,
                                     elements.map { $0.data.raw }, .present))
    return ElseifDirectiveClauseListSyntax(root: data, data: data)
  }

  public static func makeBlankElseifDirectiveClauseList() -> ElseifDirectiveClauseListSyntax {
    let data = SyntaxData(raw: .node(.elseifDirectiveClauseList, [
    ], .present))
    return ElseifDirectiveClauseListSyntax(root: data, data: data)
  }
  public static func makeElseDirectiveClause(poundElse: TokenSyntax, statements: CodeBlockItemListSyntax) -> ElseDirectiveClauseSyntax {
    let data = SyntaxData(raw: .node(.elseDirectiveClause, [
      poundElse.data.raw,
      statements.data.raw,
    ], .present))
    return ElseDirectiveClauseSyntax(root: data, data: data)
  }

  public static func makeBlankElseDirectiveClause() -> ElseDirectiveClauseSyntax {
    let data = SyntaxData(raw: .node(.elseDirectiveClause, [
      RawSyntax.missingToken(.poundElseKeyword),
      RawSyntax.missing(.codeBlockItemList),
    ], .present))
    return ElseDirectiveClauseSyntax(root: data, data: data)
  }
  public static func makeAccessLevelModifier(name: TokenSyntax, leftParen: TokenSyntax?, modifier: TokenSyntax?, rightParen: TokenSyntax?) -> AccessLevelModifierSyntax {
    let data = SyntaxData(raw: .node(.accessLevelModifier, [
      name.data.raw,
      leftParen?.data.raw ?? RawSyntax.missingToken(.leftParen),
      modifier?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      rightParen?.data.raw ?? RawSyntax.missingToken(.rightParen),
    ], .present))
    return AccessLevelModifierSyntax(root: data, data: data)
  }

  public static func makeBlankAccessLevelModifier() -> AccessLevelModifierSyntax {
    let data = SyntaxData(raw: .node(.accessLevelModifier, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return AccessLevelModifierSyntax(root: data, data: data)
  }
  public static func makeAccessPathComponent(name: TokenSyntax, trailingDot: TokenSyntax?) -> AccessPathComponentSyntax {
    let data = SyntaxData(raw: .node(.accessPathComponent, [
      name.data.raw,
      trailingDot?.data.raw ?? RawSyntax.missingToken(.period),
    ], .present))
    return AccessPathComponentSyntax(root: data, data: data)
  }

  public static func makeBlankAccessPathComponent() -> AccessPathComponentSyntax {
    let data = SyntaxData(raw: .node(.accessPathComponent, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.period),
    ], .present))
    return AccessPathComponentSyntax(root: data, data: data)
  }
  public static func makeAccessPath(
    _ elements: [AccessPathComponentSyntax]) -> AccessPathSyntax {
    let data = SyntaxData(raw: .node(.accessPath,
                                     elements.map { $0.data.raw }, .present))
    return AccessPathSyntax(root: data, data: data)
  }

  public static func makeBlankAccessPath() -> AccessPathSyntax {
    let data = SyntaxData(raw: .node(.accessPath, [
    ], .present))
    return AccessPathSyntax(root: data, data: data)
  }
  public static func makeImportDecl(attributes: AttributeListSyntax?, importTok: TokenSyntax, importKind: TokenSyntax?, path: AccessPathSyntax) -> ImportDeclSyntax {
    let data = SyntaxData(raw: .node(.importDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      importTok.data.raw,
      importKind?.data.raw ?? RawSyntax.missingToken(.typealiasKeyword),
      path.data.raw,
    ], .present))
    return ImportDeclSyntax(root: data, data: data)
  }

  public static func makeBlankImportDecl() -> ImportDeclSyntax {
    let data = SyntaxData(raw: .node(.importDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missingToken(.importKeyword),
      RawSyntax.missingToken(.typealiasKeyword),
      RawSyntax.missing(.accessPath),
    ], .present))
    return ImportDeclSyntax(root: data, data: data)
  }
  public static func makeAccessorParameter(leftParen: TokenSyntax, name: TokenSyntax, rightParen: TokenSyntax) -> AccessorParameterSyntax {
    let data = SyntaxData(raw: .node(.accessorParameter, [
      leftParen.data.raw,
      name.data.raw,
      rightParen.data.raw,
    ], .present))
    return AccessorParameterSyntax(root: data, data: data)
  }

  public static func makeBlankAccessorParameter() -> AccessorParameterSyntax {
    let data = SyntaxData(raw: .node(.accessorParameter, [
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return AccessorParameterSyntax(root: data, data: data)
  }
  public static func makeAccessorDecl(attributes: AttributeListSyntax?, modifier: DeclModifierSyntax?, accessorKind: TokenSyntax, parameter: AccessorParameterSyntax?, body: CodeBlockSyntax?) -> AccessorDeclSyntax {
    let data = SyntaxData(raw: .node(.accessorDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      modifier?.data.raw ?? RawSyntax.missing(.declModifier),
      accessorKind.data.raw,
      parameter?.data.raw ?? RawSyntax.missing(.accessorParameter),
      body?.data.raw ?? RawSyntax.missing(.codeBlock),
    ], .present))
    return AccessorDeclSyntax(root: data, data: data)
  }

  public static func makeBlankAccessorDecl() -> AccessorDeclSyntax {
    let data = SyntaxData(raw: .node(.accessorDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.declModifier),
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.accessorParameter),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return AccessorDeclSyntax(root: data, data: data)
  }
  public static func makeAccessorList(
    _ elements: [AccessorDeclSyntax]) -> AccessorListSyntax {
    let data = SyntaxData(raw: .node(.accessorList,
                                     elements.map { $0.data.raw }, .present))
    return AccessorListSyntax(root: data, data: data)
  }

  public static func makeBlankAccessorList() -> AccessorListSyntax {
    let data = SyntaxData(raw: .node(.accessorList, [
    ], .present))
    return AccessorListSyntax(root: data, data: data)
  }
  public static func makeAccessorBlock(leftBrace: TokenSyntax, accessorListOrStmtList: Syntax, rightBrace: TokenSyntax) -> AccessorBlockSyntax {
    let data = SyntaxData(raw: .node(.accessorBlock, [
      leftBrace.data.raw,
      accessorListOrStmtList.data.raw,
      rightBrace.data.raw,
    ], .present))
    return AccessorBlockSyntax(root: data, data: data)
  }

  public static func makeBlankAccessorBlock() -> AccessorBlockSyntax {
    let data = SyntaxData(raw: .node(.accessorBlock, [
      RawSyntax.missingToken(.leftBrace),
      RawSyntax.missing(.unknown),
      RawSyntax.missingToken(.rightBrace),
    ], .present))
    return AccessorBlockSyntax(root: data, data: data)
  }
  public static func makePatternBinding(pattern: PatternSyntax, typeAnnotation: TypeAnnotationSyntax?, initializer: InitializerClauseSyntax?, accessor: AccessorBlockSyntax?, trailingComma: TokenSyntax?) -> PatternBindingSyntax {
    let data = SyntaxData(raw: .node(.patternBinding, [
      pattern.data.raw,
      typeAnnotation?.data.raw ?? RawSyntax.missing(.typeAnnotation),
      initializer?.data.raw ?? RawSyntax.missing(.initializerClause),
      accessor?.data.raw ?? RawSyntax.missing(.accessorBlock),
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return PatternBindingSyntax(root: data, data: data)
  }

  public static func makeBlankPatternBinding() -> PatternBindingSyntax {
    let data = SyntaxData(raw: .node(.patternBinding, [
      RawSyntax.missing(.pattern),
      RawSyntax.missing(.typeAnnotation),
      RawSyntax.missing(.initializerClause),
      RawSyntax.missing(.accessorBlock),
      RawSyntax.missingToken(.comma),
    ], .present))
    return PatternBindingSyntax(root: data, data: data)
  }
  public static func makePatternBindingList(
    _ elements: [PatternBindingSyntax]) -> PatternBindingListSyntax {
    let data = SyntaxData(raw: .node(.patternBindingList,
                                     elements.map { $0.data.raw }, .present))
    return PatternBindingListSyntax(root: data, data: data)
  }

  public static func makeBlankPatternBindingList() -> PatternBindingListSyntax {
    let data = SyntaxData(raw: .node(.patternBindingList, [
    ], .present))
    return PatternBindingListSyntax(root: data, data: data)
  }
  public static func makeVariableDecl(attributes: AttributeListSyntax?, modifiers: ModifierListSyntax?, letOrVarKeyword: TokenSyntax, bindings: PatternBindingListSyntax) -> VariableDeclSyntax {
    let data = SyntaxData(raw: .node(.variableDecl, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      modifiers?.data.raw ?? RawSyntax.missing(.modifierList),
      letOrVarKeyword.data.raw,
      bindings.data.raw,
    ], .present))
    return VariableDeclSyntax(root: data, data: data)
  }

  public static func makeBlankVariableDecl() -> VariableDeclSyntax {
    let data = SyntaxData(raw: .node(.variableDecl, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.modifierList),
      RawSyntax.missingToken(.letKeyword),
      RawSyntax.missing(.patternBindingList),
    ], .present))
    return VariableDeclSyntax(root: data, data: data)
  }
  public static func makeTokenList(
    _ elements: [TokenSyntax]) -> TokenListSyntax {
    let data = SyntaxData(raw: .node(.tokenList,
                                     elements.map { $0.data.raw }, .present))
    return TokenListSyntax(root: data, data: data)
  }

  public static func makeBlankTokenList() -> TokenListSyntax {
    let data = SyntaxData(raw: .node(.tokenList, [
    ], .present))
    return TokenListSyntax(root: data, data: data)
  }
  public static func makeAttribute(atSignToken: TokenSyntax, attributeName: TokenSyntax, balancedTokens: TokenListSyntax) -> AttributeSyntax {
    let data = SyntaxData(raw: .node(.attribute, [
      atSignToken.data.raw,
      attributeName.data.raw,
      balancedTokens.data.raw,
    ], .present))
    return AttributeSyntax(root: data, data: data)
  }

  public static func makeBlankAttribute() -> AttributeSyntax {
    let data = SyntaxData(raw: .node(.attribute, [
      RawSyntax.missingToken(.atSign),
      RawSyntax.missingToken(.unknown),
      RawSyntax.missingToken(.unknown),
    ], .present))
    return AttributeSyntax(root: data, data: data)
  }
  public static func makeAttributeList(
    _ elements: [AttributeSyntax]) -> AttributeListSyntax {
    let data = SyntaxData(raw: .node(.attributeList,
                                     elements.map { $0.data.raw }, .present))
    return AttributeListSyntax(root: data, data: data)
  }

  public static func makeBlankAttributeList() -> AttributeListSyntax {
    let data = SyntaxData(raw: .node(.attributeList, [
    ], .present))
    return AttributeListSyntax(root: data, data: data)
  }
  public static func makeContinueStmt(continueKeyword: TokenSyntax, label: TokenSyntax?) -> ContinueStmtSyntax {
    let data = SyntaxData(raw: .node(.continueStmt, [
      continueKeyword.data.raw,
      label?.data.raw ?? RawSyntax.missingToken(.identifier("")),
    ], .present))
    return ContinueStmtSyntax(root: data, data: data)
  }

  public static func makeBlankContinueStmt() -> ContinueStmtSyntax {
    let data = SyntaxData(raw: .node(.continueStmt, [
      RawSyntax.missingToken(.continueKeyword),
      RawSyntax.missingToken(.identifier("")),
    ], .present))
    return ContinueStmtSyntax(root: data, data: data)
  }
  public static func makeWhileStmt(labelName: TokenSyntax?, labelColon: TokenSyntax?, whileKeyword: TokenSyntax, conditions: ConditionElementListSyntax, body: CodeBlockSyntax) -> WhileStmtSyntax {
    let data = SyntaxData(raw: .node(.whileStmt, [
      labelName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      labelColon?.data.raw ?? RawSyntax.missingToken(.colon),
      whileKeyword.data.raw,
      conditions.data.raw,
      body.data.raw,
    ], .present))
    return WhileStmtSyntax(root: data, data: data)
  }

  public static func makeBlankWhileStmt() -> WhileStmtSyntax {
    let data = SyntaxData(raw: .node(.whileStmt, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missingToken(.whileKeyword),
      RawSyntax.missing(.conditionElementList),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return WhileStmtSyntax(root: data, data: data)
  }
  public static func makeDeferStmt(deferKeyword: TokenSyntax, body: CodeBlockSyntax) -> DeferStmtSyntax {
    let data = SyntaxData(raw: .node(.deferStmt, [
      deferKeyword.data.raw,
      body.data.raw,
    ], .present))
    return DeferStmtSyntax(root: data, data: data)
  }

  public static func makeBlankDeferStmt() -> DeferStmtSyntax {
    let data = SyntaxData(raw: .node(.deferStmt, [
      RawSyntax.missingToken(.deferKeyword),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return DeferStmtSyntax(root: data, data: data)
  }
  public static func makeExpressionStmt(expression: ExprSyntax) -> ExpressionStmtSyntax {
    let data = SyntaxData(raw: .node(.expressionStmt, [
      expression.data.raw,
    ], .present))
    return ExpressionStmtSyntax(root: data, data: data)
  }

  public static func makeBlankExpressionStmt() -> ExpressionStmtSyntax {
    let data = SyntaxData(raw: .node(.expressionStmt, [
      RawSyntax.missing(.expr),
    ], .present))
    return ExpressionStmtSyntax(root: data, data: data)
  }
  public static func makeSwitchCaseList(
    _ elements: [SwitchCaseSyntax]) -> SwitchCaseListSyntax {
    let data = SyntaxData(raw: .node(.switchCaseList,
                                     elements.map { $0.data.raw }, .present))
    return SwitchCaseListSyntax(root: data, data: data)
  }

  public static func makeBlankSwitchCaseList() -> SwitchCaseListSyntax {
    let data = SyntaxData(raw: .node(.switchCaseList, [
    ], .present))
    return SwitchCaseListSyntax(root: data, data: data)
  }
  public static func makeRepeatWhileStmt(labelName: TokenSyntax?, labelColon: TokenSyntax?, repeatKeyword: TokenSyntax, body: CodeBlockSyntax, whileKeyword: TokenSyntax, condition: ExprSyntax) -> RepeatWhileStmtSyntax {
    let data = SyntaxData(raw: .node(.repeatWhileStmt, [
      labelName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      labelColon?.data.raw ?? RawSyntax.missingToken(.colon),
      repeatKeyword.data.raw,
      body.data.raw,
      whileKeyword.data.raw,
      condition.data.raw,
    ], .present))
    return RepeatWhileStmtSyntax(root: data, data: data)
  }

  public static func makeBlankRepeatWhileStmt() -> RepeatWhileStmtSyntax {
    let data = SyntaxData(raw: .node(.repeatWhileStmt, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missingToken(.repeatKeyword),
      RawSyntax.missing(.codeBlock),
      RawSyntax.missingToken(.whileKeyword),
      RawSyntax.missing(.expr),
    ], .present))
    return RepeatWhileStmtSyntax(root: data, data: data)
  }
  public static func makeGuardStmt(guardKeyword: TokenSyntax, conditions: ConditionElementListSyntax, elseKeyword: TokenSyntax, body: CodeBlockSyntax) -> GuardStmtSyntax {
    let data = SyntaxData(raw: .node(.guardStmt, [
      guardKeyword.data.raw,
      conditions.data.raw,
      elseKeyword.data.raw,
      body.data.raw,
    ], .present))
    return GuardStmtSyntax(root: data, data: data)
  }

  public static func makeBlankGuardStmt() -> GuardStmtSyntax {
    let data = SyntaxData(raw: .node(.guardStmt, [
      RawSyntax.missingToken(.guardKeyword),
      RawSyntax.missing(.conditionElementList),
      RawSyntax.missingToken(.elseKeyword),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return GuardStmtSyntax(root: data, data: data)
  }
  public static func makeWhereClause(whereKeyword: TokenSyntax, guardResult: ExprSyntax) -> WhereClauseSyntax {
    let data = SyntaxData(raw: .node(.whereClause, [
      whereKeyword.data.raw,
      guardResult.data.raw,
    ], .present))
    return WhereClauseSyntax(root: data, data: data)
  }

  public static func makeBlankWhereClause() -> WhereClauseSyntax {
    let data = SyntaxData(raw: .node(.whereClause, [
      RawSyntax.missingToken(.whereKeyword),
      RawSyntax.missing(.expr),
    ], .present))
    return WhereClauseSyntax(root: data, data: data)
  }
  public static func makeForInStmt(labelName: TokenSyntax?, labelColon: TokenSyntax?, forKeyword: TokenSyntax, caseKeyword: TokenSyntax?, pattern: PatternSyntax, typeAnnotation: TypeAnnotationSyntax?, inKeyword: TokenSyntax, sequenceExpr: ExprSyntax, whereClause: WhereClauseSyntax?, body: CodeBlockSyntax) -> ForInStmtSyntax {
    let data = SyntaxData(raw: .node(.forInStmt, [
      labelName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      labelColon?.data.raw ?? RawSyntax.missingToken(.colon),
      forKeyword.data.raw,
      caseKeyword?.data.raw ?? RawSyntax.missingToken(.caseKeyword),
      pattern.data.raw,
      typeAnnotation?.data.raw ?? RawSyntax.missing(.typeAnnotation),
      inKeyword.data.raw,
      sequenceExpr.data.raw,
      whereClause?.data.raw ?? RawSyntax.missing(.whereClause),
      body.data.raw,
    ], .present))
    return ForInStmtSyntax(root: data, data: data)
  }

  public static func makeBlankForInStmt() -> ForInStmtSyntax {
    let data = SyntaxData(raw: .node(.forInStmt, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missingToken(.forKeyword),
      RawSyntax.missingToken(.caseKeyword),
      RawSyntax.missing(.pattern),
      RawSyntax.missing(.typeAnnotation),
      RawSyntax.missingToken(.inKeyword),
      RawSyntax.missing(.expr),
      RawSyntax.missing(.whereClause),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return ForInStmtSyntax(root: data, data: data)
  }
  public static func makeSwitchStmt(labelName: TokenSyntax?, labelColon: TokenSyntax?, switchKeyword: TokenSyntax, expression: ExprSyntax, leftBrace: TokenSyntax, cases: SwitchCaseListSyntax, rightBrace: TokenSyntax) -> SwitchStmtSyntax {
    let data = SyntaxData(raw: .node(.switchStmt, [
      labelName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      labelColon?.data.raw ?? RawSyntax.missingToken(.colon),
      switchKeyword.data.raw,
      expression.data.raw,
      leftBrace.data.raw,
      cases.data.raw,
      rightBrace.data.raw,
    ], .present))
    return SwitchStmtSyntax(root: data, data: data)
  }

  public static func makeBlankSwitchStmt() -> SwitchStmtSyntax {
    let data = SyntaxData(raw: .node(.switchStmt, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missingToken(.switchKeyword),
      RawSyntax.missing(.expr),
      RawSyntax.missingToken(.leftBrace),
      RawSyntax.missing(.switchCaseList),
      RawSyntax.missingToken(.rightBrace),
    ], .present))
    return SwitchStmtSyntax(root: data, data: data)
  }
  public static func makeCatchClauseList(
    _ elements: [CatchClauseSyntax]) -> CatchClauseListSyntax {
    let data = SyntaxData(raw: .node(.catchClauseList,
                                     elements.map { $0.data.raw }, .present))
    return CatchClauseListSyntax(root: data, data: data)
  }

  public static func makeBlankCatchClauseList() -> CatchClauseListSyntax {
    let data = SyntaxData(raw: .node(.catchClauseList, [
    ], .present))
    return CatchClauseListSyntax(root: data, data: data)
  }
  public static func makeDoStmt(labelName: TokenSyntax?, labelColon: TokenSyntax?, doKeyword: TokenSyntax, body: CodeBlockSyntax, catchClauses: CatchClauseListSyntax?) -> DoStmtSyntax {
    let data = SyntaxData(raw: .node(.doStmt, [
      labelName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      labelColon?.data.raw ?? RawSyntax.missingToken(.colon),
      doKeyword.data.raw,
      body.data.raw,
      catchClauses?.data.raw ?? RawSyntax.missing(.catchClauseList),
    ], .present))
    return DoStmtSyntax(root: data, data: data)
  }

  public static func makeBlankDoStmt() -> DoStmtSyntax {
    let data = SyntaxData(raw: .node(.doStmt, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missingToken(.doKeyword),
      RawSyntax.missing(.codeBlock),
      RawSyntax.missing(.catchClauseList),
    ], .present))
    return DoStmtSyntax(root: data, data: data)
  }
  public static func makeReturnStmt(returnKeyword: TokenSyntax, expression: ExprSyntax?) -> ReturnStmtSyntax {
    let data = SyntaxData(raw: .node(.returnStmt, [
      returnKeyword.data.raw,
      expression?.data.raw ?? RawSyntax.missing(.expr),
    ], .present))
    return ReturnStmtSyntax(root: data, data: data)
  }

  public static func makeBlankReturnStmt() -> ReturnStmtSyntax {
    let data = SyntaxData(raw: .node(.returnStmt, [
      RawSyntax.missingToken(.returnKeyword),
      RawSyntax.missing(.expr),
    ], .present))
    return ReturnStmtSyntax(root: data, data: data)
  }
  public static func makeFallthroughStmt(fallthroughKeyword: TokenSyntax) -> FallthroughStmtSyntax {
    let data = SyntaxData(raw: .node(.fallthroughStmt, [
      fallthroughKeyword.data.raw,
    ], .present))
    return FallthroughStmtSyntax(root: data, data: data)
  }

  public static func makeBlankFallthroughStmt() -> FallthroughStmtSyntax {
    let data = SyntaxData(raw: .node(.fallthroughStmt, [
      RawSyntax.missingToken(.fallthroughKeyword),
    ], .present))
    return FallthroughStmtSyntax(root: data, data: data)
  }
  public static func makeBreakStmt(breakKeyword: TokenSyntax, label: TokenSyntax?) -> BreakStmtSyntax {
    let data = SyntaxData(raw: .node(.breakStmt, [
      breakKeyword.data.raw,
      label?.data.raw ?? RawSyntax.missingToken(.identifier("")),
    ], .present))
    return BreakStmtSyntax(root: data, data: data)
  }

  public static func makeBlankBreakStmt() -> BreakStmtSyntax {
    let data = SyntaxData(raw: .node(.breakStmt, [
      RawSyntax.missingToken(.breakKeyword),
      RawSyntax.missingToken(.identifier("")),
    ], .present))
    return BreakStmtSyntax(root: data, data: data)
  }
  public static func makeCaseItemList(
    _ elements: [CaseItemSyntax]) -> CaseItemListSyntax {
    let data = SyntaxData(raw: .node(.caseItemList,
                                     elements.map { $0.data.raw }, .present))
    return CaseItemListSyntax(root: data, data: data)
  }

  public static func makeBlankCaseItemList() -> CaseItemListSyntax {
    let data = SyntaxData(raw: .node(.caseItemList, [
    ], .present))
    return CaseItemListSyntax(root: data, data: data)
  }
  public static func makeConditionElement(condition: Syntax, trailingComma: TokenSyntax?) -> ConditionElementSyntax {
    let data = SyntaxData(raw: .node(.conditionElement, [
      condition.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return ConditionElementSyntax(root: data, data: data)
  }

  public static func makeBlankConditionElement() -> ConditionElementSyntax {
    let data = SyntaxData(raw: .node(.conditionElement, [
      RawSyntax.missing(.unknown),
      RawSyntax.missingToken(.comma),
    ], .present))
    return ConditionElementSyntax(root: data, data: data)
  }
  public static func makeAvailabilityCondition(poundAvailableKeyword: TokenSyntax, arguments: TokenListSyntax) -> AvailabilityConditionSyntax {
    let data = SyntaxData(raw: .node(.availabilityCondition, [
      poundAvailableKeyword.data.raw,
      arguments.data.raw,
    ], .present))
    return AvailabilityConditionSyntax(root: data, data: data)
  }

  public static func makeBlankAvailabilityCondition() -> AvailabilityConditionSyntax {
    let data = SyntaxData(raw: .node(.availabilityCondition, [
      RawSyntax.missingToken(.poundAvailableKeyword),
      RawSyntax.missingToken(.unknown),
    ], .present))
    return AvailabilityConditionSyntax(root: data, data: data)
  }
  public static func makeMatchingPatternCondition(caseKeyword: TokenSyntax, pattern: PatternSyntax, typeAnnotation: TypeAnnotationSyntax?, initializer: InitializerClauseSyntax) -> MatchingPatternConditionSyntax {
    let data = SyntaxData(raw: .node(.matchingPatternCondition, [
      caseKeyword.data.raw,
      pattern.data.raw,
      typeAnnotation?.data.raw ?? RawSyntax.missing(.typeAnnotation),
      initializer.data.raw,
    ], .present))
    return MatchingPatternConditionSyntax(root: data, data: data)
  }

  public static func makeBlankMatchingPatternCondition() -> MatchingPatternConditionSyntax {
    let data = SyntaxData(raw: .node(.matchingPatternCondition, [
      RawSyntax.missingToken(.caseKeyword),
      RawSyntax.missing(.pattern),
      RawSyntax.missing(.typeAnnotation),
      RawSyntax.missing(.initializerClause),
    ], .present))
    return MatchingPatternConditionSyntax(root: data, data: data)
  }
  public static func makeOptionalBindingCondition(letOrVarKeyword: TokenSyntax, pattern: PatternSyntax, typeAnnotation: TypeAnnotationSyntax?, initializer: InitializerClauseSyntax) -> OptionalBindingConditionSyntax {
    let data = SyntaxData(raw: .node(.optionalBindingCondition, [
      letOrVarKeyword.data.raw,
      pattern.data.raw,
      typeAnnotation?.data.raw ?? RawSyntax.missing(.typeAnnotation),
      initializer.data.raw,
    ], .present))
    return OptionalBindingConditionSyntax(root: data, data: data)
  }

  public static func makeBlankOptionalBindingCondition() -> OptionalBindingConditionSyntax {
    let data = SyntaxData(raw: .node(.optionalBindingCondition, [
      RawSyntax.missingToken(.letKeyword),
      RawSyntax.missing(.pattern),
      RawSyntax.missing(.typeAnnotation),
      RawSyntax.missing(.initializerClause),
    ], .present))
    return OptionalBindingConditionSyntax(root: data, data: data)
  }
  public static func makeConditionElementList(
    _ elements: [ConditionElementSyntax]) -> ConditionElementListSyntax {
    let data = SyntaxData(raw: .node(.conditionElementList,
                                     elements.map { $0.data.raw }, .present))
    return ConditionElementListSyntax(root: data, data: data)
  }

  public static func makeBlankConditionElementList() -> ConditionElementListSyntax {
    let data = SyntaxData(raw: .node(.conditionElementList, [
    ], .present))
    return ConditionElementListSyntax(root: data, data: data)
  }
  public static func makeDeclarationStmt(declaration: DeclSyntax) -> DeclarationStmtSyntax {
    let data = SyntaxData(raw: .node(.declarationStmt, [
      declaration.data.raw,
    ], .present))
    return DeclarationStmtSyntax(root: data, data: data)
  }

  public static func makeBlankDeclarationStmt() -> DeclarationStmtSyntax {
    let data = SyntaxData(raw: .node(.declarationStmt, [
      RawSyntax.missing(.decl),
    ], .present))
    return DeclarationStmtSyntax(root: data, data: data)
  }
  public static func makeThrowStmt(throwKeyword: TokenSyntax, expression: ExprSyntax) -> ThrowStmtSyntax {
    let data = SyntaxData(raw: .node(.throwStmt, [
      throwKeyword.data.raw,
      expression.data.raw,
    ], .present))
    return ThrowStmtSyntax(root: data, data: data)
  }

  public static func makeBlankThrowStmt() -> ThrowStmtSyntax {
    let data = SyntaxData(raw: .node(.throwStmt, [
      RawSyntax.missingToken(.throwKeyword),
      RawSyntax.missing(.expr),
    ], .present))
    return ThrowStmtSyntax(root: data, data: data)
  }
  public static func makeIfStmt(labelName: TokenSyntax?, labelColon: TokenSyntax?, ifKeyword: TokenSyntax, conditions: ConditionElementListSyntax, body: CodeBlockSyntax, elseKeyword: TokenSyntax?, elseBody: Syntax?) -> IfStmtSyntax {
    let data = SyntaxData(raw: .node(.ifStmt, [
      labelName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      labelColon?.data.raw ?? RawSyntax.missingToken(.colon),
      ifKeyword.data.raw,
      conditions.data.raw,
      body.data.raw,
      elseKeyword?.data.raw ?? RawSyntax.missingToken(.elseKeyword),
      elseBody?.data.raw ?? RawSyntax.missing(.unknown),
    ], .present))
    return IfStmtSyntax(root: data, data: data)
  }

  public static func makeBlankIfStmt() -> IfStmtSyntax {
    let data = SyntaxData(raw: .node(.ifStmt, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missingToken(.ifKeyword),
      RawSyntax.missing(.conditionElementList),
      RawSyntax.missing(.codeBlock),
      RawSyntax.missingToken(.elseKeyword),
      RawSyntax.missing(.unknown),
    ], .present))
    return IfStmtSyntax(root: data, data: data)
  }
  public static func makeElseIfContinuation(ifStatement: IfStmtSyntax) -> ElseIfContinuationSyntax {
    let data = SyntaxData(raw: .node(.elseIfContinuation, [
      ifStatement.data.raw,
    ], .present))
    return ElseIfContinuationSyntax(root: data, data: data)
  }

  public static func makeBlankElseIfContinuation() -> ElseIfContinuationSyntax {
    let data = SyntaxData(raw: .node(.elseIfContinuation, [
      RawSyntax.missing(.ifStmt),
    ], .present))
    return ElseIfContinuationSyntax(root: data, data: data)
  }
  public static func makeElseBlock(elseKeyword: TokenSyntax, body: CodeBlockSyntax) -> ElseBlockSyntax {
    let data = SyntaxData(raw: .node(.elseBlock, [
      elseKeyword.data.raw,
      body.data.raw,
    ], .present))
    return ElseBlockSyntax(root: data, data: data)
  }

  public static func makeBlankElseBlock() -> ElseBlockSyntax {
    let data = SyntaxData(raw: .node(.elseBlock, [
      RawSyntax.missingToken(.elseKeyword),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return ElseBlockSyntax(root: data, data: data)
  }
  public static func makeSwitchCase(label: Syntax, statements: CodeBlockItemListSyntax) -> SwitchCaseSyntax {
    let data = SyntaxData(raw: .node(.switchCase, [
      label.data.raw,
      statements.data.raw,
    ], .present))
    return SwitchCaseSyntax(root: data, data: data)
  }

  public static func makeBlankSwitchCase() -> SwitchCaseSyntax {
    let data = SyntaxData(raw: .node(.switchCase, [
      RawSyntax.missing(.unknown),
      RawSyntax.missing(.codeBlockItemList),
    ], .present))
    return SwitchCaseSyntax(root: data, data: data)
  }
  public static func makeSwitchDefaultLabel(defaultKeyword: TokenSyntax, colon: TokenSyntax) -> SwitchDefaultLabelSyntax {
    let data = SyntaxData(raw: .node(.switchDefaultLabel, [
      defaultKeyword.data.raw,
      colon.data.raw,
    ], .present))
    return SwitchDefaultLabelSyntax(root: data, data: data)
  }

  public static func makeBlankSwitchDefaultLabel() -> SwitchDefaultLabelSyntax {
    let data = SyntaxData(raw: .node(.switchDefaultLabel, [
      RawSyntax.missingToken(.defaultKeyword),
      RawSyntax.missingToken(.colon),
    ], .present))
    return SwitchDefaultLabelSyntax(root: data, data: data)
  }
  public static func makeCaseItem(pattern: PatternSyntax, whereClause: WhereClauseSyntax?, trailingComma: TokenSyntax?) -> CaseItemSyntax {
    let data = SyntaxData(raw: .node(.caseItem, [
      pattern.data.raw,
      whereClause?.data.raw ?? RawSyntax.missing(.whereClause),
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return CaseItemSyntax(root: data, data: data)
  }

  public static func makeBlankCaseItem() -> CaseItemSyntax {
    let data = SyntaxData(raw: .node(.caseItem, [
      RawSyntax.missing(.pattern),
      RawSyntax.missing(.whereClause),
      RawSyntax.missingToken(.comma),
    ], .present))
    return CaseItemSyntax(root: data, data: data)
  }
  public static func makeSwitchCaseLabel(caseKeyword: TokenSyntax, caseItems: CaseItemListSyntax, colon: TokenSyntax) -> SwitchCaseLabelSyntax {
    let data = SyntaxData(raw: .node(.switchCaseLabel, [
      caseKeyword.data.raw,
      caseItems.data.raw,
      colon.data.raw,
    ], .present))
    return SwitchCaseLabelSyntax(root: data, data: data)
  }

  public static func makeBlankSwitchCaseLabel() -> SwitchCaseLabelSyntax {
    let data = SyntaxData(raw: .node(.switchCaseLabel, [
      RawSyntax.missingToken(.caseKeyword),
      RawSyntax.missing(.caseItemList),
      RawSyntax.missingToken(.colon),
    ], .present))
    return SwitchCaseLabelSyntax(root: data, data: data)
  }
  public static func makeCatchClause(catchKeyword: TokenSyntax, pattern: PatternSyntax?, whereClause: WhereClauseSyntax?, body: CodeBlockSyntax) -> CatchClauseSyntax {
    let data = SyntaxData(raw: .node(.catchClause, [
      catchKeyword.data.raw,
      pattern?.data.raw ?? RawSyntax.missing(.pattern),
      whereClause?.data.raw ?? RawSyntax.missing(.whereClause),
      body.data.raw,
    ], .present))
    return CatchClauseSyntax(root: data, data: data)
  }

  public static func makeBlankCatchClause() -> CatchClauseSyntax {
    let data = SyntaxData(raw: .node(.catchClause, [
      RawSyntax.missingToken(.catchKeyword),
      RawSyntax.missing(.pattern),
      RawSyntax.missing(.whereClause),
      RawSyntax.missing(.codeBlock),
    ], .present))
    return CatchClauseSyntax(root: data, data: data)
  }
  public static func makeGenericWhereClause(whereKeyword: TokenSyntax, requirementList: GenericRequirementListSyntax) -> GenericWhereClauseSyntax {
    let data = SyntaxData(raw: .node(.genericWhereClause, [
      whereKeyword.data.raw,
      requirementList.data.raw,
    ], .present))
    return GenericWhereClauseSyntax(root: data, data: data)
  }

  public static func makeBlankGenericWhereClause() -> GenericWhereClauseSyntax {
    let data = SyntaxData(raw: .node(.genericWhereClause, [
      RawSyntax.missingToken(.whereKeyword),
      RawSyntax.missing(.genericRequirementList),
    ], .present))
    return GenericWhereClauseSyntax(root: data, data: data)
  }
  public static func makeGenericRequirementList(
    _ elements: [Syntax]) -> GenericRequirementListSyntax {
    let data = SyntaxData(raw: .node(.genericRequirementList,
                                     elements.map { $0.data.raw }, .present))
    return GenericRequirementListSyntax(root: data, data: data)
  }

  public static func makeBlankGenericRequirementList() -> GenericRequirementListSyntax {
    let data = SyntaxData(raw: .node(.genericRequirementList, [
    ], .present))
    return GenericRequirementListSyntax(root: data, data: data)
  }
  public static func makeSameTypeRequirement(leftTypeIdentifier: TypeSyntax, equalityToken: TokenSyntax, rightTypeIdentifier: TypeSyntax, trailingComma: TokenSyntax?) -> SameTypeRequirementSyntax {
    let data = SyntaxData(raw: .node(.sameTypeRequirement, [
      leftTypeIdentifier.data.raw,
      equalityToken.data.raw,
      rightTypeIdentifier.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return SameTypeRequirementSyntax(root: data, data: data)
  }

  public static func makeBlankSameTypeRequirement() -> SameTypeRequirementSyntax {
    let data = SyntaxData(raw: .node(.sameTypeRequirement, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.spacedBinaryOperator("")),
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.comma),
    ], .present))
    return SameTypeRequirementSyntax(root: data, data: data)
  }
  public static func makeGenericParameterList(
    _ elements: [GenericParameterSyntax]) -> GenericParameterListSyntax {
    let data = SyntaxData(raw: .node(.genericParameterList,
                                     elements.map { $0.data.raw }, .present))
    return GenericParameterListSyntax(root: data, data: data)
  }

  public static func makeBlankGenericParameterList() -> GenericParameterListSyntax {
    let data = SyntaxData(raw: .node(.genericParameterList, [
    ], .present))
    return GenericParameterListSyntax(root: data, data: data)
  }
  public static func makeGenericParameter(attributes: AttributeListSyntax?, name: TokenSyntax, colon: TokenSyntax?, inheritedType: TypeSyntax?, trailingComma: TokenSyntax?) -> GenericParameterSyntax {
    let data = SyntaxData(raw: .node(.genericParameter, [
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      name.data.raw,
      colon?.data.raw ?? RawSyntax.missingToken(.colon),
      inheritedType?.data.raw ?? RawSyntax.missing(.type),
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return GenericParameterSyntax(root: data, data: data)
  }

  public static func makeBlankGenericParameter() -> GenericParameterSyntax {
    let data = SyntaxData(raw: .node(.genericParameter, [
      RawSyntax.missing(.attributeList),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.comma),
    ], .present))
    return GenericParameterSyntax(root: data, data: data)
  }
  public static func makeGenericParameterClause(leftAngleBracket: TokenSyntax, genericParameterList: GenericParameterListSyntax, rightAngleBracket: TokenSyntax) -> GenericParameterClauseSyntax {
    let data = SyntaxData(raw: .node(.genericParameterClause, [
      leftAngleBracket.data.raw,
      genericParameterList.data.raw,
      rightAngleBracket.data.raw,
    ], .present))
    return GenericParameterClauseSyntax(root: data, data: data)
  }

  public static func makeBlankGenericParameterClause() -> GenericParameterClauseSyntax {
    let data = SyntaxData(raw: .node(.genericParameterClause, [
      RawSyntax.missingToken(.leftAngle),
      RawSyntax.missing(.genericParameterList),
      RawSyntax.missingToken(.rightAngle),
    ], .present))
    return GenericParameterClauseSyntax(root: data, data: data)
  }
  public static func makeConformanceRequirement(leftTypeIdentifier: TypeSyntax, colon: TokenSyntax, rightTypeIdentifier: TypeSyntax, trailingComma: TokenSyntax?) -> ConformanceRequirementSyntax {
    let data = SyntaxData(raw: .node(.conformanceRequirement, [
      leftTypeIdentifier.data.raw,
      colon.data.raw,
      rightTypeIdentifier.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return ConformanceRequirementSyntax(root: data, data: data)
  }

  public static func makeBlankConformanceRequirement() -> ConformanceRequirementSyntax {
    let data = SyntaxData(raw: .node(.conformanceRequirement, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.comma),
    ], .present))
    return ConformanceRequirementSyntax(root: data, data: data)
  }
  public static func makeSimpleTypeIdentifier(name: TokenSyntax, genericArgumentClause: GenericArgumentClauseSyntax?) -> SimpleTypeIdentifierSyntax {
    let data = SyntaxData(raw: .node(.simpleTypeIdentifier, [
      name.data.raw,
      genericArgumentClause?.data.raw ?? RawSyntax.missing(.genericArgumentClause),
    ], .present))
    return SimpleTypeIdentifierSyntax(root: data, data: data)
  }

  public static func makeBlankSimpleTypeIdentifier() -> SimpleTypeIdentifierSyntax {
    let data = SyntaxData(raw: .node(.simpleTypeIdentifier, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.genericArgumentClause),
    ], .present))
    return SimpleTypeIdentifierSyntax(root: data, data: data)
  }
  public static func makeMemberTypeIdentifier(baseType: TypeSyntax, period: TokenSyntax, name: TokenSyntax, genericArgumentClause: GenericArgumentClauseSyntax?) -> MemberTypeIdentifierSyntax {
    let data = SyntaxData(raw: .node(.memberTypeIdentifier, [
      baseType.data.raw,
      period.data.raw,
      name.data.raw,
      genericArgumentClause?.data.raw ?? RawSyntax.missing(.genericArgumentClause),
    ], .present))
    return MemberTypeIdentifierSyntax(root: data, data: data)
  }

  public static func makeBlankMemberTypeIdentifier() -> MemberTypeIdentifierSyntax {
    let data = SyntaxData(raw: .node(.memberTypeIdentifier, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.period),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.genericArgumentClause),
    ], .present))
    return MemberTypeIdentifierSyntax(root: data, data: data)
  }
  public static func makeArrayType(leftSquareBracket: TokenSyntax, elementType: TypeSyntax, rightSquareBracket: TokenSyntax) -> ArrayTypeSyntax {
    let data = SyntaxData(raw: .node(.arrayType, [
      leftSquareBracket.data.raw,
      elementType.data.raw,
      rightSquareBracket.data.raw,
    ], .present))
    return ArrayTypeSyntax(root: data, data: data)
  }

  public static func makeBlankArrayType() -> ArrayTypeSyntax {
    let data = SyntaxData(raw: .node(.arrayType, [
      RawSyntax.missingToken(.leftSquareBracket),
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.rightSquareBracket),
    ], .present))
    return ArrayTypeSyntax(root: data, data: data)
  }
  public static func makeDictionaryType(leftSquareBracket: TokenSyntax, keyType: TypeSyntax, colon: TokenSyntax, valueType: TypeSyntax, rightSquareBracket: TokenSyntax) -> DictionaryTypeSyntax {
    let data = SyntaxData(raw: .node(.dictionaryType, [
      leftSquareBracket.data.raw,
      keyType.data.raw,
      colon.data.raw,
      valueType.data.raw,
      rightSquareBracket.data.raw,
    ], .present))
    return DictionaryTypeSyntax(root: data, data: data)
  }

  public static func makeBlankDictionaryType() -> DictionaryTypeSyntax {
    let data = SyntaxData(raw: .node(.dictionaryType, [
      RawSyntax.missingToken(.leftSquareBracket),
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.rightSquareBracket),
    ], .present))
    return DictionaryTypeSyntax(root: data, data: data)
  }
  public static func makeMetatypeType(baseType: TypeSyntax, period: TokenSyntax, typeOrProtocol: TokenSyntax) -> MetatypeTypeSyntax {
    let data = SyntaxData(raw: .node(.metatypeType, [
      baseType.data.raw,
      period.data.raw,
      typeOrProtocol.data.raw,
    ], .present))
    return MetatypeTypeSyntax(root: data, data: data)
  }

  public static func makeBlankMetatypeType() -> MetatypeTypeSyntax {
    let data = SyntaxData(raw: .node(.metatypeType, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.period),
      RawSyntax.missingToken(.identifier("")),
    ], .present))
    return MetatypeTypeSyntax(root: data, data: data)
  }
  public static func makeOptionalType(wrappedType: TypeSyntax, questionMark: TokenSyntax) -> OptionalTypeSyntax {
    let data = SyntaxData(raw: .node(.optionalType, [
      wrappedType.data.raw,
      questionMark.data.raw,
    ], .present))
    return OptionalTypeSyntax(root: data, data: data)
  }

  public static func makeBlankOptionalType() -> OptionalTypeSyntax {
    let data = SyntaxData(raw: .node(.optionalType, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.postfixQuestionMark),
    ], .present))
    return OptionalTypeSyntax(root: data, data: data)
  }
  public static func makeImplicitlyUnwrappedOptionalType(wrappedType: TypeSyntax, exclamationMark: TokenSyntax) -> ImplicitlyUnwrappedOptionalTypeSyntax {
    let data = SyntaxData(raw: .node(.implicitlyUnwrappedOptionalType, [
      wrappedType.data.raw,
      exclamationMark.data.raw,
    ], .present))
    return ImplicitlyUnwrappedOptionalTypeSyntax(root: data, data: data)
  }

  public static func makeBlankImplicitlyUnwrappedOptionalType() -> ImplicitlyUnwrappedOptionalTypeSyntax {
    let data = SyntaxData(raw: .node(.implicitlyUnwrappedOptionalType, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.exclamationMark),
    ], .present))
    return ImplicitlyUnwrappedOptionalTypeSyntax(root: data, data: data)
  }
  public static func makeCompositionTypeElement(type: TypeSyntax, ampersand: TokenSyntax?) -> CompositionTypeElementSyntax {
    let data = SyntaxData(raw: .node(.compositionTypeElement, [
      type.data.raw,
      ampersand?.data.raw ?? RawSyntax.missingToken(.unknown),
    ], .present))
    return CompositionTypeElementSyntax(root: data, data: data)
  }

  public static func makeBlankCompositionTypeElement() -> CompositionTypeElementSyntax {
    let data = SyntaxData(raw: .node(.compositionTypeElement, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.unknown),
    ], .present))
    return CompositionTypeElementSyntax(root: data, data: data)
  }
  public static func makeCompositionTypeElementList(
    _ elements: [CompositionTypeElementSyntax]) -> CompositionTypeElementListSyntax {
    let data = SyntaxData(raw: .node(.compositionTypeElementList,
                                     elements.map { $0.data.raw }, .present))
    return CompositionTypeElementListSyntax(root: data, data: data)
  }

  public static func makeBlankCompositionTypeElementList() -> CompositionTypeElementListSyntax {
    let data = SyntaxData(raw: .node(.compositionTypeElementList, [
    ], .present))
    return CompositionTypeElementListSyntax(root: data, data: data)
  }
  public static func makeCompositionType(elements: CompositionTypeElementListSyntax) -> CompositionTypeSyntax {
    let data = SyntaxData(raw: .node(.compositionType, [
      elements.data.raw,
    ], .present))
    return CompositionTypeSyntax(root: data, data: data)
  }

  public static func makeBlankCompositionType() -> CompositionTypeSyntax {
    let data = SyntaxData(raw: .node(.compositionType, [
      RawSyntax.missing(.compositionTypeElementList),
    ], .present))
    return CompositionTypeSyntax(root: data, data: data)
  }
  public static func makeTupleTypeElement(inOut: TokenSyntax?, name: TokenSyntax?, secondName: TokenSyntax?, colon: TokenSyntax?, type: TypeSyntax, ellipsis: TokenSyntax?, initializer: InitializerClauseSyntax?, trailingComma: TokenSyntax?) -> TupleTypeElementSyntax {
    let data = SyntaxData(raw: .node(.tupleTypeElement, [
      inOut?.data.raw ?? RawSyntax.missingToken(.unknown),
      name?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      secondName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      colon?.data.raw ?? RawSyntax.missingToken(.colon),
      type.data.raw,
      ellipsis?.data.raw ?? RawSyntax.missingToken(.unknown),
      initializer?.data.raw ?? RawSyntax.missing(.initializerClause),
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return TupleTypeElementSyntax(root: data, data: data)
  }

  public static func makeBlankTupleTypeElement() -> TupleTypeElementSyntax {
    let data = SyntaxData(raw: .node(.tupleTypeElement, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.initializerClause),
      RawSyntax.missingToken(.comma),
    ], .present))
    return TupleTypeElementSyntax(root: data, data: data)
  }
  public static func makeTupleTypeElementList(
    _ elements: [TupleTypeElementSyntax]) -> TupleTypeElementListSyntax {
    let data = SyntaxData(raw: .node(.tupleTypeElementList,
                                     elements.map { $0.data.raw }, .present))
    return TupleTypeElementListSyntax(root: data, data: data)
  }

  public static func makeBlankTupleTypeElementList() -> TupleTypeElementListSyntax {
    let data = SyntaxData(raw: .node(.tupleTypeElementList, [
    ], .present))
    return TupleTypeElementListSyntax(root: data, data: data)
  }
  public static func makeTupleType(leftParen: TokenSyntax, elements: TupleTypeElementListSyntax, rightParen: TokenSyntax) -> TupleTypeSyntax {
    let data = SyntaxData(raw: .node(.tupleType, [
      leftParen.data.raw,
      elements.data.raw,
      rightParen.data.raw,
    ], .present))
    return TupleTypeSyntax(root: data, data: data)
  }

  public static func makeBlankTupleType() -> TupleTypeSyntax {
    let data = SyntaxData(raw: .node(.tupleType, [
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.tupleTypeElementList),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return TupleTypeSyntax(root: data, data: data)
  }
  public static func makeFunctionType(leftParen: TokenSyntax, arguments: TupleTypeElementListSyntax, rightParen: TokenSyntax, throwsOrRethrowsKeyword: TokenSyntax?, arrow: TokenSyntax, returnType: TypeSyntax) -> FunctionTypeSyntax {
    let data = SyntaxData(raw: .node(.functionType, [
      leftParen.data.raw,
      arguments.data.raw,
      rightParen.data.raw,
      throwsOrRethrowsKeyword?.data.raw ?? RawSyntax.missingToken(.throwsKeyword),
      arrow.data.raw,
      returnType.data.raw,
    ], .present))
    return FunctionTypeSyntax(root: data, data: data)
  }

  public static func makeBlankFunctionType() -> FunctionTypeSyntax {
    let data = SyntaxData(raw: .node(.functionType, [
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.tupleTypeElementList),
      RawSyntax.missingToken(.rightParen),
      RawSyntax.missingToken(.throwsKeyword),
      RawSyntax.missingToken(.arrow),
      RawSyntax.missing(.type),
    ], .present))
    return FunctionTypeSyntax(root: data, data: data)
  }
  public static func makeAttributedType(specifier: TokenSyntax?, attributes: AttributeListSyntax?, baseType: TypeSyntax) -> AttributedTypeSyntax {
    let data = SyntaxData(raw: .node(.attributedType, [
      specifier?.data.raw ?? RawSyntax.missingToken(.unknown),
      attributes?.data.raw ?? RawSyntax.missing(.attributeList),
      baseType.data.raw,
    ], .present))
    return AttributedTypeSyntax(root: data, data: data)
  }

  public static func makeBlankAttributedType() -> AttributedTypeSyntax {
    let data = SyntaxData(raw: .node(.attributedType, [
      RawSyntax.missingToken(.unknown),
      RawSyntax.missing(.attributeList),
      RawSyntax.missing(.type),
    ], .present))
    return AttributedTypeSyntax(root: data, data: data)
  }
  public static func makeGenericArgumentList(
    _ elements: [GenericArgumentSyntax]) -> GenericArgumentListSyntax {
    let data = SyntaxData(raw: .node(.genericArgumentList,
                                     elements.map { $0.data.raw }, .present))
    return GenericArgumentListSyntax(root: data, data: data)
  }

  public static func makeBlankGenericArgumentList() -> GenericArgumentListSyntax {
    let data = SyntaxData(raw: .node(.genericArgumentList, [
    ], .present))
    return GenericArgumentListSyntax(root: data, data: data)
  }
  public static func makeGenericArgument(argumentType: TypeSyntax, trailingComma: TokenSyntax?) -> GenericArgumentSyntax {
    let data = SyntaxData(raw: .node(.genericArgument, [
      argumentType.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return GenericArgumentSyntax(root: data, data: data)
  }

  public static func makeBlankGenericArgument() -> GenericArgumentSyntax {
    let data = SyntaxData(raw: .node(.genericArgument, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.comma),
    ], .present))
    return GenericArgumentSyntax(root: data, data: data)
  }
  public static func makeGenericArgumentClause(leftAngleBracket: TokenSyntax, arguments: GenericArgumentListSyntax, rightAngleBracket: TokenSyntax) -> GenericArgumentClauseSyntax {
    let data = SyntaxData(raw: .node(.genericArgumentClause, [
      leftAngleBracket.data.raw,
      arguments.data.raw,
      rightAngleBracket.data.raw,
    ], .present))
    return GenericArgumentClauseSyntax(root: data, data: data)
  }

  public static func makeBlankGenericArgumentClause() -> GenericArgumentClauseSyntax {
    let data = SyntaxData(raw: .node(.genericArgumentClause, [
      RawSyntax.missingToken(.leftAngle),
      RawSyntax.missing(.genericArgumentList),
      RawSyntax.missingToken(.rightAngle),
    ], .present))
    return GenericArgumentClauseSyntax(root: data, data: data)
  }
  public static func makeTypeAnnotation(colon: TokenSyntax, type: TypeSyntax) -> TypeAnnotationSyntax {
    let data = SyntaxData(raw: .node(.typeAnnotation, [
      colon.data.raw,
      type.data.raw,
    ], .present))
    return TypeAnnotationSyntax(root: data, data: data)
  }

  public static func makeBlankTypeAnnotation() -> TypeAnnotationSyntax {
    let data = SyntaxData(raw: .node(.typeAnnotation, [
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.type),
    ], .present))
    return TypeAnnotationSyntax(root: data, data: data)
  }
  public static func makeEnumCasePattern(type: TypeSyntax?, period: TokenSyntax, caseName: TokenSyntax, associatedTuple: TuplePatternSyntax?) -> EnumCasePatternSyntax {
    let data = SyntaxData(raw: .node(.enumCasePattern, [
      type?.data.raw ?? RawSyntax.missing(.type),
      period.data.raw,
      caseName.data.raw,
      associatedTuple?.data.raw ?? RawSyntax.missing(.tuplePattern),
    ], .present))
    return EnumCasePatternSyntax(root: data, data: data)
  }

  public static func makeBlankEnumCasePattern() -> EnumCasePatternSyntax {
    let data = SyntaxData(raw: .node(.enumCasePattern, [
      RawSyntax.missing(.type),
      RawSyntax.missingToken(.period),
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missing(.tuplePattern),
    ], .present))
    return EnumCasePatternSyntax(root: data, data: data)
  }
  public static func makeIsTypePattern(isKeyword: TokenSyntax, type: TypeSyntax) -> IsTypePatternSyntax {
    let data = SyntaxData(raw: .node(.isTypePattern, [
      isKeyword.data.raw,
      type.data.raw,
    ], .present))
    return IsTypePatternSyntax(root: data, data: data)
  }

  public static func makeBlankIsTypePattern() -> IsTypePatternSyntax {
    let data = SyntaxData(raw: .node(.isTypePattern, [
      RawSyntax.missingToken(.isKeyword),
      RawSyntax.missing(.type),
    ], .present))
    return IsTypePatternSyntax(root: data, data: data)
  }
  public static func makeOptionalPattern(subPattern: PatternSyntax, questionMark: TokenSyntax) -> OptionalPatternSyntax {
    let data = SyntaxData(raw: .node(.optionalPattern, [
      subPattern.data.raw,
      questionMark.data.raw,
    ], .present))
    return OptionalPatternSyntax(root: data, data: data)
  }

  public static func makeBlankOptionalPattern() -> OptionalPatternSyntax {
    let data = SyntaxData(raw: .node(.optionalPattern, [
      RawSyntax.missing(.pattern),
      RawSyntax.missingToken(.postfixQuestionMark),
    ], .present))
    return OptionalPatternSyntax(root: data, data: data)
  }
  public static func makeIdentifierPattern(identifier: TokenSyntax) -> IdentifierPatternSyntax {
    let data = SyntaxData(raw: .node(.identifierPattern, [
      identifier.data.raw,
    ], .present))
    return IdentifierPatternSyntax(root: data, data: data)
  }

  public static func makeBlankIdentifierPattern() -> IdentifierPatternSyntax {
    let data = SyntaxData(raw: .node(.identifierPattern, [
      RawSyntax.missingToken(.identifier("")),
    ], .present))
    return IdentifierPatternSyntax(root: data, data: data)
  }
  public static func makeAsTypePattern(pattern: PatternSyntax, asKeyword: TokenSyntax, type: TypeSyntax) -> AsTypePatternSyntax {
    let data = SyntaxData(raw: .node(.asTypePattern, [
      pattern.data.raw,
      asKeyword.data.raw,
      type.data.raw,
    ], .present))
    return AsTypePatternSyntax(root: data, data: data)
  }

  public static func makeBlankAsTypePattern() -> AsTypePatternSyntax {
    let data = SyntaxData(raw: .node(.asTypePattern, [
      RawSyntax.missing(.pattern),
      RawSyntax.missingToken(.asKeyword),
      RawSyntax.missing(.type),
    ], .present))
    return AsTypePatternSyntax(root: data, data: data)
  }
  public static func makeTuplePattern(leftParen: TokenSyntax, elements: TuplePatternElementListSyntax, rightParen: TokenSyntax) -> TuplePatternSyntax {
    let data = SyntaxData(raw: .node(.tuplePattern, [
      leftParen.data.raw,
      elements.data.raw,
      rightParen.data.raw,
    ], .present))
    return TuplePatternSyntax(root: data, data: data)
  }

  public static func makeBlankTuplePattern() -> TuplePatternSyntax {
    let data = SyntaxData(raw: .node(.tuplePattern, [
      RawSyntax.missingToken(.leftParen),
      RawSyntax.missing(.tuplePatternElementList),
      RawSyntax.missingToken(.rightParen),
    ], .present))
    return TuplePatternSyntax(root: data, data: data)
  }
  public static func makeWildcardPattern(wildcard: TokenSyntax, typeAnnotation: TypeAnnotationSyntax?) -> WildcardPatternSyntax {
    let data = SyntaxData(raw: .node(.wildcardPattern, [
      wildcard.data.raw,
      typeAnnotation?.data.raw ?? RawSyntax.missing(.typeAnnotation),
    ], .present))
    return WildcardPatternSyntax(root: data, data: data)
  }

  public static func makeBlankWildcardPattern() -> WildcardPatternSyntax {
    let data = SyntaxData(raw: .node(.wildcardPattern, [
      RawSyntax.missingToken(.wildcardKeyword),
      RawSyntax.missing(.typeAnnotation),
    ], .present))
    return WildcardPatternSyntax(root: data, data: data)
  }
  public static func makeTuplePatternElement(labelName: TokenSyntax?, labelColon: TokenSyntax?, pattern: PatternSyntax, trailingComma: TokenSyntax?) -> TuplePatternElementSyntax {
    let data = SyntaxData(raw: .node(.tuplePatternElement, [
      labelName?.data.raw ?? RawSyntax.missingToken(.identifier("")),
      labelColon?.data.raw ?? RawSyntax.missingToken(.colon),
      pattern.data.raw,
      trailingComma?.data.raw ?? RawSyntax.missingToken(.comma),
    ], .present))
    return TuplePatternElementSyntax(root: data, data: data)
  }

  public static func makeBlankTuplePatternElement() -> TuplePatternElementSyntax {
    let data = SyntaxData(raw: .node(.tuplePatternElement, [
      RawSyntax.missingToken(.identifier("")),
      RawSyntax.missingToken(.colon),
      RawSyntax.missing(.pattern),
      RawSyntax.missingToken(.comma),
    ], .present))
    return TuplePatternElementSyntax(root: data, data: data)
  }
  public static func makeExpressionPattern(expression: ExprSyntax) -> ExpressionPatternSyntax {
    let data = SyntaxData(raw: .node(.expressionPattern, [
      expression.data.raw,
    ], .present))
    return ExpressionPatternSyntax(root: data, data: data)
  }

  public static func makeBlankExpressionPattern() -> ExpressionPatternSyntax {
    let data = SyntaxData(raw: .node(.expressionPattern, [
      RawSyntax.missing(.expr),
    ], .present))
    return ExpressionPatternSyntax(root: data, data: data)
  }
  public static func makeTuplePatternElementList(
    _ elements: [TuplePatternElementSyntax]) -> TuplePatternElementListSyntax {
    let data = SyntaxData(raw: .node(.tuplePatternElementList,
                                     elements.map { $0.data.raw }, .present))
    return TuplePatternElementListSyntax(root: data, data: data)
  }

  public static func makeBlankTuplePatternElementList() -> TuplePatternElementListSyntax {
    let data = SyntaxData(raw: .node(.tuplePatternElementList, [
    ], .present))
    return TuplePatternElementListSyntax(root: data, data: data)
  }
  public static func makeValueBindingPattern(letOrVarKeyword: TokenSyntax, valuePattern: PatternSyntax) -> ValueBindingPatternSyntax {
    let data = SyntaxData(raw: .node(.valueBindingPattern, [
      letOrVarKeyword.data.raw,
      valuePattern.data.raw,
    ], .present))
    return ValueBindingPatternSyntax(root: data, data: data)
  }

  public static func makeBlankValueBindingPattern() -> ValueBindingPatternSyntax {
    let data = SyntaxData(raw: .node(.valueBindingPattern, [
      RawSyntax.missingToken(.letKeyword),
      RawSyntax.missing(.pattern),
    ], .present))
    return ValueBindingPatternSyntax(root: data, data: data)
  }

/// MARK: Token Creation APIs

  public static func makeAssociatedtypeKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.associatedtypeKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeClassKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.classKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDeinitKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.deinitKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeEnumKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.enumKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeExtensionKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.extensionKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFuncKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.funcKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeImportKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.importKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInitKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.initKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInoutKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.inoutKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLetKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.letKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeOperatorKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.operatorKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrecedencegroupKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.precedencegroupKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeProtocolKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.protocolKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStructKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.structKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSubscriptKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.subscriptKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeTypealiasKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.typealiasKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeVarKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.varKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFileprivateKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.fileprivateKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInternalKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.internalKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrivateKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.privateKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePublicKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.publicKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStaticKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.staticKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDeferKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.deferKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeIfKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.ifKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeGuardKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.guardKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDoKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.doKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRepeatKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.repeatKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeElseKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.elseKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeForKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.forKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.inKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeWhileKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.whileKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeReturnKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.returnKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeBreakKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.breakKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeContinueKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.continueKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFallthroughKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.fallthroughKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSwitchKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.switchKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeCaseKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.caseKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDefaultKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.defaultKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeWhereKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.whereKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeCatchKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.catchKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeAsKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.asKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeAnyKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.anyKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFalseKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.falseKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeIsKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.isKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeNilKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.nilKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRethrowsKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.rethrowsKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSuperKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.superKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSelfKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.selfKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeCapitalSelfKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.capitalSelfKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeThrowKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.throwKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeTrueKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.trueKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeTryKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.tryKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeThrowsKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.throwsKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__FILE__Keyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.__file__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__LINE__Keyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.__line__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__COLUMN__Keyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.__column__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__FUNCTION__Keyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.__function__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func make__DSO_HANDLE__Keyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.__dso_handle__Keyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeWildcardKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.wildcardKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundAvailableKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundAvailableKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundEndifKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundEndifKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundElseKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundElseKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundElseifKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundElseifKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundIfKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundIfKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundSourceLocationKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundSourceLocationKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundFileKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundFileKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundLineKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundLineKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundColumnKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundColumnKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundDsohandleKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundDsohandleKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundFunctionKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundFunctionKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundSelectorKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundSelectorKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundKeyPathKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundKeyPathKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundColorLiteralKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundColorLiteralKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundFileLiteralKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundFileLiteralKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePoundImageLiteralKeyword(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.poundImageLiteralKeyword, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeArrowToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.arrow, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeAtSignToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.atSign, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeColonToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.colon, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSemicolonToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.semicolon, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeCommaToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.comma, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePeriodToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.period, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeEqualToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.equal, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrefixPeriodToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.prefixPeriod, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLeftParenToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.leftParen, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRightParenToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.rightParen, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLeftBraceToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.leftBrace, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRightBraceToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.rightBrace, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLeftSquareBracketToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.leftSquareBracket, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRightSquareBracketToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.rightSquareBracket, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeLeftAngleToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.leftAngle, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeRightAngleToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.rightAngle, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrefixAmpersandToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.prefixAmpersand, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePostfixQuestionMarkToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.postfixQuestionMark, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeInfixQuestionMarkToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.infixQuestionMark, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeExclamationMarkToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.exclamationMark, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeBackslashToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.backslash, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStringInterpolationAnchorToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.stringInterpolationAnchor, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStringQuoteToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.stringQuote, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeMultilineStringQuoteToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.multilineStringQuote, presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStringSegment(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.stringSegment(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeIdentifier(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.identifier(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeDollarIdentifier(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.dollarIdentifier(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeUnspacedBinaryOperator(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.unspacedBinaryOperator(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeSpacedBinaryOperator(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.spacedBinaryOperator(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePrefixOperator(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.prefixOperator(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makePostfixOperator(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.postfixOperator(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeIntegerLiteral(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.integerLiteral(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeFloatingLiteral(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.floatingLiteral(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeStringLiteral(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.stringLiteral(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }
  public static func makeContextualKeyword(_ text: String,
    leadingTrivia: Trivia = [], trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.contextualKeyword(text), presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }

/// MARK: Convenience APIs

  public static func makeVoidTupleType() -> TupleTypeSyntax {
    return makeTupleType(leftParen: makeLeftParenToken(),
                         elements: makeBlankTupleTypeElementList(),
                         rightParen: makeRightParenToken())
  }

  public static func makeTupleTypeElement(name: TokenSyntax?,
    colon: TokenSyntax?, type: TypeSyntax,
    trailingComma: TokenSyntax?) -> TupleTypeElementSyntax {
    return makeTupleTypeElement(inOut: nil, name: name, secondName: nil,
                                colon: colon, type: type, ellipsis: nil,
                                initializer: nil, trailingComma: trailingComma)
  }

  public static func makeTupleTypeElement(type: TypeSyntax,
    trailingComma: TokenSyntax?) -> TupleTypeElementSyntax  {
    return makeTupleTypeElement(name: nil, colon: nil, 
                                type: type, trailingComma: trailingComma)
  }

  public static func makeGenericParameter(name: TokenSyntax,
      trailingComma: TokenSyntax) -> GenericParameterSyntax {
    return makeGenericParameter(attributes: nil, name: name, colon: nil,
                                inheritedType: nil,
                                trailingComma: trailingComma)
  }

  public static func makeTypeIdentifier(_ name: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TypeSyntax {
    let identifier = makeIdentifier(name, leadingTrivia: leadingTrivia, 
                                    trailingTrivia: trailingTrivia)
    return makeSimpleTypeIdentifier(name: identifier,
                                    genericArgumentClause: nil)
  }

  public static func makeAnyTypeIdentifier(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TypeSyntax {
    return makeTypeIdentifier("Any", leadingTrivia: leadingTrivia, 
                              trailingTrivia: trailingTrivia)
  }

  public static func makeSelfTypeIdentifier(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TypeSyntax {
    return makeTypeIdentifier("Self", leadingTrivia: leadingTrivia, 
                              trailingTrivia: trailingTrivia)
  }

  public static func makeTypeToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeIdentifier("Type", leadingTrivia: leadingTrivia, 
                          trailingTrivia: trailingTrivia)
  }

  public static func makeProtocolToken(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeIdentifier("Protocol", leadingTrivia: leadingTrivia,
                          trailingTrivia: trailingTrivia)
  }

  public static func makeEqualityOperator(leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> TokenSyntax {
    return makeToken(.spacedBinaryOperator("=="),
                     presence: .present,
                     leadingTrivia: leadingTrivia,
                     trailingTrivia: trailingTrivia)
  }

  public static func makeStringLiteralExpr(_ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> StringLiteralExprSyntax {
    let literal = makeStringLiteral("\"\(text)\"", 
                                    leadingTrivia: leadingTrivia,
                                    trailingTrivia: trailingTrivia)
    return makeStringLiteralExpr(stringLiteral: literal)
  }

  public static func makeVariableExpr(_ text: String,
    leadingTrivia: Trivia = [],
    trailingTrivia: Trivia = []) -> IdentifierExprSyntax {
    let string = makeIdentifier(text,
      leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
    return makeIdentifierExpr(identifier: string,
                              declNameArguments: nil)
  }
}
