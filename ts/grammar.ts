import ohm from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';
import { extras } from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';

export const slGrammarDefinition: string = String.raw`
Sl {

	TopLevel = LibraryExpression+ | Program
	LibraryExpression = TypeExpression | TraitExpression | ConstantDefinition
	TypeExpression = TypeExtension | TypeTypeExtension | TypeListExtension | HostTypeDefinition | TypeDefinition
	TypeExtension = "+" identifier "{" (methodName Block)* "}"
	TypeTypeExtension = "+" identifier "^" "{" (methodName Block)* "}"
	TypeListExtension = "+" "[" NonemptyListOf<identifier, ","> "]" "{" (methodName Block)* "}"
	HostTypeDefinition = identifier "!" TraitList? "{" Temporaries? (methodName Block)* "}"
	TypeDefinition = identifier TraitList? "{" Temporaries? (methodName Block)* "}"
	TraitList = ":" "[" NonemptyListOf<identifier, ","> "]"
	TraitExpression = TraitExtension | TraitListExtension | TraitDefinition
	TraitExtension = "+" "@" identifier "{" (methodName Block)* "}"
	TraitListExtension = "+" "@" "[" NonemptyListOf<identifier, ","> "]" "{" (methodName Block)* "}"
	TraitDefinition = "@" identifier "{" (methodName Block)* "}"
	ConstantDefinition = "Constant" "." unqualifiedIdentifier "=" literal
	Program = Temporaries? ListOf<Expression, ";">
	Temporaries = TemporariesWithoutInitializers | LetTemporary+
	TemporaryInitializer =
		TemporaryBlockLiteralInitializer |
		TemporaryExpressionInitializer |
		TemporaryDictionaryInitializer |
		TemporaryArrayInitializer
	TemporaryBlockLiteralInitializer = identifier "=" Block ~("." | binaryOperator)
	TemporaryExpressionInitializer = identifier "=" Expression
	TemporaryDictionaryInitializer = "(" NonemptyListOf<identifier, ","> ")" "=" Expression
	TemporaryArrayInitializer = "[" NonemptyListOf<identifierOrUnused, ","> "]" "=" Expression
	LetTemporary = "let" TemporaryInitializer ";"
	LetTemporaries = "let" NonemptyListOf<TemporaryInitializer, ","> ";"
	TemporariesWithoutInitializers = "|" identifier+ "|"

	Expression = Assignment | BinaryExpression | Primary
	Assignment = ScalarAssignment | ArrayAssignment | DictionaryAssignment // | AssignmentOperatorSyntax
	ScalarAssignment = identifier ":=" Expression
	ArrayAssignment = "[" NonemptyListOf<identifier, ","> "]" ":=" Expression
	DictionaryAssignment = "(" NonemptyListOf<identifier, ","> ")" ":=" Expression
	AssignmentOperatorSyntax = Primary operatorAssignment Expression
	BinaryExpression = Expression ((binaryOperatorWithAdverb | binaryOperator) Primary)+

	Primary
		= AtPutSyntax
		| QuotedAtPutSyntax
		// | AtPutDelegateSyntax
		// | WriteSlotSyntax
		// | AtIfAbsentSyntax
		| AtSyntax
		// | AtAllIntervalSyntax
		// | AtAllVectorSyntax
		// | AtAllArraySyntax
		// | AtPathPutSyntax
		// | AtMatrixSyntax
		// | AtVolumeSyntax
		// | AtPathSyntax
		// | QuotedAtIfAbsentSyntax
		// | QuotedAtIfAbsentPutSyntax
		| QuotedAtSyntax
		// | ReadSlotSyntax
		| ValueApply
		| DotExpressionWithTrailingClosuresSyntax
		| DotExpressionWithTrailingDictionariesSyntax
		// | DotExpressionWithTrailingArraysSyntax
		| DotExpressionWithAssignmentSyntax
		| DotExpression
		| Block
		| ApplyWithTrailingDictionariesSyntax
		| ApplyWithTrailingClosuresSyntax
		// | ApplyWithTrailingArraysSyntax
		| ApplySyntax
		| MessageSendSyntax
		| reservedIdentifier
		| literal
		| identifier
		| binaryOperator
		| VectorSyntax
		| MatrixSyntax
		| ParenthesisedExpression
		| DictionaryExpression
		| TupleExpression
		| ArrayExpression
		| ArrayIntervalSyntax
		| ArrayIntervalThenSyntax
		| IntervalSyntax
		| IntervalThenSyntax
		// | VolumeSyntax

	AtPutSyntax = Primary "[" NonemptyListOf<Expression, ","> "]" ":=" Expression
	QuotedAtPutSyntax = Primary "::" identifier ":=" Expression
	AtSyntax = Primary "[" NonemptyListOf<Expression, ","> "]"
	AtIfAbsentSyntax = Primary "[" Expression "]" ":?" Block
	AtIfAbsentPutSyntax = Primary "[" Expression "]" ":?=" Block
	AtAllArraySyntax = Primary "[" NonemptyListOf<Expression, ","> "]"
	AtAllVectorSyntax = Primary "[" VectorSyntaxItem+ "]"
	AtAllIntervalSyntax = Primary "[" Expression ".." Expression "]"
	AtMatrixSyntax = Primary "[" Expression ";" Expression "]"
	AtVolumeSyntax = Primary "[" Expression ";" Expression ";" Expression "]"
	AtPathPutSyntax = Primary "[" NonemptyListOf<Expression, ";"> "]" ":=" Expression
	AtPathSyntax = Primary "[" NonemptyListOf<Expression, ";"> "]"
	QuotedAtSyntax = Primary "::" identifier
	QuotedAtIfAbsentSyntax = Primary "::" identifier ":?" Block
	QuotedAtIfAbsentPutSyntax = Primary "::" identifier ":?=" Block
	AtPutDelegateSyntax = Primary ":." identifier ":=" Expression
	MessageSendSyntax = Primary ":." identifier NonEmptyParameterList?
	ReadSlotSyntax = Primary ":@" identifier
	WriteSlotSyntax = Primary ":@" identifier ":=" Expression
	ValueApply = Primary "." ParameterList
	ParameterList = "(" ListOf<Expression, ","> ")"
	NonEmptyParameterList = "(" NonemptyListOf<Expression, ","> ")"

	DotExpressionWithTrailingClosuresSyntax = Primary "." identifier NonEmptyParameterList? Block+
	DotExpressionWithTrailingDictionariesSyntax = Primary "." identifier NonEmptyParameterList? NonEmptyDictionaryExpression+
	//DotExpressionWithTrailingArraysSyntax = Primary "." identifier NonEmptyParameterList? ArrayExpression+
	DotExpressionWithAssignmentSyntax = Primary "." identifier ":=" Expression
	DotExpression = Primary ("." identifier ~("{" | ":=") NonEmptyParameterList?~("{"))+

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
	//ApplyWithTrailingArraysSyntax = identifier NonEmptyParameterList? ArrayExpression+
	ApplySyntax = identifier ParameterList
	ParenthesisedExpression = "(" Expression ")"
	NonEmptyDictionaryExpression = "(" NonemptyListOf<AssociationExpression, ","> ")"
	DictionaryExpression = "(" ListOf<AssociationExpression, ","> ")"
	AssociationExpression = IdentifierAssociation | StringAssociation
	IdentifierAssociation = identifier ":" Expression
	StringAssociation = singleQuotedStringLiteral ":" Expression
	TupleExpression = "(" NonemptyListOf<Expression, ","> ")"
	ArrayExpression = "[" ListOf<Expression, ","> "]"
	ArrayIntervalSyntax = "[" Expression ".." Expression "]"
	ArrayIntervalThenSyntax = "[" Expression "," Expression ".." Expression "]"
	IntervalSyntax = "(" Expression ".." Expression ")"
	IntervalThenSyntax = "(" Expression "," Expression ".." Expression ")"
	VectorSyntax = "[" VectorSyntaxItem+ "]"
	VectorSyntaxItem = VectorSyntaxUnarySend | literal | reservedIdentifier | identifier | VectorSyntax | MatrixSyntax
	VectorSyntaxUnarySend = (literal | identifier) "." identifier
	VectorSyntaxRange = integerLiteral ".." integerLiteral // ?
	MatrixSyntax = "[" NonemptyListOf<MatrixSyntaxItems, ";"> "]"
	MatrixSyntaxItems = VectorSyntaxItem+
	VolumeSyntax = "[" NonemptyListOf<VolumeSyntaxItems, ";;"> "]"
	VolumeSyntaxItems = NonemptyListOf<MatrixSyntaxItems, ";">

	methodName = identifier | binaryOperator
	unqualifiedIdentifier = letter letterOrDigit*
	arityQualifiedIdentifier = letter letterOrDigit* (":/" digit+)
	identifier = arityQualifiedIdentifier | unqualifiedIdentifier
	unusedVariableIdentifier = "_"
	identifierOrUnused = (identifier | unusedVariableIdentifier)
	letterOrDigit = letter | digit
	reservedIdentifier = "nil" | "true" | "false"
	binaryOperator = binaryChar+
	binaryOperatorWithAdverb = binaryOperator "." identifier
	binaryChar = "!" | "%" | "&" | "*" | "+" | "/" | "<" | "=" | ">" | "?" | "@" | "~" | "|" | "-" | "^" | "#" | "$" | "\\"
	operatorAssignment = binaryChar ":" "="

	literal = /* integerIntervalLiteral | */ numberLiteral | singleQuotedStringLiteral | doubleQuotedStringLiteral | backtickQuotedStringLiteral
	numberLiteral = scientificLiteral | floatLiteral | fractionLiteral | largeIntegerLiteral | radixIntegerLiteral | integerLiteral | constantNumberLiteral
	// integerIntervalLiteral = integerLiteral "..." integerLiteral
	floatLiteral = "-"? digit+ "." digit+
	scientificLiteral = (floatLiteral | integerLiteral) "e" integerLiteral
	fractionLiteral = "-"? digit+ ":" digit+
	largeIntegerLiteral = "-"? digit+ "n"
	radixIntegerLiteral = "-"? digit+ "r" letterOrDigit+
	constantNumberLiteral = "Infinity" | "NaN"
	integerLiteral = "-"? digit+
	singleQuotedStringLiteral = "\'" (~"\'" ("\\\'" | "\\\\" | sourceCharacter))* "\'"
	doubleQuotedStringLiteral = "\"" (~"\"" ("\\\"" | "\\\\" | sourceCharacter))* "\""
	backtickQuotedStringLiteral = backtickCharacter (~backtickCharacter sourceCharacter)* backtickCharacter
	backtickCharacter = "${String.fromCodePoint(96)}"
	sourceCharacter = any

	primitiveCharacter = ~">" sourceCharacter

	comment = multiLineHsComment | singleLineHsComment
	multiLineMlComment = "(*" (~"*)" sourceCharacter)* "*)"
	singleLineMlComment = "(*)" (~lineTerminator sourceCharacter)*
	multiLineHsComment = "{-" (~"-}" sourceCharacter)* "-}"
	singleLineHsComment = "--" (~lineTerminator sourceCharacter)*
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
