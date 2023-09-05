// @ts-nocheck

import ohm from 'https://unpkg.com/ohm-js@16/dist/ohm.esm.js';
import { extras } from 'https://unpkg.com/ohm-js@16/dist/ohm.esm.js';

export const slGrammarDefinition = String.raw`
Sl {

	TopLevel = LibraryExpression+ | Program
	LibraryExpression = TypeExpression | TraitExpression | ConstantDefinition
	TypeExpression = TypeExtension | TypeListExtension | TypeDefinition
	TypeExtension = "+" identifier "{" (methodName Block)* "}"
	TypeListExtension = "+" "[" NonemptyListOf<identifier, ","> "]" "{" (methodName Block)* "}"
	TypeDefinition = identifier TraitList? "{" Temporaries? (methodName Block)* "}"
	TraitList = ":" "[" NonemptyListOf<identifier, ","> "]"
	TraitExpression = TraitExtension | TraitDefinition
	TraitExtension = "+" "@" identifier "{" (methodName Block)* "}"
	TraitDefinition = "@" identifier "{" (methodName Block)* "}"
	ConstantDefinition = "Constant" "." unqualifiedIdentifier "=" literal
	Program = Temporaries? ListOf<Expression, ";">
	Temporaries = TemporariesWithInitializers | TemporariesWithoutInitializers | TemporariesParenSyntax | TemporariesVarWithoutInitializersSyntax | TemporariesVarWithInitializersSyntax+
	TemporariesWithInitializers = "|" NonemptyListOf<TemporaryWithInitializer, ","> ";" "|"
	TemporaryWithInitializer =
		TemporaryWithBlockLiteralInitializer |
		TemporaryWithExpressionInitializer |
		TemporaryWithDictionaryInitializer |
		TemporaryWithArrayInitializer
	TemporaryWithBlockLiteralInitializer = identifier "=" Block ~("." | binaryOperator)
	TemporaryWithExpressionInitializer = identifier "=" Expression
	TemporaryWithDictionaryInitializer = "("  NonemptyListOf<identifier, ","> ")" "=" Expression
	TemporaryWithArrayInitializer = "["  NonemptyListOf<identifierOrUnused, ","> "]" "=" Expression
	TemporariesWithoutInitializers = "|" identifier+ "|"
	TemporariesParenSyntax = "|(" NonemptyListOf<TemporaryWithInitializer, ","> ")|"
	TemporariesVarWithoutInitializersSyntax = "var" NonemptyListOf<identifier, ","> ";"
	TemporariesVarWithInitializersSyntax = "var" NonemptyListOf<TemporaryWithInitializer, ","> ";"

	Expression = Assignment | BinaryExpression | Primary
	Assignment = ScalarAssignment | ArrayAssignment | DictionaryAssignment
	ScalarAssignment = identifier ":=" Expression
	ArrayAssignment = "[" NonemptyListOf<identifier, ","> "]" ":=" Expression
	DictionaryAssignment = "(" NonemptyListOf<identifier, ","> ")" ":=" Expression
	BinaryExpression = Expression (binaryOperator Primary)+

	Primary
		= AtPutSyntax
		| AtPutQuotedSyntax
		| AtPutDelegateSyntax
		| WriteSlotSyntax
		| AtSyntax
		| AtAllVectorSyntax
		| AtAllArraySyntax
		| AtPathPutSyntax
		| AtMatrixSyntax
		| AtVolumeSyntax
		| AtPathSyntax
		| AtQuotedSyntax
		| ReadSlotSyntax
		| ValueApply
		| DotExpressionWithTrailingClosuresSyntax
		| DotExpressionWithTrailingDictionariesSyntax
		| DotExpressionWithAssignmentSyntax
		| DotExpression
		| ImplicitDictionaryAtPutSyntax
		| ImplicitDictionaryAtSyntax
		| Block
		| ApplyWithTrailingDictionariesSyntax
		| ApplyWithTrailingClosuresSyntax
		| ApplySyntax
		| MessageSendSyntax
		| reservedIdentifier
		| identifier
		| literal
		| ParenthesisedExpression
		| DictionaryExpression
		| ArrayExpression
		| ArrayRangeSyntax
		| ArrayRangeThenSyntax
		| IntervalSyntax
		| IntervalThenSyntax
		| VectorSyntax
		| MatrixSyntax
		| VolumeSyntax

	AtPutSyntax = Primary "[" Expression "]" ":=" Expression
	AtPutQuotedSyntax = Primary "::" identifier ":=" Expression
	AtSyntax = Primary "[" Expression "]"
	AtAllArraySyntax = Primary "[" NonemptyListOf<Expression, ","> "]"
	AtAllVectorSyntax = Primary "[" VectorSyntaxItem+ "]"
	AtMatrixSyntax = Primary "[" Expression ";" Expression "]"
	AtVolumeSyntax = Primary "[" Expression ";" Expression ";" Expression "]"
	AtPathPutSyntax = Primary "[" NonemptyListOf<Expression, ";"> "]" ":=" Expression
	AtPathSyntax = Primary "[" NonemptyListOf<Expression, ";"> "]"
	AtQuotedSyntax = Primary "::" identifier
	AtPutDelegateSyntax = Primary ":." identifier ":=" Expression
	MessageSendSyntax = Primary ":." identifier NonEmptyParameterList?
	ReadSlotSyntax = Primary ":@" identifier
	WriteSlotSyntax = Primary ":@" identifier ":=" Expression
	ValueApply = Primary "." ParameterList
	ParameterList =  "(" ListOf<Expression, ","> ")"
	NonEmptyParameterList =  "(" NonemptyListOf<Expression, ","> ")"

	DotExpressionWithTrailingClosuresSyntax = Primary "." identifier NonEmptyParameterList? Block+
	DotExpressionWithTrailingDictionariesSyntax = Primary "." identifier NonEmptyParameterList? NonEmptyDictionaryExpression+
	DotExpressionWithAssignmentSyntax = Primary "." identifier ":=" Expression
	DotExpression = Primary ("." identifier ~("{" | ":=") NonEmptyParameterList?~("{"))+

	ImplicitDictionaryAtPutSyntax = "::" identifier ":=" Expression
	ImplicitDictionaryAtSyntax = "::" identifier

	Block = "{" BlockBody "}"
	BlockBody = Arguments? Temporaries? Primitive? Statements?
	Arguments = ArgumentName+ "|"
	ArgumentName = ":" identifierOrUnused
	Primitive = "<primitive:" primitiveCharacter* ">"
	Statements = NonFinalExpression | FinalExpression
	NonFinalExpression = Expression ";" Statements
	FinalExpression = Expression

	ApplyWithTrailingClosuresSyntax = identifier NonEmptyParameterList? Block+
	ApplyWithTrailingDictionariesSyntax = identifier NonEmptyParameterList? NonEmptyDictionaryExpression+
	ApplySyntax = identifier ParameterList
	ParenthesisedExpression = "(" Expression ")"
	NonEmptyDictionaryExpression = "(" NonemptyListOf<AssociationExpression, ","> ")"
	DictionaryExpression = "(" ListOf<AssociationExpression, ","> ")"
	AssociationExpression = IdentifierAssociation | StringAssociation
	IdentifierAssociation = identifier ":" Expression
	StringAssociation = singleQuotedStringLiteral ":" Expression
	ArrayExpression = "[" ListOf<Expression, ","> "]"
	ArrayRangeSyntax = "[" Expression ".." Expression "]"
	ArrayRangeThenSyntax = "[" Expression "," Expression ".." Expression "]"
	IntervalSyntax = "(" Expression ".." Expression ")"
	IntervalThenSyntax = "(" Expression "," Expression ".." Expression ")"
	VectorSyntax = "[" VectorSyntaxItem+ "]"
	VectorSyntaxItem = VectorSyntaxUnarySend | literal | identifier | VectorSyntax
	VectorSyntaxUnarySend = (literal | identifier) "." identifier
	MatrixSyntax = "[" ListOf<MatrixSyntaxItems, ";"> "]"
	MatrixSyntaxItems = VectorSyntaxItem+
	VolumeSyntax = "[" ListOf<VolumeSyntaxItems, ";;"> "]"
	VolumeSyntaxItems = ListOf<MatrixSyntaxItems, ";">

	methodName = identifier | binaryOperator
	unqualifiedIdentifier = letter letterOrDigit*
	qualifiedIdentifier = letter letterOrDigit* (":/" digit+)
	identifier = qualifiedIdentifier | unqualifiedIdentifier
	unusedVariableIdentifier = "_"
	identifierOrUnused = (identifier | unusedVariableIdentifier)
	letterOrDigit = letter | digit
	reservedIdentifier = "nil" | "true" | "false"
	binaryOperator = binaryChar+
	binaryChar = "!" | "%" | "&" | "*" | "+" | "/" | "<" | "=" | ">" | "?" | "@" | "~" | "|" | "-" | "^" | "#" | "$" | "\\"

	literal = numberLiteral | singleQuotedStringLiteral | doubleQuotedStringLiteral | backtickQuotedStringLiteral
	numberLiteral = floatLiteral | fractionLiteral | largeIntegerLiteral | radixIntegerLiteral | integerLiteral
	floatLiteral = "-"? digit+ "." digit+
	fractionLiteral = "-"? digit+ ":" digit+
	largeIntegerLiteral = "-"? digit+ "n"
	radixIntegerLiteral = "-"? digit+ "r" letterOrDigit+
	integerLiteral = "-"? digit+
	singleQuotedStringLiteral = "\'" (~"\'" ("\\\'" | "\\\\" | sourceCharacter))* "\'"
	doubleQuotedStringLiteral = "\"" (~"\"" ("\\\"" | "\\\\" | sourceCharacter))* "\""
	backtickQuotedStringLiteral = backtickCharacter (~backtickCharacter sourceCharacter)* backtickCharacter
	backtickCharacter = "${String.fromCodePoint(96)}"
	sourceCharacter = any

	primitiveCharacter = ~">" sourceCharacter

	comment = multiLineMlComment | singleLineMlComment
	multiLineMlComment = "(*" (~"*)" sourceCharacter)* "*)"
	singleLineMlComment = "(*)" (~lineTerminator sourceCharacter)*
	lineTerminator = "\n" | "\r"
	space += comment

}
`;

export const slGrammar = ohm.grammar(slGrammarDefinition);

export const slSemantics = slGrammar.createSemantics();

export function slParse(str) {
	return slSemantics(slGrammar.match(str));
}

export function slParseToAst(str) {
	return extras.toAST(slGrammar.match(str));
}

export function slTemporariesKeywordNames(str: string): string[] {
	return slParseToAst(str)[0][0];
}

export function slTemporariesSyntaxNames(str: string): string[] {
	return slParseToAst(str)[0];
}

export function slBlockArity(str: string): number {
	const arg = slParseToAst(str)[1][0][0];
	return arg === null ? 0 : arg.length;
}

/*
import * as sl from './grammar.ts'
sl.slParseToAst('3 + 4')
sl.slTemporariesKeywordNames('var i = 0, j = 1;') //= ['i', 'j']
sl.slTemporariesSyntaxNames('| i j |') //= ['i', 'j']
sl.slBlockArity('{ :i :j | i + 1 * j }') === 2
*/
