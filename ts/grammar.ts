import ohm from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';
import { extras } from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';

export const slGrammarDefinition: string = String.raw`
Sl {

	TopLevel = LibraryExpression+ | Program
	LibraryExpression = TypeDefinition | TraitDefinition | MethodDefinitions | LibraryItem | TypeExtension | TraitExtension
	TypeDefinition = typeName "!"? TraitList "{" SlotDefinitions? (methodName Block)* "}"
	TypeExtension = "+" typeName "{" (methodName Block)* "}"
	MethodDefinitions = "+" "[" NonemptyListOf<typeOrTraitName, ","> "]" "{" (methodName Block)* "}"
	SlotDefinitions = "|" (TypedSlot | UntypedSlot)+ "|"
	TypedSlot = slotName ":" "<" typeName ">"
	UntypedSlot = slotName
	TraitList = ":" "[" ListOf<unqualifiedTraitName, ","> "]"
	TraitExtension = "+" qualifiedTraitName "{" (methodName Block)* "}"
	TraitDefinition = qualifiedTraitName "{" (methodName Block)* "}"
	LibraryItem = LibraryItemLiteral | LibraryItemExpression
	LibraryItemLiteral = "LibraryItem" NonEmptyRecordSyntax
	LibraryItemExpression = "LibraryItem" ApplySyntax
	Program = Temporaries? ListOf<Expression, ";">
	Temporaries = VarTemporaries | LetTemporary+
	Initializer =
		BlockLiteralInitializer |
		ExpressionInitializer |
		RecordInitializer |
		ListInitializer
	BlockLiteralInitializer = varName "=" Block ~("." | operator)
	ExpressionInitializer = varNameOrUnused "=" Expression
	RecordInitializer = "(" NonemptyListOf<RecordInitializerItem, ","> ")" "=" Expression
	ListInitializer = "[" NonemptyListOf<varNameOrUnused, ","> "]" "=" Expression
	LetTemporary = "let" Initializer ";"
	VarTemporaries = "var" NonemptyListOf<varName, ","> ";"

	Expression = Assignment | BinaryExpression | Primary
	Assignment = ScalarAssignment | ListAssignment | RecordAssignment
	ScalarAssignment = varName ":=" Expression
	ListAssignment = "[" NonemptyListOf<varName, ","> "]" ":=" Expression
	RecordAssignment = "(" NonemptyListOf<RecordInitializerItem, ","> ")" ":=" Expression
	BinaryExpression = BinaryOperatorExpression | BinaryAdverbExpression
	BinaryOperatorExpression = Expression (operator Primary)+
	BinaryAdverbExpression = Expression (operatorWithAdverb Primary)+

	Primary
		= AtPutSyntax
		| UncheckedSlotWriteSyntax
		| AtAllSyntax
		| AtSyntax
		| UncheckedSlotReadSyntax
		| ValueApply
		| DotExpressionWithTrailingRecordSyntax
		| DotExpressionWithTrailingClosuresSyntax
		| DotExpressionWithAssignmentSyntax
		| DotExpression
		| Block
		| ApplyWithTrailingRecordSyntax
		| ApplyWithTrailingClosuresSyntax
		| ApplySyntax
		| EmptyListSyntax
		| reservedIdentifier
		| literal
		| identifier
        | systemVariableIdentifier // This is only required in two places, and should be localised (it cannot be written IN Spl though...)
		| operator
		| VectorSyntax
		| MatrixSyntax
		| VolumeSyntax
		| ListSyntax
		| ParenthesisedExpression
		| EmptyRecordSyntax
		| NonEmptyRecordSyntax
		| EmptyMapSyntax
		| NonEmptyMapSyntax
		| DictionarySyntax
		| EmptySetSyntax
		| SetSyntax
		| TupleSyntax
		| RangeSyntax
		| ListRangeSyntax

	AtPutSyntax = Primary "[" NonemptyListOf<Expression, ","> "]" ":=" Expression
	AtSyntax = Primary "[" NonemptyListOf<Expression, ","> "]"
	AtAllSyntax = Primary "[" NonemptyListOf<(spanLiteral | ListSyntax), ","> "]"
	UncheckedSlotReadSyntax = Primary "::" recordKey
	UncheckedSlotWriteSyntax = Primary "::" recordKey ":=" Expression
	ValueApply = Primary "." ParameterList
	ParameterList = "(" ListOf<Expression, ","> ")"
	NonEmptyParameterList = "(" NonemptyListOf<Expression, ","> ")"

	DotExpressionWithTrailingClosuresSyntax = Primary "." selectorName NonEmptyParameterList? Block+
	DotExpressionWithTrailingRecordSyntax = Primary "." selectorName NonEmptyRecordSyntax+
	DotExpressionWithAssignmentSyntax = Primary "." selectorName ":=" Expression
	DotExpression = Primary ("." (selectorName | boundOperator) ~("{" | ":=") NonEmptyParameterList? ~("{" | "("))+

	Block = "{" Arguments? Temporaries? Primitive? Statements? "}"
	Arguments = argumentName+ "|"
	Primitive = "<primitive:" primitiveCharacter* ">"
	Statements = NonFinalExpression | FinalExpression
	NonFinalExpression = Expression ";" Statements
	FinalExpression = Expression

	ApplyWithTrailingClosuresSyntax = selectorName NonEmptyParameterList? Block+
	ApplyWithTrailingRecordSyntax = selectorName NonEmptyRecordSyntax+
	ApplySyntax = (selectorName | boundOperator) ParameterList
	ParenthesisedExpression = "(" Expression ")"
	NonEmptyRecordSyntax = "(" NonemptyListOf<RecordSyntaxItem, ","> ")"
	EmptyRecordSyntax = "(" ":" ")"
	RecordSyntaxItem = RecordKeyAssociation | StringAssociation
	RecordKeyAssociation = recordKeyToken Expression
	StringAssociation = singleQuotedStringLiteral ":" Expression
	RecordInitializerItem = recordKeyToken varName
	EmptyMapSyntax = "[" ":" "]"
	NonEmptyMapSyntax = "[" NonemptyListOf<MapSyntaxItem, ","> "]"
	MapSyntaxItem = Expression ":" Expression
	DictionarySyntax = "[|" ListOf<BinaryOperatorExpression, ","> "|]"
	EmptySetSyntax = "{|" "|}"
	SetSyntax = "{|" ListOf<Expression, ","> "|}"
	TupleSyntax = "(" NonemptyListOf<Expression, ","> ")"
	ListSyntax = "[" ListOf<Expression, ","> "]"
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
	VectorSyntaxUnarySend = (literal | identifier) "." (selectorName | boundOperator)
	MatrixSyntax = "[" NonemptyListOf<MatrixSyntaxItems, ";"> "]"
	MatrixSyntaxItems = VectorSyntaxItem*
	VolumeSyntax = "[" NonemptyListOf<VolumeSyntaxItems, ":;"> "]"
	VolumeSyntaxItems = NonemptyListOf<MatrixSyntaxItems, ";">

	argumentName = ":" varNameOrUnused
	unqualifiedIdentifier = letter letterOrDigit*
	negatedIdentifier = "-" lowercaseIdentifier
	arityQualifiedIdentifier = letter letterOrDigit* (":/" digit+)
	identifier = arityQualifiedIdentifier | unqualifiedIdentifier | negatedIdentifier
	methodName = unqualifiedIdentifier | operator
	selectorName = unqualifiedIdentifier
	unusedVariableIdentifier = "_"
	systemVariableIdentifier = "__SplVar" digit+
    uppercaseIdentifier = upper letterOrDigit*
	typeName = uppercaseIdentifier
	unqualifiedTraitName = uppercaseIdentifier
	qualifiedTraitName = "@" uppercaseIdentifier
    typeOrTraitName = typeName | qualifiedTraitName
    lowercaseIdentifier = lower letterOrDigit*
	varName = arityQualifiedIdentifier | lowercaseIdentifier | systemVariableIdentifier // arity branch should be lowercase
	varNameOrUnused = (varName | unusedVariableIdentifier)
	slotNameWithType = lowercaseIdentifier ":" "<" uppercaseIdentifier ">"
	slotName = lowercaseIdentifier
	constantName = lowercaseIdentifier
	recordKey = lowercaseIdentifier | uppercaseIdentifier
	recordKeyToken = recordKey ":"
	letterOrDigit = letter | digit
	reservedIdentifier = ("nil" | "true" | "false") ~letterOrDigit
	infixMethod = lowercaseIdentifier ":"
	operator = operatorChar+
	boundOperator = operatorChar+
	operatorWithAdverb = operatorWithBinaryAdverb | operatorWithUnaryAdverb
	operatorWithUnaryAdverb = operator "." selectorName
	operatorWithBinaryAdverb = operator "." selectorName "(" (operator | arityQualifiedIdentifier | numberLiteral) ")"
	operatorChar = "!" | "%" | "&" | "*" | "+" | "/" | "<" | "=" | ">" | "?" | "@" | "~" | "|" | "-" | "^" | "#" | "$" | "\\"
	plusOrMinus = "+" | "-"
    symbolicCharacterLiteral = "𝒂" | "𝒃" | "𝒄" | "𝒅" | "𝒆" | "𝒇" | "𝒈" | "𝒉" | "𝒊" | "𝒋" | "𝒌" | "𝒍" | "𝒎" | "𝒏" | "𝒐" | "𝒑" | "𝒒" | "𝒓" | "𝒔" | "𝒕" | "𝒖" | "𝒗" | "𝒘" | "𝒙" | "𝒚" | "𝒛"

	literal = spanLiteral | numberLiteral | singleQuotedStringLiteral | doubleQuotedStringLiteral | backtickQuotedStringLiteral | symbolicCharacterLiteral
	numberLiteral = decimalLiteral | scientificLiteral | complexLiteral | imaginaryLiteral | residueLiteral | floatLiteral | fractionLiteral | largeIntegerLiteral | radixIntegerLiteral | smallIntegerLiteral | infinityLiteral | nanLiteral
	spanLiteral = spanFromByToLiteral | spanFromToLiteral
	spanFromByToLiteral = integerLiteral ":" integerLiteral ":" (integerLiteral | identifier)
	spanFromToLiteral = integerLiteral ":" (integerLiteral | identifier)
	floatLiteral = plusOrMinus? digit+ "." digit+
	decimalLiteral = floatDecimalLiteral | integerDecimalLiteral
	floatDecimalLiteral = plusOrMinus? digit+ "." digit+ "D" (digit+)? // ("d" | "D")
	integerDecimalLiteral = plusOrMinus? digit+ "D" (digit+)? // ("d" | "D")
	scientificLiteral = integerOrFloatLiteral "E" integerLiteral // ("e" | "E")
	complexLiteral = integerOrFloatLiteral "J" integerOrFloatLiteral // ("j" | "J")
	imaginaryLiteral = integerOrFloatLiteral "I" // ("i" | "I")
	residueLiteral = integerLiteral "Z" digit+ // ("z" | "Z")
	fractionLiteral = plusOrMinus? digit+ "/" digit+
	largeIntegerLiteral = plusOrMinus? digit+ "L"
    radixDigit = digit | "A" | "B" | "C" | "D" | "E" | "F"
	radixIntegerLiteral = plusOrMinus? digit+ "r" radixDigit+
    infinityLiteral = plusOrMinus? "Infinity"
	nanLiteral = "NaN"
	smallIntegerLiteral = plusOrMinus? digit+
    integerLiteral = largeIntegerLiteral | radixIntegerLiteral | smallIntegerLiteral
    integerOrFloatLiteral = floatLiteral | integerLiteral
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
