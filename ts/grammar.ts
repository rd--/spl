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
	// ConstantDefinition = "Constant" "." constantName "=" literal
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
	// LetTemporaries = "let" NonemptyListOf<Initializer, ","> ";"
	VarTemporaries = "var" NonemptyListOf<varName, ","> ";"

	Expression = Assignment | BinaryExpression | Primary
	Assignment = ScalarAssignment | ListAssignment | DictionaryAssignment // | AssignmentOperatorSyntax
	ScalarAssignment = varName ":=" Expression
	ListAssignment = "[" NonemptyListOf<varName, ","> "]" ":=" Expression
	DictionaryAssignment = "(" NonemptyListOf<KeyVarNameAssociation, ","> ")" ":=" Expression
	// AssignmentOperatorSyntax = Primary operatorAssignment Expression
	BinaryExpression = BinaryOperatorExpression | BinaryAdverbExpression
	BinaryOperatorExpression = Expression (operator Primary)+
	BinaryAdverbExpression = Expression (operatorWithAdverb Primary)+

	Primary
		= AtPutSyntax
		| QuotedAtPutSyntax
		// | AtPutDelegateSyntax
		// | WriteSlotSyntax
		// | AtIfAbsentSyntax
		| AtAllSyntax
		| AtSyntax
		// | QuotedAtIfAbsentSyntax
		// | QuotedAtIfAbsentPutSyntax
		| QuotedAtSyntax
		// | ReadSlotSyntax
		| ValueApply
		| DotExpressionWithTrailingDictionarySyntax
		| DotExpressionWithTrailingClosuresSyntax
		| DotExpressionWithAssignmentSyntax
		| DotExpression
		| Block
		| ApplyWithTrailingDictionarySyntax
		| ApplyWithTrailingClosuresSyntax
		| ApplySyntax
		// | MessageSendSyntax
		| EmptyListSyntax
		| reservedIdentifier
		| literal
		| identifier
        | systemVariableIdentifier // ?
		| operator
		| VectorSyntax
		// | UnaryListSyntax // MUST FOLLOW VECTOR SYNTAX, CANNOT!
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
	// AtIfAbsentSyntax = Primary "[" Expression "]" ":?" Block
	// AtIfAbsentPutSyntax = Primary "[" Expression "]" ":?=" Block
	QuotedAtSyntax = Primary "::" keyName
	// QuotedAtIfAbsentSyntax = Primary "::" keyName ":?" Block
	// QuotedAtIfAbsentPutSyntax = Primary "::" keyName ":?=" Block
	// AtPutDelegateSyntax = Primary ":." keyName ":=" Expression
	// MessageSendSyntax = Primary ":." keyName NonEmptyParameterList?
	// ReadSlotSyntax = Primary ":@" slotName
	// WriteSlotSyntax = Primary ":@" slotName ":=" Expression
	ValueApply = Primary "." ParameterList
	ParameterList = "(" ListOf<Expression, ","> ")"
	NonEmptyParameterList = "(" NonemptyListOf<Expression, ","> ")"

	DotExpressionWithTrailingClosuresSyntax = Primary "." selectorName NonEmptyParameterList? Block+
	DotExpressionWithTrailingDictionarySyntax = Primary "." selectorName NonEmptyDictionaryExpression+
	DotExpressionWithAssignmentSyntax = Primary "." selectorName ":=" Expression
	DotExpression = Primary ("." (selectorName | boundOperator) ~("{" | ":=") NonEmptyParameterList? ~("{" | "("))+

	Block = "{" Arguments? Temporaries? Primitive? Statements? "}"
	Arguments = ArgumentName+ "|"
	ArgumentName = ":" varNameOrUnused
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
	NameAssociation = keyName ":" Expression
	KeyVarNameAssociation = keyName ":" varName
	StringAssociation = singleQuotedStringLiteral ":" Expression
	TupleExpression = "(" NonemptyListOf<Expression, ","> ")"
	ListExpression = "[" ListOf<Expression, ","> "]"
	ListRangeSyntax = "[" Expression ".." Expression "]"
	ListRangeThenSyntax = "[" Expression "," Expression ".." Expression "]"
	RangeSyntax = "(" Expression ".." Expression ")"
	RangeThenSyntax = "(" Expression "," Expression ".." Expression ")"
	EmptyListSyntax = "[" "]"
    // UnaryListSyntax = "[" Expression "]"
	VectorSyntax = "[" VectorSyntaxItem+ "]"
	VectorSyntaxItem = VectorSyntaxUnarySend | literal | reservedIdentifier | varName
	VectorSyntaxUnarySend = (literal | varName) "." selectorName
	MatrixSyntax = "[" NonemptyListOf<MatrixSyntaxItems, ";"> "]"
	MatrixSyntaxItems = VectorSyntaxItem*
	VolumeSyntax = "[" NonemptyListOf<VolumeSyntaxItems, ":;"> "]"
	VolumeSyntaxItems = NonemptyListOf<MatrixSyntaxItems, ";">
	// TreeSyntax = "[" TreeSyntaxItem+ "]"
	// TreeSyntaxItem = VectorSyntaxItem | TreeSyntax

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
	letterOrDigit = letter | digit
	reservedIdentifier = ("nil" | "true" | "false") ~letterOrDigit
	infixMethod = lowercaseIdentifier ":"
	operator = operatorChar+
	boundOperator = operatorChar+
	operatorWithAdverb = operatorWithBinaryAdverb | operatorWithUnaryAdverb
	operatorWithUnaryAdverb = (operator | lowercaseIdentifier) "." selectorName
	operatorWithBinaryAdverb = (operator | lowercaseIdentifier) "." selectorName "(" (operator | arityQualifiedIdentifier | numberLiteral) ")"
	operatorChar = "!" | "%" | "&" | "*" | "+" | "/" | "<" | "=" | ">" | "?" | "@" | "~" | "|" | "-" | "^" | "#" | "$" | "\\"
	operatorAssignment = operatorChar ":" "="
	plusOrMinus = "+" | "-"

	literal = rangeLiteral | numberLiteral | singleQuotedStringLiteral | doubleQuotedStringLiteral | backtickQuotedStringLiteral
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
	largeIntegerLiteral = plusOrMinus? digit+ "L" // "n"?
    radixDigit = digit | "A" | "B" | "C" | "D" | "E" | "F"
	radixIntegerLiteral = plusOrMinus? digit+ "r" radixDigit+
    infinityLiteral = plusOrMinus? "Infinity"
	nanLiteral = "NaN"
	// constantNumberLiteral = "Pi"
	integerLiteral = plusOrMinus? digit+
    integerOrFloatLiteral = floatLiteral | integerLiteral
	singleQuotedStringLiteral = "\'" (~"\'" ("\\\'" | "\\\\" | sourceCharacter))* "\'"
	doubleQuotedStringLiteral = "\"" (~"\"" ("\\\"" | "\\\\" | sourceCharacter))* "\""
	backtickQuotedStringLiteral = backtickCharacter (~backtickCharacter sourceCharacter)* backtickCharacter
	backtickCharacter = "${String.fromCodePoint(96)}"
	sourceCharacter = any

	primitiveCharacter = ~(">\n" | "> }") sourceCharacter

	comment = multiLineCComment
	// multiLineMlComment = "(*" (~"*)" sourceCharacter)* "*)"
	// singleLineMlComment = "(*)" (~lineTerminator sourceCharacter)*
	// multiLineHsComment = "{-" (~"-}" sourceCharacter)* "-}"
	multiLineCComment = "/*" (~"*/" sourceCharacter)* "*/"
	// singleLineHsComment = "--" (~lineTerminator sourceCharacter)*
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
