import ohm from 'https://unpkg.com/ohm-js@17.1.0/dist/ohm.esm.js';
import { extras } from 'https://unpkg.com/ohm-js@17.1.0/dist/ohm.esm.js';

// There is no separate "core" grammar.
// Entries that are re-written (erased) by the simplifier are marked 'S'.
// The core grammar is a strict subset of the Spl grammar.
export const slGrammarDefinition: string = String.raw`
Sl {

	TopLevel
		= LibraryExpression+
		| Program
	LibraryExpression
		= TypeDefinition
		| TraitDefinition
		| MethodDefinitions
		| LibraryItem
		| TypeExtension
		| TraitExtension
    MethodNameList = "[" NonemptyListOf<methodName, ","> "]"
    MethodNameOrMethodNameList
		= methodName
		| MethodNameList
	TypeDefinition = typeName "!"? TraitList "{" SlotDefinitions? angleBracketedTraitOrTypeName? (MethodNameOrMethodNameList Block)* "}"
	TypeExtension = "+" typeName "{" (MethodNameOrMethodNameList Block)* "}"
	MethodDefinitions = "+" "[" NonemptyListOf<typeOrTraitName, ","> "]" "{" (MethodNameOrMethodNameList Block)* "}"
	SlotDefinitions = ConciseSlotDefinitions | VerboseSlotDefinitions
	ConciseSlotDefinitions = "|" slotName+ "|"
	VerboseSlotDefinitions = ("slot" slotName ";")+
	TraitList = ":" "[" ListOf<unqualifiedTraitName, ","> "]"
	TraitExtension = "+" qualifiedTraitName "{" (MethodNameOrMethodNameList Block)* "}"
	TraitDefinition = qualifiedTraitName "{" (MethodNameOrMethodNameList Block)* "}"
	LibraryItem
		= LibraryItemLiteral // S
		| LibraryItemExpression
	LibraryItemLiteral = "LibraryItem" NonEmptyRecordSyntax
	LibraryItemExpression = "LibraryItem" ApplySyntax
	Program = VarDeclaration? ListOf<(LetBinding | Expression), ";"> // VarDeclaration retained for blksc3 only
	Initializer =
		| BlockLiteralInitializer // S* (Simplifier adds arity qualifier)
		| ExpressionInitializer
		| RecordInitializer // S
		| ListInitializer // S
	BlockLiteralInitializer = (varNameOrUnused | operatorBound) "=" Block ~("." | operator)
	ExpressionInitializer = (varNameOrUnused | operatorFree) "=" Expression
	RecordInitializer = "(" NonemptyListOf<RecordInitializerItem, ","> ")" "=" Expression
	ListInitializer = "[" NonemptyListOf<varNameOrUnused, ","> "]" "=" Expression
	LetBinding = "let" Initializer
	VarDeclaration = "var" NonemptyListOf<varName, ","> ";"

	Expression
		= Assignment
		| BinaryExpression // S
		| Primary
	Assignment
		= ScalarAssignment
		| ListAssignment // S
		| RecordAssignment // S
	ScalarAssignment = varName ":=" Expression
	ListAssignment = "[" NonemptyListOf<varName, ","> "]" ":=" Expression // S
	RecordAssignment = "(" NonemptyListOf<RecordInitializerItem, ","> ")" ":=" Expression // S
	BinaryExpression // S
		= BinaryOperatorExpression // S
		| BinaryOperatorWithAdverbExpression // S
	BinaryOperatorExpression = Expression (operator Primary)+ // S
	BinaryOperatorWithAdverbExpression = Expression (operatorWithAdverb Primary)+ // S

	Primary
		= PutSyntax // S
		| AtAllSyntax // S
		| AtSyntax // S
		| DotExpressionWithTrailingClosuresSyntax // S
		| DotExpressionWithAssignmentSyntax // S
		| DotExpression // S
		| Block
		| ListConstructorSyntax // S
		| RecordConstructorSyntax // S
		| StringConstructorSyntax // S
		| ApplyWithTrailingClosuresSyntax // S
		| ApplySyntax
		| EmptyListSyntax
		| reservedIdentifier
		| literal
        | arityQualifiedIdentifier
        | negatedIdentifier
		| lowercaseIdentifier
		| systemVariableIdentifier // This is only required in two places, and should be localised (it cannot be written IN Spl though...)
		| operatorFree // S
		| VectorSyntax // S
		| MatrixSyntax // S
		| VolumeSyntax // S
		| NonEmptyListSyntax
		| ParenthesisedExpression
		| EmptyRecordSyntax // S
		| NonEmptyRecordSyntax // S
		| EmptyMapSyntax // S
		| NonEmptyMapSyntax // S
		| TupleSyntax // S
		| RangeSyntax // S
		| ListRangeSyntax // S

	PutSyntax = Primary "[" Expression "]" ":=" Expression
	AtSyntax = Primary "[" Expression "]"
	AtAllSyntax = Primary (ListRangeSyntax | NonScalarListSyntax)
	ParameterList = "(" ListOf<Expression, ","> ")"
	NonEmptyParameterList = "(" NonemptyListOf<Expression, ","> ")"

	DotExpressionWithTrailingClosuresSyntax = Primary "." selectorName NonEmptyParameterList? Block+
	DotExpressionWithAssignmentSyntax = Primary "." selectorName ":=" Expression
	DotExpression = Primary ("." (selectorName | operatorBound) ~("{" | ":=") NonEmptyParameterList? ~("{" | "("))+

    Block = BlockWithoutAnnotations | BlockWithAnnotations
	BlockWithoutAnnotations = "{" ArgumentsWithoutAnnotations? Primitive? Statements? "}"
	ArgumentsWithoutAnnotations = argumentName+ "|"
	BlockWithAnnotations = "{" ArgumentsWithAnnotations? Primitive? Statements? "}" // S
    ArgumentsWithAnnotations = (argumentName uppercaseIdentifier?)+ "|" // S
	Primitive = "<primitive:" primitiveCharacter* ">"
	Statements = NonFinalStatement* FinalStatement
	NonFinalStatement = (LetBinding | Expression) ";"
	FinalStatement = Expression

	ApplyWithTrailingClosuresSyntax = selectorName NonEmptyParameterList? Block+
	ApplySyntax = (selectorName | operatorBound) ParameterList
    ListConstructorSyntax = typeName (EmptyListSyntax | VectorSyntax | MatrixSyntax | VolumeSyntax | NonEmptyListSyntax | ListRangeSyntax)
    RecordConstructorSyntax = methodName NonEmptyRecordSyntax
    StringConstructorSyntax = typeName singleQuotedStringLiteral
	ParenthesisedExpression = "(" Expression ")"
	EmptyMapSyntax = "[" ":" "]"
	NonEmptyMapSyntax = "[" NonemptyListOf<MapSyntaxItem, ","> "]"
	MapSyntaxItem = Expression ":" Expression
	NonEmptyRecordSyntax = "(" NonemptyListOf<RecordSyntaxItem, ","> ")"
	EmptyRecordSyntax = "(" ":" ")"
	RecordSyntaxItem = RecordKeyAssociation | StringAssociation
	RecordKeyAssociation = recordKeyToken Expression
	StringAssociation = singleQuotedStringLiteral ":" Expression
	RecordInitializerItem = recordKeyToken varName
	TupleSyntax = "(" NonemptyListOf<Expression, ","> ")"
	NonEmptyListSyntax = "[" ListOf<Expression, ","> "]"
	NonScalarListSyntax = "[" Expression "," ListOf<Expression, ","> "]"
	RangeSyntax = RangeFromToSyntax | RangeFromThenToSyntax | RangeFromToBySyntax
    RangeFromToSyntax = "(" Expression ".." Expression ")"
	RangeFromThenToSyntax = "(" Expression "," Expression ".." Expression ")"
	RangeFromToBySyntax = "(" Expression ".." Expression ";" Expression ")"
	ListRangeSyntax = ListRangeFromToSyntax | ListRangeFromThenToSyntax | ListRangeFromToBySyntax
    ListRangeFromToSyntax = "[" Expression ".." Expression "]"
	ListRangeFromThenToSyntax = "[" Expression "," Expression ".." Expression "]"
	ListRangeFromToBySyntax = "[" Expression ".." Expression ";" Expression "]"
	EmptyListSyntax = "[" "]"
	VectorSyntax = "[" VectorSyntaxItem+ "]"
	VectorSyntaxItem = VectorSyntaxUnarySend | literal | reservedIdentifier | lowercaseIdentifier | negatedIdentifier
	VectorSyntaxUnarySend = (literal | identifier) ("." (selectorName | operatorBound))+
	MatrixSyntax = "[" NonemptyListOf<MatrixSyntaxItems, ";"> "]"
	MatrixSyntaxItems = VectorSyntaxItem*
	VolumeSyntax = "[" NonemptyListOf<VolumeSyntaxItems, ":;"> "]"
	VolumeSyntaxItems = NonemptyListOf<MatrixSyntaxItems, ";">

    angleBracketedTraitOrTypeName = "<" (qualifiedTraitName | typeName) ">"
	argumentName = ":" varNameOrUnused
	unqualifiedIdentifier = letter letterOrDigit* "!"?
	negatedIdentifier = "-" lowercaseIdentifier
	arityQualifiedIdentifier = letter letterOrDigit* "!"? ("/" digit+)
	lowercaseArityQualifiedIdentifier = lower letterOrDigit* "!"? ("/" digit+)
	identifier
		= arityQualifiedIdentifier
		| unqualifiedIdentifier
		| negatedIdentifier
	methodName
		= unqualifiedIdentifier
		| operatorBound
	selectorName = unqualifiedIdentifier
	unusedVariableIdentifier = "_"
	systemVariableIdentifier = "__SplVar" digit+
    uppercaseIdentifier = upper letterOrDigit*
	typeName = uppercaseIdentifier
	unqualifiedTraitName = uppercaseIdentifier
	qualifiedTraitName = "@" uppercaseIdentifier
    typeOrTraitName
		= typeName
		| qualifiedTraitName
    lowercaseIdentifier = lower letterOrDigit* "!"?
	varName
		= lowercaseArityQualifiedIdentifier
		| lowercaseIdentifier
		| systemVariableIdentifier
	varNameOrUnused = (varName | unusedVariableIdentifier)
	slotName = lowercaseIdentifier
	recordKey = lowercaseIdentifier | uppercaseIdentifier // S
	recordKeyToken = recordKey ":" // S
	letterOrDigit
		= letter
		| digit
	reservedIdentifier = ("nil" | "true" | "false") ~letterOrDigit
	operator = operatorChar+ // S
	operatorBound = operatorChar+ // S
    operatorFree = operatorChar+ // S
	operatorWithAdverb
		= operatorWithBinaryAdverb // S
		| operatorWithUnaryAdverb // S
	operatorWithUnaryAdverb = operator "." selectorName // S
	operatorWithBinaryAdverb = operator "." selectorName "(" (operatorFree | arityQualifiedIdentifier | numberLiteral) ")" // S
	operatorChar = "!" | "%" | "&" | "*" | "+" | "/" | "<" | "=" | ">" | "?" | "@" | "~" | "|" | "-" | "^" | "#" | "$" | "\\" // S
	plusOrMinus = "+" | "-"

	literal
		= rangeLiteral // S
		| numberLiteral
		| singleQuotedStringLiteral
		| doubleQuotedStringLiteral // S
		| backtickQuotedStringLiteral // S
	numberLiteral
		= decimalLiteral // S
		| floatScientificLiteral // S
		| integerScientificLiteral // S
		| complexLiteral // S
		| imaginaryLiteral // S
		| residueLiteral // S
		| floatLiteral
		| fractionLiteral // S
		| largeIntegerLiteral
		| radixIntegerLiteral // S
		| smallIntegerLiteral // S
		| infinityLiteral
		| nanLiteral
	rangeLiteral // S
		= rangeFromToByLiteral // S
		| rangeFromToLiteral // S
	rangeFromToByLiteral = integerLiteral ":" (integerLiteral | identifier) ":" integerLiteral // S
	rangeFromToLiteral = integerLiteral ":" (integerLiteral | identifier) // S
	floatLiteral = plusOrMinus? decimalDigits "." digit+ "F"?
	decimalLiteral
		= floatDecimalLiteral
		| integerDecimalLiteral
	floatDecimalLiteral = plusOrMinus? digit+ "." digit+ ("d" | "D") (digit+)? // S
	integerDecimalLiteral = plusOrMinus? digit+ ("d" | "D") (digit+)? // S
	floatScientificLiteral = floatLiteral ("e" | "E") integerLiteral // S
	integerScientificLiteral = integerLiteral ("e" | "E") integerLiteral // S
	complexLiteral = integerOrFloatLiteral ("j" | "J") integerOrFloatLiteral // S
	imaginaryLiteral = integerOrFloatLiteral ("i" | "I") // S
	residueLiteral = integerLiteral ("z" | "Z") digit+ // S
	fractionLiteral = plusOrMinus? digits ("/" | "r" | "R") digits // S
	largeIntegerLiteral = plusOrMinus? decimalDigits ("l" | "L") // S
    radixDigit = digit | "A" | "B" | "C" | "D" | "E" | "F" // S
	radixDigitOrUnderscore = radixDigit | "_" // S
	radixDigits = radixDigit radixDigitOrUnderscore* // S
	radixIntegerLiteral = plusOrMinus? digit+ ("b" | "B") radixDigits // S
    infinityLiteral = plusOrMinus? "Infinity"
	nanLiteral = "NaN"
	smallIntegerLiteral = plusOrMinus? decimalDigits
	decimalDigits = digit digitOrUnderscore*
	digitOrUnderscore = digit | "_"
	digits = digit digitOrUnderscore*
    integerLiteral
		= largeIntegerLiteral
		| radixIntegerLiteral // S
		| smallIntegerLiteral
    integerOrFloatLiteral
		= floatLiteral
		| integerLiteral
	singleQuotedStringLiteral = "\'" (~"\'" ("\\\'" | "\\\\" | sourceCharacter))* "\'"
	doubleQuotedStringLiteral = "\"" (~"\"" ("\\\"" | "\\\\" | sourceCharacter))* "\"" // S
	backtickQuotedStringLiteral = backtickCharacter (~backtickCharacter sourceCharacter)* backtickCharacter // S
	backtickCharacter = "${String.fromCodePoint(96)}"
	sourceCharacter = any

	primitiveCharacter = ~(">\n" | "> }") sourceCharacter

	comment = multiLineCComment
	multiLineCComment = "/*" (~"*/" sourceCharacter)* "*/"
	lineTerminator = "\n" | "\r"
	space += comment

}
`;

export const slGrammar: ohm.Grammar = ohm.grammar(slGrammarDefinition);

export const slSemantics: ohm.Semantics = slGrammar.createSemantics();

export function slParse(str: string): ohm.Dict {
	return slSemantics(slGrammar.match(str));
}

export function slParseToAst(str: string) {
	return extras.toAST(slGrammar.match(str));
}

export function slBlockArity(str: string): number {
	const arg = slParseToAst(str)[1][0][0];
	return arg === null ? 0 : arg.length;
}

/*
import * as sl from './grammar.ts'
sl.slParseToAst('3 + 4')
sl.slBlockArity('{ :i :j | i + 1 * j }') === 2
*/
