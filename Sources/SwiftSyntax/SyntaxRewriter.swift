//// Automatically Generated From SyntaxFactory.swift.gyb.
//// Do Not Edit Directly!
//===------------ SyntaxRewriter.swift - Syntax Rewriter class ------------===//
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
// This file defines the SyntaxRewriter, a class that performs a standard walk
// and tree-rebuilding pattern.
//
// Subclassers of this class can override the walking behavior for any syntax
// node and transform nodes however they like.
//
//===----------------------------------------------------------------------===//

open class SyntaxRewriter {
  public init() {}
  open func visit(_ node: UnknownDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: UnknownExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: UnknownStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: UnknownTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: UnknownPatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: CodeBlockItemSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: CodeBlockSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: InOutExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: PoundColumnExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: TryExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: DeclNameArgumentSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: DeclNameArgumentsSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: IdentifierExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: SuperRefExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: NilLiteralExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: DiscardAssignmentExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: AssignmentExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: SequenceExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: PoundLineExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: PoundFileExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: PoundFunctionExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: PoundDsohandleExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: SymbolicReferenceExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: PrefixOperatorExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: BinaryOperatorExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: ArrowExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: FloatLiteralExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: TupleExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: ArrayExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: DictionaryExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: ImplicitMemberExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: FunctionCallArgumentSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: TupleElementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ArrayElementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: DictionaryElementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: IntegerLiteralExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: StringLiteralExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: BooleanLiteralExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: TernaryExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: MemberAccessExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: DotSelfExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: IsExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: AsExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: TypeExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: ClosureCaptureItemSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ClosureCaptureSignatureSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ClosureParamSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ClosureSignatureSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ClosureExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: UnresolvedPatternExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: FunctionCallExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: SubscriptExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: OptionalChainingExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: ForcedValueExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: PostfixUnaryExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: SpecializeExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: StringSegmentSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ExpressionSegmentSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: StringInterpolationExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: KeyPathExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: ObjcNamePieceSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ObjcKeyPathExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: EditorPlaceholderExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: ObjectLiteralExprSyntax) -> ExprSyntax {
    return visitChildren(node) as! ExprSyntax
  }

  open func visit(_ node: TypeInitializerClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: TypealiasDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: AssociatedtypeDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: ParameterClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ReturnClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: FunctionSignatureSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ElseifDirectiveClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: IfConfigDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: PoundErrorDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: PoundWarningDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: DeclModifierSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: InheritedTypeSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: TypeInheritanceClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ClassDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: StructDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: ProtocolDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: ExtensionDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: MemberDeclBlockSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: SourceFileSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: InitializerClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: FunctionParameterSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: FunctionDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: InitializerDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: DeinitializerDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: SubscriptDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: ElseDirectiveClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: AccessLevelModifierSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: AccessPathComponentSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ImportDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: AccessorParameterSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: AccessorDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: AccessorBlockSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: PatternBindingSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: VariableDeclSyntax) -> DeclSyntax {
    return visitChildren(node) as! DeclSyntax
  }

  open func visit(_ node: AttributeSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ContinueStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: WhileStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: DeferStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: ExpressionStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: RepeatWhileStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: GuardStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: WhereClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ForInStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: SwitchStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: DoStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: ReturnStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: FallthroughStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: BreakStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: ConditionElementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: AvailabilityConditionSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: MatchingPatternConditionSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: OptionalBindingConditionSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: DeclarationStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: ThrowStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: IfStmtSyntax) -> StmtSyntax {
    return visitChildren(node) as! StmtSyntax
  }

  open func visit(_ node: ElseIfContinuationSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ElseBlockSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: SwitchCaseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: SwitchDefaultLabelSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: CaseItemSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: SwitchCaseLabelSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: CatchClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: GenericWhereClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: SameTypeRequirementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: GenericParameterSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: GenericParameterClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ConformanceRequirementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: SimpleTypeIdentifierSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: MemberTypeIdentifierSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: ArrayTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: DictionaryTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: MetatypeTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: OptionalTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: ImplicitlyUnwrappedOptionalTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: CompositionTypeElementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: CompositionTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: TupleTypeElementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: TupleTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: FunctionTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: AttributedTypeSyntax) -> TypeSyntax {
    return visitChildren(node) as! TypeSyntax
  }

  open func visit(_ node: GenericArgumentSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: GenericArgumentClauseSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: TypeAnnotationSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: EnumCasePatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: IsTypePatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: OptionalPatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: IdentifierPatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: AsTypePatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: TuplePatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: WildcardPatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: TuplePatternElementSyntax) -> Syntax {
    return visitChildren(node) 
  }

  open func visit(_ node: ExpressionPatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }

  open func visit(_ node: ValueBindingPatternSyntax) -> PatternSyntax {
    return visitChildren(node) as! PatternSyntax
  }


  open func visit(_ token: TokenSyntax) -> Syntax {
    return token
  }

  /// The function called before visiting the node and its descendents.
  ///   - node: the node we are about to visit.
  open func visitPre(_ node: Syntax) {}

  /// The function called after visting the node and its descendents.
  ///   - node: the node we just finished visiting.
  open func visitPost(_ node: Syntax) {}

  public func visit(_ node: Syntax) -> Syntax {
    visitPre(node)
    defer { visitPost(node) }
    switch node.raw.kind {
    case .token: return visit(node as! TokenSyntax)
    case .unknownDecl: return visit(node as! UnknownDeclSyntax)
    case .unknownExpr: return visit(node as! UnknownExprSyntax)
    case .unknownStmt: return visit(node as! UnknownStmtSyntax)
    case .unknownType: return visit(node as! UnknownTypeSyntax)
    case .unknownPattern: return visit(node as! UnknownPatternSyntax)
    case .codeBlockItem: return visit(node as! CodeBlockItemSyntax)
    case .codeBlock: return visit(node as! CodeBlockSyntax)
    case .inOutExpr: return visit(node as! InOutExprSyntax)
    case .poundColumnExpr: return visit(node as! PoundColumnExprSyntax)
    case .tryExpr: return visit(node as! TryExprSyntax)
    case .declNameArgument: return visit(node as! DeclNameArgumentSyntax)
    case .declNameArguments: return visit(node as! DeclNameArgumentsSyntax)
    case .identifierExpr: return visit(node as! IdentifierExprSyntax)
    case .superRefExpr: return visit(node as! SuperRefExprSyntax)
    case .nilLiteralExpr: return visit(node as! NilLiteralExprSyntax)
    case .discardAssignmentExpr: return visit(node as! DiscardAssignmentExprSyntax)
    case .assignmentExpr: return visit(node as! AssignmentExprSyntax)
    case .sequenceExpr: return visit(node as! SequenceExprSyntax)
    case .poundLineExpr: return visit(node as! PoundLineExprSyntax)
    case .poundFileExpr: return visit(node as! PoundFileExprSyntax)
    case .poundFunctionExpr: return visit(node as! PoundFunctionExprSyntax)
    case .poundDsohandleExpr: return visit(node as! PoundDsohandleExprSyntax)
    case .symbolicReferenceExpr: return visit(node as! SymbolicReferenceExprSyntax)
    case .prefixOperatorExpr: return visit(node as! PrefixOperatorExprSyntax)
    case .binaryOperatorExpr: return visit(node as! BinaryOperatorExprSyntax)
    case .arrowExpr: return visit(node as! ArrowExprSyntax)
    case .floatLiteralExpr: return visit(node as! FloatLiteralExprSyntax)
    case .tupleExpr: return visit(node as! TupleExprSyntax)
    case .arrayExpr: return visit(node as! ArrayExprSyntax)
    case .dictionaryExpr: return visit(node as! DictionaryExprSyntax)
    case .implicitMemberExpr: return visit(node as! ImplicitMemberExprSyntax)
    case .functionCallArgument: return visit(node as! FunctionCallArgumentSyntax)
    case .tupleElement: return visit(node as! TupleElementSyntax)
    case .arrayElement: return visit(node as! ArrayElementSyntax)
    case .dictionaryElement: return visit(node as! DictionaryElementSyntax)
    case .integerLiteralExpr: return visit(node as! IntegerLiteralExprSyntax)
    case .stringLiteralExpr: return visit(node as! StringLiteralExprSyntax)
    case .booleanLiteralExpr: return visit(node as! BooleanLiteralExprSyntax)
    case .ternaryExpr: return visit(node as! TernaryExprSyntax)
    case .memberAccessExpr: return visit(node as! MemberAccessExprSyntax)
    case .dotSelfExpr: return visit(node as! DotSelfExprSyntax)
    case .isExpr: return visit(node as! IsExprSyntax)
    case .asExpr: return visit(node as! AsExprSyntax)
    case .typeExpr: return visit(node as! TypeExprSyntax)
    case .closureCaptureItem: return visit(node as! ClosureCaptureItemSyntax)
    case .closureCaptureSignature: return visit(node as! ClosureCaptureSignatureSyntax)
    case .closureParam: return visit(node as! ClosureParamSyntax)
    case .closureSignature: return visit(node as! ClosureSignatureSyntax)
    case .closureExpr: return visit(node as! ClosureExprSyntax)
    case .unresolvedPatternExpr: return visit(node as! UnresolvedPatternExprSyntax)
    case .functionCallExpr: return visit(node as! FunctionCallExprSyntax)
    case .subscriptExpr: return visit(node as! SubscriptExprSyntax)
    case .optionalChainingExpr: return visit(node as! OptionalChainingExprSyntax)
    case .forcedValueExpr: return visit(node as! ForcedValueExprSyntax)
    case .postfixUnaryExpr: return visit(node as! PostfixUnaryExprSyntax)
    case .specializeExpr: return visit(node as! SpecializeExprSyntax)
    case .stringSegment: return visit(node as! StringSegmentSyntax)
    case .expressionSegment: return visit(node as! ExpressionSegmentSyntax)
    case .stringInterpolationExpr: return visit(node as! StringInterpolationExprSyntax)
    case .keyPathExpr: return visit(node as! KeyPathExprSyntax)
    case .objcNamePiece: return visit(node as! ObjcNamePieceSyntax)
    case .objcKeyPathExpr: return visit(node as! ObjcKeyPathExprSyntax)
    case .editorPlaceholderExpr: return visit(node as! EditorPlaceholderExprSyntax)
    case .objectLiteralExpr: return visit(node as! ObjectLiteralExprSyntax)
    case .typeInitializerClause: return visit(node as! TypeInitializerClauseSyntax)
    case .typealiasDecl: return visit(node as! TypealiasDeclSyntax)
    case .associatedtypeDecl: return visit(node as! AssociatedtypeDeclSyntax)
    case .parameterClause: return visit(node as! ParameterClauseSyntax)
    case .returnClause: return visit(node as! ReturnClauseSyntax)
    case .functionSignature: return visit(node as! FunctionSignatureSyntax)
    case .elseifDirectiveClause: return visit(node as! ElseifDirectiveClauseSyntax)
    case .ifConfigDecl: return visit(node as! IfConfigDeclSyntax)
    case .poundErrorDecl: return visit(node as! PoundErrorDeclSyntax)
    case .poundWarningDecl: return visit(node as! PoundWarningDeclSyntax)
    case .declModifier: return visit(node as! DeclModifierSyntax)
    case .inheritedType: return visit(node as! InheritedTypeSyntax)
    case .typeInheritanceClause: return visit(node as! TypeInheritanceClauseSyntax)
    case .classDecl: return visit(node as! ClassDeclSyntax)
    case .structDecl: return visit(node as! StructDeclSyntax)
    case .protocolDecl: return visit(node as! ProtocolDeclSyntax)
    case .extensionDecl: return visit(node as! ExtensionDeclSyntax)
    case .memberDeclBlock: return visit(node as! MemberDeclBlockSyntax)
    case .sourceFile: return visit(node as! SourceFileSyntax)
    case .initializerClause: return visit(node as! InitializerClauseSyntax)
    case .functionParameter: return visit(node as! FunctionParameterSyntax)
    case .functionDecl: return visit(node as! FunctionDeclSyntax)
    case .initializerDecl: return visit(node as! InitializerDeclSyntax)
    case .deinitializerDecl: return visit(node as! DeinitializerDeclSyntax)
    case .subscriptDecl: return visit(node as! SubscriptDeclSyntax)
    case .elseDirectiveClause: return visit(node as! ElseDirectiveClauseSyntax)
    case .accessLevelModifier: return visit(node as! AccessLevelModifierSyntax)
    case .accessPathComponent: return visit(node as! AccessPathComponentSyntax)
    case .importDecl: return visit(node as! ImportDeclSyntax)
    case .accessorParameter: return visit(node as! AccessorParameterSyntax)
    case .accessorDecl: return visit(node as! AccessorDeclSyntax)
    case .accessorBlock: return visit(node as! AccessorBlockSyntax)
    case .patternBinding: return visit(node as! PatternBindingSyntax)
    case .variableDecl: return visit(node as! VariableDeclSyntax)
    case .attribute: return visit(node as! AttributeSyntax)
    case .continueStmt: return visit(node as! ContinueStmtSyntax)
    case .whileStmt: return visit(node as! WhileStmtSyntax)
    case .deferStmt: return visit(node as! DeferStmtSyntax)
    case .expressionStmt: return visit(node as! ExpressionStmtSyntax)
    case .repeatWhileStmt: return visit(node as! RepeatWhileStmtSyntax)
    case .guardStmt: return visit(node as! GuardStmtSyntax)
    case .whereClause: return visit(node as! WhereClauseSyntax)
    case .forInStmt: return visit(node as! ForInStmtSyntax)
    case .switchStmt: return visit(node as! SwitchStmtSyntax)
    case .doStmt: return visit(node as! DoStmtSyntax)
    case .returnStmt: return visit(node as! ReturnStmtSyntax)
    case .fallthroughStmt: return visit(node as! FallthroughStmtSyntax)
    case .breakStmt: return visit(node as! BreakStmtSyntax)
    case .conditionElement: return visit(node as! ConditionElementSyntax)
    case .availabilityCondition: return visit(node as! AvailabilityConditionSyntax)
    case .matchingPatternCondition: return visit(node as! MatchingPatternConditionSyntax)
    case .optionalBindingCondition: return visit(node as! OptionalBindingConditionSyntax)
    case .declarationStmt: return visit(node as! DeclarationStmtSyntax)
    case .throwStmt: return visit(node as! ThrowStmtSyntax)
    case .ifStmt: return visit(node as! IfStmtSyntax)
    case .elseIfContinuation: return visit(node as! ElseIfContinuationSyntax)
    case .elseBlock: return visit(node as! ElseBlockSyntax)
    case .switchCase: return visit(node as! SwitchCaseSyntax)
    case .switchDefaultLabel: return visit(node as! SwitchDefaultLabelSyntax)
    case .caseItem: return visit(node as! CaseItemSyntax)
    case .switchCaseLabel: return visit(node as! SwitchCaseLabelSyntax)
    case .catchClause: return visit(node as! CatchClauseSyntax)
    case .genericWhereClause: return visit(node as! GenericWhereClauseSyntax)
    case .sameTypeRequirement: return visit(node as! SameTypeRequirementSyntax)
    case .genericParameter: return visit(node as! GenericParameterSyntax)
    case .genericParameterClause: return visit(node as! GenericParameterClauseSyntax)
    case .conformanceRequirement: return visit(node as! ConformanceRequirementSyntax)
    case .simpleTypeIdentifier: return visit(node as! SimpleTypeIdentifierSyntax)
    case .memberTypeIdentifier: return visit(node as! MemberTypeIdentifierSyntax)
    case .arrayType: return visit(node as! ArrayTypeSyntax)
    case .dictionaryType: return visit(node as! DictionaryTypeSyntax)
    case .metatypeType: return visit(node as! MetatypeTypeSyntax)
    case .optionalType: return visit(node as! OptionalTypeSyntax)
    case .implicitlyUnwrappedOptionalType: return visit(node as! ImplicitlyUnwrappedOptionalTypeSyntax)
    case .compositionTypeElement: return visit(node as! CompositionTypeElementSyntax)
    case .compositionType: return visit(node as! CompositionTypeSyntax)
    case .tupleTypeElement: return visit(node as! TupleTypeElementSyntax)
    case .tupleType: return visit(node as! TupleTypeSyntax)
    case .functionType: return visit(node as! FunctionTypeSyntax)
    case .attributedType: return visit(node as! AttributedTypeSyntax)
    case .genericArgument: return visit(node as! GenericArgumentSyntax)
    case .genericArgumentClause: return visit(node as! GenericArgumentClauseSyntax)
    case .typeAnnotation: return visit(node as! TypeAnnotationSyntax)
    case .enumCasePattern: return visit(node as! EnumCasePatternSyntax)
    case .isTypePattern: return visit(node as! IsTypePatternSyntax)
    case .optionalPattern: return visit(node as! OptionalPatternSyntax)
    case .identifierPattern: return visit(node as! IdentifierPatternSyntax)
    case .asTypePattern: return visit(node as! AsTypePatternSyntax)
    case .tuplePattern: return visit(node as! TuplePatternSyntax)
    case .wildcardPattern: return visit(node as! WildcardPatternSyntax)
    case .tuplePatternElement: return visit(node as! TuplePatternElementSyntax)
    case .expressionPattern: return visit(node as! ExpressionPatternSyntax)
    case .valueBindingPattern: return visit(node as! ValueBindingPatternSyntax)
    default: return visitChildren(node)
    }
  }

  func visitChildren(_ node: Syntax) -> Syntax {
    let newLayout = node.children.map { visit($0).raw }
    return makeSyntax(node.raw.replacingLayout(newLayout))
  }
}

open class SyntaxVisitor {
    public init() {}
  open func visit(_ node: UnknownDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: UnknownExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: UnknownStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: UnknownTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: UnknownPatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: CodeBlockItemSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: CodeBlockSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: InOutExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PoundColumnExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TryExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DeclNameArgumentSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DeclNameArgumentsSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: IdentifierExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SuperRefExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: NilLiteralExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DiscardAssignmentExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AssignmentExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SequenceExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PoundLineExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PoundFileExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PoundFunctionExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PoundDsohandleExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SymbolicReferenceExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PrefixOperatorExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: BinaryOperatorExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ArrowExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: FloatLiteralExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TupleExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ArrayExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DictionaryExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ImplicitMemberExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: FunctionCallArgumentSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TupleElementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ArrayElementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DictionaryElementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: IntegerLiteralExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: StringLiteralExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: BooleanLiteralExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TernaryExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: MemberAccessExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DotSelfExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: IsExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AsExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TypeExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ClosureCaptureItemSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ClosureCaptureSignatureSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ClosureParamSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ClosureSignatureSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ClosureExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: UnresolvedPatternExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: FunctionCallExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SubscriptExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: OptionalChainingExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ForcedValueExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PostfixUnaryExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SpecializeExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: StringSegmentSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ExpressionSegmentSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: StringInterpolationExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: KeyPathExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ObjcNamePieceSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ObjcKeyPathExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: EditorPlaceholderExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ObjectLiteralExprSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TypeInitializerClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TypealiasDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AssociatedtypeDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ParameterClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ReturnClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: FunctionSignatureSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ElseifDirectiveClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: IfConfigDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PoundErrorDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PoundWarningDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DeclModifierSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: InheritedTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TypeInheritanceClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ClassDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: StructDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ProtocolDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ExtensionDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: MemberDeclBlockSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SourceFileSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: InitializerClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: FunctionParameterSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: FunctionDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: InitializerDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DeinitializerDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SubscriptDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ElseDirectiveClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AccessLevelModifierSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AccessPathComponentSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ImportDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AccessorParameterSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AccessorDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AccessorBlockSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: PatternBindingSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: VariableDeclSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AttributeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ContinueStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: WhileStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DeferStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ExpressionStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: RepeatWhileStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: GuardStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: WhereClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ForInStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SwitchStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DoStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ReturnStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: FallthroughStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: BreakStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ConditionElementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AvailabilityConditionSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: MatchingPatternConditionSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: OptionalBindingConditionSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DeclarationStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ThrowStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: IfStmtSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ElseIfContinuationSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ElseBlockSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SwitchCaseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SwitchDefaultLabelSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: CaseItemSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SwitchCaseLabelSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: CatchClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: GenericWhereClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SameTypeRequirementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: GenericParameterSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: GenericParameterClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ConformanceRequirementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: SimpleTypeIdentifierSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: MemberTypeIdentifierSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ArrayTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: DictionaryTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: MetatypeTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: OptionalTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ImplicitlyUnwrappedOptionalTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: CompositionTypeElementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: CompositionTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TupleTypeElementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TupleTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: FunctionTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AttributedTypeSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: GenericArgumentSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: GenericArgumentClauseSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TypeAnnotationSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: EnumCasePatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: IsTypePatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: OptionalPatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: IdentifierPatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: AsTypePatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TuplePatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: WildcardPatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: TuplePatternElementSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ExpressionPatternSyntax) {
    visitChildren(node)
  }
  open func visit(_ node: ValueBindingPatternSyntax) {
    visitChildren(node)
  }

  open func visit(_ token: TokenSyntax) {}

  /// The function called before visiting the node and its descendents.
  ///   - node: the node we are about to visit.
  open func visitPre(_ node: Syntax) {}

  /// The function called after visting the node and its descendents.
  ///   - node: the node we just finished visiting.
  open func visitPost(_ node: Syntax) {}

  public func visit(_ node: Syntax) {
    visitPre(node)
    defer { visitPost(node) }
    switch node.raw.kind {
    case .token: visit(node as! TokenSyntax)
    case .unknownDecl: visit(node as! UnknownDeclSyntax)
    case .unknownExpr: visit(node as! UnknownExprSyntax)
    case .unknownStmt: visit(node as! UnknownStmtSyntax)
    case .unknownType: visit(node as! UnknownTypeSyntax)
    case .unknownPattern: visit(node as! UnknownPatternSyntax)
    case .codeBlockItem: visit(node as! CodeBlockItemSyntax)
    case .codeBlock: visit(node as! CodeBlockSyntax)
    case .inOutExpr: visit(node as! InOutExprSyntax)
    case .poundColumnExpr: visit(node as! PoundColumnExprSyntax)
    case .tryExpr: visit(node as! TryExprSyntax)
    case .declNameArgument: visit(node as! DeclNameArgumentSyntax)
    case .declNameArguments: visit(node as! DeclNameArgumentsSyntax)
    case .identifierExpr: visit(node as! IdentifierExprSyntax)
    case .superRefExpr: visit(node as! SuperRefExprSyntax)
    case .nilLiteralExpr: visit(node as! NilLiteralExprSyntax)
    case .discardAssignmentExpr: visit(node as! DiscardAssignmentExprSyntax)
    case .assignmentExpr: visit(node as! AssignmentExprSyntax)
    case .sequenceExpr: visit(node as! SequenceExprSyntax)
    case .poundLineExpr: visit(node as! PoundLineExprSyntax)
    case .poundFileExpr: visit(node as! PoundFileExprSyntax)
    case .poundFunctionExpr: visit(node as! PoundFunctionExprSyntax)
    case .poundDsohandleExpr: visit(node as! PoundDsohandleExprSyntax)
    case .symbolicReferenceExpr: visit(node as! SymbolicReferenceExprSyntax)
    case .prefixOperatorExpr: visit(node as! PrefixOperatorExprSyntax)
    case .binaryOperatorExpr: visit(node as! BinaryOperatorExprSyntax)
    case .arrowExpr: visit(node as! ArrowExprSyntax)
    case .floatLiteralExpr: visit(node as! FloatLiteralExprSyntax)
    case .tupleExpr: visit(node as! TupleExprSyntax)
    case .arrayExpr: visit(node as! ArrayExprSyntax)
    case .dictionaryExpr: visit(node as! DictionaryExprSyntax)
    case .implicitMemberExpr: visit(node as! ImplicitMemberExprSyntax)
    case .functionCallArgument: visit(node as! FunctionCallArgumentSyntax)
    case .tupleElement: visit(node as! TupleElementSyntax)
    case .arrayElement: visit(node as! ArrayElementSyntax)
    case .dictionaryElement: visit(node as! DictionaryElementSyntax)
    case .integerLiteralExpr: visit(node as! IntegerLiteralExprSyntax)
    case .stringLiteralExpr: visit(node as! StringLiteralExprSyntax)
    case .booleanLiteralExpr: visit(node as! BooleanLiteralExprSyntax)
    case .ternaryExpr: visit(node as! TernaryExprSyntax)
    case .memberAccessExpr: visit(node as! MemberAccessExprSyntax)
    case .dotSelfExpr: visit(node as! DotSelfExprSyntax)
    case .isExpr: visit(node as! IsExprSyntax)
    case .asExpr: visit(node as! AsExprSyntax)
    case .typeExpr: visit(node as! TypeExprSyntax)
    case .closureCaptureItem: visit(node as! ClosureCaptureItemSyntax)
    case .closureCaptureSignature: visit(node as! ClosureCaptureSignatureSyntax)
    case .closureParam: visit(node as! ClosureParamSyntax)
    case .closureSignature: visit(node as! ClosureSignatureSyntax)
    case .closureExpr: visit(node as! ClosureExprSyntax)
    case .unresolvedPatternExpr: visit(node as! UnresolvedPatternExprSyntax)
    case .functionCallExpr: visit(node as! FunctionCallExprSyntax)
    case .subscriptExpr: visit(node as! SubscriptExprSyntax)
    case .optionalChainingExpr: visit(node as! OptionalChainingExprSyntax)
    case .forcedValueExpr: visit(node as! ForcedValueExprSyntax)
    case .postfixUnaryExpr: visit(node as! PostfixUnaryExprSyntax)
    case .specializeExpr: visit(node as! SpecializeExprSyntax)
    case .stringSegment: visit(node as! StringSegmentSyntax)
    case .expressionSegment: visit(node as! ExpressionSegmentSyntax)
    case .stringInterpolationExpr: visit(node as! StringInterpolationExprSyntax)
    case .keyPathExpr: visit(node as! KeyPathExprSyntax)
    case .objcNamePiece: visit(node as! ObjcNamePieceSyntax)
    case .objcKeyPathExpr: visit(node as! ObjcKeyPathExprSyntax)
    case .editorPlaceholderExpr: visit(node as! EditorPlaceholderExprSyntax)
    case .objectLiteralExpr: visit(node as! ObjectLiteralExprSyntax)
    case .typeInitializerClause: visit(node as! TypeInitializerClauseSyntax)
    case .typealiasDecl: visit(node as! TypealiasDeclSyntax)
    case .associatedtypeDecl: visit(node as! AssociatedtypeDeclSyntax)
    case .parameterClause: visit(node as! ParameterClauseSyntax)
    case .returnClause: visit(node as! ReturnClauseSyntax)
    case .functionSignature: visit(node as! FunctionSignatureSyntax)
    case .elseifDirectiveClause: visit(node as! ElseifDirectiveClauseSyntax)
    case .ifConfigDecl: visit(node as! IfConfigDeclSyntax)
    case .poundErrorDecl: visit(node as! PoundErrorDeclSyntax)
    case .poundWarningDecl: visit(node as! PoundWarningDeclSyntax)
    case .declModifier: visit(node as! DeclModifierSyntax)
    case .inheritedType: visit(node as! InheritedTypeSyntax)
    case .typeInheritanceClause: visit(node as! TypeInheritanceClauseSyntax)
    case .classDecl: visit(node as! ClassDeclSyntax)
    case .structDecl: visit(node as! StructDeclSyntax)
    case .protocolDecl: visit(node as! ProtocolDeclSyntax)
    case .extensionDecl: visit(node as! ExtensionDeclSyntax)
    case .memberDeclBlock: visit(node as! MemberDeclBlockSyntax)
    case .sourceFile: visit(node as! SourceFileSyntax)
    case .initializerClause: visit(node as! InitializerClauseSyntax)
    case .functionParameter: visit(node as! FunctionParameterSyntax)
    case .functionDecl: visit(node as! FunctionDeclSyntax)
    case .initializerDecl: visit(node as! InitializerDeclSyntax)
    case .deinitializerDecl: visit(node as! DeinitializerDeclSyntax)
    case .subscriptDecl: visit(node as! SubscriptDeclSyntax)
    case .elseDirectiveClause: visit(node as! ElseDirectiveClauseSyntax)
    case .accessLevelModifier: visit(node as! AccessLevelModifierSyntax)
    case .accessPathComponent: visit(node as! AccessPathComponentSyntax)
    case .importDecl: visit(node as! ImportDeclSyntax)
    case .accessorParameter: visit(node as! AccessorParameterSyntax)
    case .accessorDecl: visit(node as! AccessorDeclSyntax)
    case .accessorBlock: visit(node as! AccessorBlockSyntax)
    case .patternBinding: visit(node as! PatternBindingSyntax)
    case .variableDecl: visit(node as! VariableDeclSyntax)
    case .attribute: visit(node as! AttributeSyntax)
    case .continueStmt: visit(node as! ContinueStmtSyntax)
    case .whileStmt: visit(node as! WhileStmtSyntax)
    case .deferStmt: visit(node as! DeferStmtSyntax)
    case .expressionStmt: visit(node as! ExpressionStmtSyntax)
    case .repeatWhileStmt: visit(node as! RepeatWhileStmtSyntax)
    case .guardStmt: visit(node as! GuardStmtSyntax)
    case .whereClause: visit(node as! WhereClauseSyntax)
    case .forInStmt: visit(node as! ForInStmtSyntax)
    case .switchStmt: visit(node as! SwitchStmtSyntax)
    case .doStmt: visit(node as! DoStmtSyntax)
    case .returnStmt: visit(node as! ReturnStmtSyntax)
    case .fallthroughStmt: visit(node as! FallthroughStmtSyntax)
    case .breakStmt: visit(node as! BreakStmtSyntax)
    case .conditionElement: visit(node as! ConditionElementSyntax)
    case .availabilityCondition: visit(node as! AvailabilityConditionSyntax)
    case .matchingPatternCondition: visit(node as! MatchingPatternConditionSyntax)
    case .optionalBindingCondition: visit(node as! OptionalBindingConditionSyntax)
    case .declarationStmt: visit(node as! DeclarationStmtSyntax)
    case .throwStmt: visit(node as! ThrowStmtSyntax)
    case .ifStmt: visit(node as! IfStmtSyntax)
    case .elseIfContinuation: visit(node as! ElseIfContinuationSyntax)
    case .elseBlock: visit(node as! ElseBlockSyntax)
    case .switchCase: visit(node as! SwitchCaseSyntax)
    case .switchDefaultLabel: visit(node as! SwitchDefaultLabelSyntax)
    case .caseItem: visit(node as! CaseItemSyntax)
    case .switchCaseLabel: visit(node as! SwitchCaseLabelSyntax)
    case .catchClause: visit(node as! CatchClauseSyntax)
    case .genericWhereClause: visit(node as! GenericWhereClauseSyntax)
    case .sameTypeRequirement: visit(node as! SameTypeRequirementSyntax)
    case .genericParameter: visit(node as! GenericParameterSyntax)
    case .genericParameterClause: visit(node as! GenericParameterClauseSyntax)
    case .conformanceRequirement: visit(node as! ConformanceRequirementSyntax)
    case .simpleTypeIdentifier: visit(node as! SimpleTypeIdentifierSyntax)
    case .memberTypeIdentifier: visit(node as! MemberTypeIdentifierSyntax)
    case .arrayType: visit(node as! ArrayTypeSyntax)
    case .dictionaryType: visit(node as! DictionaryTypeSyntax)
    case .metatypeType: visit(node as! MetatypeTypeSyntax)
    case .optionalType: visit(node as! OptionalTypeSyntax)
    case .implicitlyUnwrappedOptionalType: visit(node as! ImplicitlyUnwrappedOptionalTypeSyntax)
    case .compositionTypeElement: visit(node as! CompositionTypeElementSyntax)
    case .compositionType: visit(node as! CompositionTypeSyntax)
    case .tupleTypeElement: visit(node as! TupleTypeElementSyntax)
    case .tupleType: visit(node as! TupleTypeSyntax)
    case .functionType: visit(node as! FunctionTypeSyntax)
    case .attributedType: visit(node as! AttributedTypeSyntax)
    case .genericArgument: visit(node as! GenericArgumentSyntax)
    case .genericArgumentClause: visit(node as! GenericArgumentClauseSyntax)
    case .typeAnnotation: visit(node as! TypeAnnotationSyntax)
    case .enumCasePattern: visit(node as! EnumCasePatternSyntax)
    case .isTypePattern: visit(node as! IsTypePatternSyntax)
    case .optionalPattern: visit(node as! OptionalPatternSyntax)
    case .identifierPattern: visit(node as! IdentifierPatternSyntax)
    case .asTypePattern: visit(node as! AsTypePatternSyntax)
    case .tuplePattern: visit(node as! TuplePatternSyntax)
    case .wildcardPattern: visit(node as! WildcardPatternSyntax)
    case .tuplePatternElement: visit(node as! TuplePatternElementSyntax)
    case .expressionPattern: visit(node as! ExpressionPatternSyntax)
    case .valueBindingPattern: visit(node as! ValueBindingPatternSyntax)
    default: visitChildren(node)
    }
  }

  func visitChildren(_ node: Syntax) {
    node.children.forEach { visit($0) }
  }
}
