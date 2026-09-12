import ohm from 'https://unpkg.com/ohm-js@17.1.0/dist/ohm.esm.js';
import { extras } from 'https://unpkg.com/ohm-js@17.1.0/dist/ohm.esm.js';

// Entries that are re-written (erased) by the simplifier are marked 'S'.
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
	TypeDefinition = typeName "!"? TraitList "{" SlotDefinitions? (MethodNameOrMethodNameList Block)* "}"
	TypeExtension = "+" typeName "{" (MethodNameOrMethodNameList Block)* "}"
	MethodDefinitions = "+" "[" NonemptyListOf<typeOrTraitName, ","> "]" "{" (MethodNameOrMethodNameList Block)* "}"
	SlotDefinitions = "|" (TypedSlot | UntypedSlot)+ "|"
	TypedSlot = slotName ":" "<" typeName ">"
	UntypedSlot = slotName
	TraitList = ":" "[" ListOf<unqualifiedTraitName, ","> "]"
	TraitExtension = "+" qualifiedTraitName "{" (MethodNameOrMethodNameList Block)* "}"
	TraitDefinition = qualifiedTraitName "{" (MethodNameOrMethodNameList Block)* "}"
	LibraryItem
		= LibraryItemLiteral // S
		| LibraryItemExpression
	LibraryItemLiteral = "LibraryItem" NonEmptyRecordSyntax
	LibraryItemExpression = "LibraryItem" ApplySyntax
	Program = VarDeclaration? ListOf<(LetBinding | Expression), ";">
	Temporaries
		= VarDeclaration // S
		| ListOf<LetBinding, ";">
	Initializer =
		| BlockLiteralInitializer // S* (Simplifier adds arity qualifier)
		| ExpressionInitializer
		| RecordInitializer // S
		| ListInitializer // S
	BlockLiteralInitializer = varName "=" Block ~("." | operator)
	ExpressionInitializer = varNameOrUnused "=" Expression
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
	ListAssignment = "[" NonemptyListOf<varName, ","> "]" ":=" Expression
	RecordAssignment = "(" NonemptyListOf<RecordInitializerItem, ","> ")" ":=" Expression
	BinaryExpression
		= BinaryOperatorExpression // S
		| BinaryAdverbExpression // S
	BinaryOperatorExpression = Expression (operator Primary)+
	BinaryAdverbExpression = Expression (operatorWithAdverb Primary)+

	Primary
		= AtPutSyntax // S
		| UncheckedSlotWriteSyntax // S
		| AtAllSyntax // S
		| AtSyntax // S
		| UncheckedSlotReadSyntax // S
		| ValueApply
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
		| identifier
		| systemVariableIdentifier // This is only required in two places, and should be localised (it cannot be written IN Spl though...)
		| operatorFree // S
		| VectorSyntax // S
		| MatrixSyntax // S
		| VolumeSyntax // S
		| NonEmptyListSyntax
		| ParenthesisedExpression
		| EmptyRecordSyntax // S
		| NonEmptyRecordSyntax // S
		| TupleSyntax // S
		| RangeSyntax // S
		| ListRangeSyntax // S

	AtPutSyntax = Primary "[" Expression "]" ":=" Expression
	AtSyntax = Primary "[" Expression "]"
	AtAllSyntax = Primary (ListRangeSyntax | NonScalarListSyntax)
	UncheckedSlotReadSyntax = Primary "::" recordKey
	UncheckedSlotWriteSyntax = Primary "::" recordKey ":=" Expression
	ValueApply = Primary "." ParameterList
	ParameterList = "(" ListOf<Expression, ","> ")"
	NonEmptyParameterList = "(" NonemptyListOf<Expression, ","> ")"

	DotExpressionWithTrailingClosuresSyntax = Primary "." selectorName NonEmptyParameterList? Block+
	DotExpressionWithAssignmentSyntax = Primary "." selectorName ":=" Expression
	DotExpression = Primary ("." (selectorName | operatorBound) ~("{" | ":=") NonEmptyParameterList? ~("{" | "("))+

	Block = "{" Arguments? VarDeclaration? Primitive? Statements? "}"
	Arguments = argumentName+ "|"
	Primitive = "<primitive:" primitiveCharacter* ">"
	Statements = NonFinalStatement* FinalStatement
	NonFinalStatement = (LetBinding | Expression) ";"
	FinalStatement = Expression

	ApplyWithTrailingClosuresSyntax = selectorName NonEmptyParameterList? Block+
	ApplySyntax = (selectorName | operatorBound) ParameterList
    ListConstructorSyntax = typeName (EmptyListSyntax | VectorSyntax | MatrixSyntax | VolumeSyntax | NonEmptyListSyntax | ListRangeSyntax)
    RecordConstructorSyntax = typeName NonEmptyRecordSyntax
    StringConstructorSyntax = typeName singleQuotedStringLiteral
	ParenthesisedExpression = "(" Expression ")"
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
	VectorSyntaxItem = VectorSyntaxUnarySend | literal | reservedIdentifier | identifier
	VectorSyntaxUnarySend = (literal | identifier) ("." (selectorName | operatorBound))+
	MatrixSyntax = "[" NonemptyListOf<MatrixSyntaxItems, ";"> "]"
	MatrixSyntaxItems = VectorSyntaxItem*
	VolumeSyntax = "[" NonemptyListOf<VolumeSyntaxItems, ":;"> "]"
	VolumeSyntaxItems = NonemptyListOf<MatrixSyntaxItems, ";">

	argumentName = ":" varNameOrUnused
	unqualifiedIdentifier = letter letterOrDigit*
	negatedIdentifier = "-" lowercaseIdentifier
	arityQualifiedIdentifier = letter letterOrDigit* (":/" digit+)
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
    lowercaseIdentifier = lower letterOrDigit*
	varName
		= arityQualifiedIdentifier // arity branch should be lowercase
		| lowercaseIdentifier
		| systemVariableIdentifier
	varNameOrUnused = (varName | unusedVariableIdentifier)
	slotNameWithType = lowercaseIdentifier ":" "<" uppercaseIdentifier ">"
	slotName = lowercaseIdentifier
	constantName = lowercaseIdentifier
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
	operatorWithUnaryAdverb = operator "." selectorName
	operatorWithBinaryAdverb = operator "." selectorName "(" (operatorFree | arityQualifiedIdentifier | numberLiteral) ")"
	operatorChar = "!" | "%" | "&" | "*" | "+" | "/" | "<" | "=" | ">" | "?" | "@" | "~" | "|" | "-" | "^" | "#" | "$" | "\\"
	plusOrMinus = "+" | "-"

	literal
		= rangeLiteral
		| numberLiteral
		| singleQuotedStringLiteral
		| doubleQuotedStringLiteral
		| backtickQuotedStringLiteral
	numberLiteral
		= decimalLiteral
		| scientificLiteral
		| complexLiteral
		| imaginaryLiteral
		| residueLiteral
		| floatLiteral
		| fractionLiteral
		| largeIntegerLiteral
		| radixIntegerLiteral
		| smallIntegerLiteral
		| infinityLiteral
		| nanLiteral
	rangeLiteral
		= rangeFromToByLiteral
		| rangeFromToLiteral
	rangeFromToByLiteral = integerLiteral ":" (integerLiteral | identifier) ":" integerLiteral
	rangeFromToLiteral = integerLiteral ":" (integerLiteral | identifier)
	floatLiteral = plusOrMinus? decimalDigits "." digit+
	decimalLiteral
		= floatDecimalLiteral
		| integerDecimalLiteral
	floatDecimalLiteral = plusOrMinus? digit+ "." digit+ "D" (digit+)? // ("d" | "D")
	integerDecimalLiteral = plusOrMinus? digit+ "D" (digit+)? // ("d" | "D")
	scientificLiteral = integerOrFloatLiteral "E" integerLiteral // ("e" | "E")
	complexLiteral = integerOrFloatLiteral "J" integerOrFloatLiteral // ("j" | "J")
	imaginaryLiteral = integerOrFloatLiteral "I" // ("i" | "I")
	residueLiteral = integerLiteral "Z" digit+ // ("z" | "Z")
	fractionLiteral = plusOrMinus? digits "/" digits
	largeIntegerLiteral = plusOrMinus? decimalDigits "L"
    radixDigit = digit | "A" | "B" | "C" | "D" | "E" | "F"
	radixDigitOrUnderscore = radixDigit | "_"
	radixDigits = radixDigit radixDigitOrUnderscore*
	radixIntegerLiteral = plusOrMinus? digit+ "r" radixDigits
    infinityLiteral = plusOrMinus? "Infinity"
	nanLiteral = "NaN"
	smallIntegerLiteral = plusOrMinus? decimalDigits
	decimalDigits = digit digitOrUnderscore*
	digitOrUnderscore = digit | "_"
	digits = digit digitOrUnderscore*
    integerLiteral
		= largeIntegerLiteral
		| radixIntegerLiteral
		| smallIntegerLiteral
    integerOrFloatLiteral
		= floatLiteral
		| integerLiteral
	singleQuotedStringLiteral = "\'" (~"\'" ("\\\'" | "\\\\" | sourceCharacter))* "\'"
	doubleQuotedStringLiteral = "\"" (~"\"" ("\\\"" | "\\\\" | sourceCharacter))* "\""
	backtickQuotedStringLiteral = backtickCharacter (~backtickCharacter sourceCharacter)* backtickCharacter
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
