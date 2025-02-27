import ohm from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';
import { extras } from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';

export const slGrammarDefinition: string = String.raw`
Sl {

	TopLevel = LibraryExpression+ | Program
	LibraryExpression = TypeDefinition | TraitDefinition | MethodDefinitions | LibraryItem | TypeExtension | TraitExtension
	TypeDefinition = typeName "!"? TraitList "{" SlotNames? (methodName Block)* "}"
	TypeExtension = "+" typeName "{" (methodName Block)* "}"
	MethodDefinitions = "+" "[" NonemptyListOf<typeOrTraitName, ","> "]" "{" (methodName Block)* "}"
	SlotNames = "|" slotName+ "|"
	TraitList = ":" "[" ListOf<unqualifiedTraitName, ","> "]"
	TraitExtension = "+" qualifiedTraitName "{" (methodName Block)* "}"
	TraitDefinition = qualifiedTraitName "{" (methodName Block)* "}"
	LibraryItem = LibraryItemLiteral | LibraryItemExpression
	LibraryItemLiteral = "LibraryItem" DictionaryExpression
	LibraryItemExpression = "LibraryItem" ApplySyntax
	Program = Temporaries? ListOf<Expression, ";">
	Temporaries = VarTemporaries | LetTemporary+
	Initializer =
		BlockLiteralInitializer |
		ExpressionInitializer |
		DictionaryInitializer |
		ListInitializer
	BlockLiteralInitializer = varName "=" Block ~("." | operator)
	ExpressionInitializer = varNameOrUnused "=" Expression
	DictionaryInitializer = "(" NonemptyListOf<KeyVarNameAssociation, ","> ")" "=" Expression
	ListInitializer = "[" NonemptyListOf<varNameOrUnused, ","> "]" "=" Expression
	LetTemporary = "let" Initializer ";"
	VarTemporaries = "var" NonemptyListOf<varName, ","> ";"

	Expression = Assignment | BinaryExpression | Primary
	Assignment = ScalarAssignment | ListAssignment | DictionaryAssignment
	ScalarAssignment = varName ":=" Expression
	ListAssignment = "[" NonemptyListOf<varName, ","> "]" ":=" Expression
	DictionaryAssignment = "(" NonemptyListOf<KeyVarNameAssociation, ","> ")" ":=" Expression
	BinaryExpression = BinaryOperatorExpression | BinaryAdverbExpression
	BinaryOperatorExpression = Expression (operator Primary)+
	BinaryAdverbExpression = Expression (operatorWithAdverb Primary)+

	Primary
		= AtPutSyntax
		| QuotedAtPutSyntax
		| AtAllSyntax
		| AtSyntax
		| QuotedAtSyntax
		| ValueApply
		| DotExpressionWithTrailingDictionarySyntax
		| DotExpressionWithTrailingClosuresSyntax
		| DotExpressionWithAssignmentSyntax
		| DotExpression
		| Block
		| ApplyWithTrailingDictionarySyntax
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
		| ListExpression
		| ParenthesisedExpression
		| DictionaryExpression
		| TupleExpression
		| ListRangeSyntax
		| ListRangeThenSyntax
		| RangeSyntax
		| RangeThenSyntax

	AtPutSyntax = Primary "[" NonemptyListOf<Expression, ","> "]" ":=" Expression
	QuotedAtPutSyntax = Primary "::" keyName ":=" Expression
	AtSyntax = Primary "[" NonemptyListOf<Expression, ","> "]"
	AtAllSyntax = Primary "[" NonemptyListOf<(rangeLiteral | ListExpression), ","> "]"
	QuotedAtSyntax = Primary "::" keyName
	ValueApply = Primary "." ParameterList
	ParameterList = "(" ListOf<Expression, ","> ")"
	NonEmptyParameterList = "(" NonemptyListOf<Expression, ","> ")"

	DotExpressionWithTrailingClosuresSyntax = Primary "." selectorName NonEmptyParameterList? Block+
	DotExpressionWithTrailingDictionarySyntax = Primary "." selectorName NonEmptyDictionaryExpression+
	DotExpressionWithAssignmentSyntax = Primary "." selectorName ":=" Expression
	DotExpression = Primary ("." (selectorName | boundOperator) ~("{" | ":=") NonEmptyParameterList? ~("{" | "("))+

	Block = "{" Arguments? Temporaries? Primitive? Statements? "}"
	Arguments = argumentName+ "|"
	Primitive = "<primitive:" primitiveCharacter* ">"
	Statements = NonFinalExpression | FinalExpression
	NonFinalExpression = Expression ";" Statements
	FinalExpression = Expression

	ApplyWithTrailingClosuresSyntax = selectorName NonEmptyParameterList? Block+
	ApplyWithTrailingDictionarySyntax = selectorName NonEmptyDictionaryExpression+
	ApplySyntax = (selectorName | boundOperator) ParameterList
	ParenthesisedExpression = "(" Expression ")"
	NonEmptyDictionaryExpression = "(" NonemptyListOf<AssociationExpression, ","> ")"
	DictionaryExpression = "(" ListOf<AssociationExpression, ","> ")"
	AssociationExpression = NameAssociation | StringAssociation
	NameAssociation = keyNameToken Expression
	KeyVarNameAssociation = keyNameToken varName
	StringAssociation = singleQuotedStringLiteral ":" Expression
	TupleExpression = "(" NonemptyListOf<Expression, ","> ")"
	ListExpression = "[" ListOf<Expression, ","> "]"
	ListRangeSyntax = "[" Expression ".." Expression "]"
	ListRangeThenSyntax = "[" Expression "," Expression ".." Expression "]"
	RangeSyntax = "(" Expression ".." Expression ")"
	RangeThenSyntax = "(" Expression "," Expression ".." Expression ")"
	EmptyListSyntax = "[" "]"
	VectorSyntax = "[" VectorSyntaxItem+ "]"
	VectorSyntaxItem = VectorSyntaxUnarySend | literal | reservedIdentifier | varName
	VectorSyntaxUnarySend = (literal | varName) "." selectorName
	MatrixSyntax = "[" NonemptyListOf<MatrixSyntaxItems, ";"> "]"
	MatrixSyntaxItems = VectorSyntaxItem*
	VolumeSyntax = "[" NonemptyListOf<VolumeSyntaxItems, ":;"> "]"
	VolumeSyntaxItems = NonemptyListOf<MatrixSyntaxItems, ";">

	argumentName = ":" varNameOrUnused
	unqualifiedIdentifier = letter letterOrDigit*
	arityQualifiedIdentifier = letter letterOrDigit* (":/" digit+)
	identifier = arityQualifiedIdentifier | unqualifiedIdentifier
	methodName = unqualifiedIdentifier | operator
	selectorName = unqualifiedIdentifier
	unusedVariableIdentifier = "_"
	systemVariableIdentifier = "__SPL" digit+
    uppercaseIdentifier = upper letterOrDigit*
	typeName = uppercaseIdentifier
	unqualifiedTraitName = uppercaseIdentifier
	qualifiedTraitName = "@" uppercaseIdentifier
    typeOrTraitName = typeName | qualifiedTraitName
    lowercaseIdentifier = lower letterOrDigit*
	varName = arityQualifiedIdentifier | lowercaseIdentifier | systemVariableIdentifier // arity branch should be lowercase
	varNameOrUnused = (varName | unusedVariableIdentifier)
	slotName = lowercaseIdentifier
	constantName = lowercaseIdentifier
	keyName = lowercaseIdentifier | uppercaseIdentifier
	keyNameToken = keyName ":"
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

	literal = rangeLiteral | numberLiteral | singleQuotedStringLiteral | doubleQuotedStringLiteral | backtickQuotedStringLiteral | symbolicCharacterLiteral
	numberLiteral = decimalLiteral | scientificLiteral | complexLiteral | residueLiteral | floatLiteral | fractionLiteral | largeIntegerLiteral | radixIntegerLiteral | integerLiteral | infinityLiteral | nanLiteral
	rangeLiteral = rangeFromByToLiteral | rangeFromToLiteral
	rangeFromByToLiteral = integerLiteral ":" integerLiteral ":" (integerLiteral | identifier)
	rangeFromToLiteral = integerLiteral ":" (integerLiteral | identifier)
	floatLiteral = plusOrMinus? digit+ "." digit+
	decimalLiteral = floatDecimalLiteral | integerDecimalLiteral
	floatDecimalLiteral = plusOrMinus? digit+ "." digit+ "D" // ("d" | "D")
	integerDecimalLiteral = plusOrMinus? digit+ "D" // ("d" | "D")
	scientificLiteral = integerOrFloatLiteral "E" integerLiteral // ("e" | "E")
	complexLiteral = integerOrFloatLiteral "J" integerOrFloatLiteral // ("j" | "J")
	residueLiteral = integerLiteral "Z" digit+ // ("z" | "Z")
	fractionLiteral = plusOrMinus? digit+ "/" digit+
	largeIntegerLiteral = plusOrMinus? digit+ "L"
    radixDigit = digit | "A" | "B" | "C" | "D" | "E" | "F"
	radixIntegerLiteral = plusOrMinus? digit+ "r" radixDigit+
    infinityLiteral = plusOrMinus? "Infinity"
	nanLiteral = "NaN"
	integerLiteral = plusOrMinus? digit+
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
