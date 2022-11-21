// @ts-nocheck

import ohm from 'https://unpkg.com/ohm-js@16/dist/ohm.esm.js';
import { extras } from 'https://unpkg.com/ohm-js@16/dist/ohm.esm.js';

export const slGrammar = ohm.grammar(String.raw`
Sl {

    TopLevel = LibraryExpression+ | Program
    LibraryExpression = ClassExpression | TraitExpression
    ClassExpression = ClassExtension | ClassDefinition
    ClassExtension = "+" identifier "{" (methodName Block)* "}"
    ClassDefinition = identifier TraitList? "{" Temporaries? (methodName Block)* "}"
    TraitList = ":" "[" NonemptyListOf<identifier, ","> "]"
    TraitExpression = TraitExtension | TraitDefinition
    TraitExtension = "+" "@" identifier "{" (methodName Block)* "}"
    TraitDefinition = "@" identifier "{" (methodName Block)* "}"
    Program = Temporaries? ExpressionSequence
    Temporaries = TemporariesWithInitializers | TemporariesWithoutInitializers | TemporariesVarSyntax+
    TemporariesWithInitializers = "|" NonemptyListOf<TemporaryWithInitializer, ","> ";" "|"
    TemporaryWithInitializer = TemporaryWithIdentifierInitializer | TemporaryWithDictionaryInitializer | TemporaryWithArrayInitializer
    TemporaryWithIdentifierInitializer = identifier "=" Expression
    TemporaryWithDictionaryInitializer = "("  NonemptyListOf<identifier, ","> ")" "=" Expression
    TemporaryWithArrayInitializer = "["  NonemptyListOf<identifier, ","> "]" "=" Expression
    TemporariesWithoutInitializers = "|" identifier+ "|"
    TemporariesVarSyntax = "var" NonemptyListOf<(TemporaryWithInitializer | identifier), ","> ";"

    ExpressionSequence = ListOf<Expression, ";">
    Expression = Assignment | BinaryExpression | Primary
    Assignment = identifier ":=" Expression
    BinaryExpression = Expression (binaryOperator Primary)+

    Primary
      = PutSyntax
      | PutQuotedSyntax
      | AtSyntax
      | AtQuotedSyntax
      | ValueSyntax
      | DotExpressionWithTrailingClosuresSyntax
      | DotExpressionWithAssignmentSyntax
      | DotExpression
      | ImplicitDictionaryPutSyntax
      | ImplicitDictionaryAtSyntax
      | Block
      | ApplyWithTrailingClosuresSyntax
      | Apply
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

    PutSyntax = Primary "[" Expression "]" ":=" Expression
    PutQuotedSyntax = Primary "::" identifier ":=" Expression
    AtSyntax = Primary "[" Expression "]"
    AtQuotedSyntax = Primary "::" identifier
    ValueSyntax = Primary "." NonEmptyParameterList
    NonEmptyParameterList =  "(" NonemptyListOf<Expression, ","> ")"

    DotExpressionWithTrailingClosuresSyntax = Primary "." identifier NonEmptyParameterList? Block+
    DotExpressionWithAssignmentSyntax = Primary "." identifier ":=" Expression
    DotExpression = Primary ("." identifier ~("{" | ":=") NonEmptyParameterList?)+

    ImplicitDictionaryPutSyntax = "::" identifier ":=" Expression
    ImplicitDictionaryAtSyntax = "::" identifier

    Block = "{" BlockBody "}"
    BlockBody = Arguments? Temporaries? Primitive? Statements?
    Arguments = ArgumentList | ArgumentListArgSyntax
    ArgumentList = ArgumentName+ "|"
    ArgumentName = ":" identifier
    ArgumentListArgSyntax = "arg" NonemptyListOf<identifier, ","> ";"
    Primitive = "<primitive:" primitiveCharacter* ">"
    Statements = NonFinalExpression | FinalExpression
    NonFinalExpression = Expression ";" Statements
    FinalExpression = Expression ";"?

    ApplyWithTrailingClosuresSyntax = Primary NonEmptyParameterList? Block+
    Apply = Primary ParameterList
    ParameterList =  "(" ListOf<Expression, ","> ")"
    ParenthesisedExpression = "(" Expression ")"
    DictionaryExpression = "(" ListOf<AssociationExpression, ","> ")"
    AssociationExpression = identifier ":" Expression
    ArrayExpression = "[" ListOf<Expression, ","> "]"
    ArrayRangeSyntax = "[" Expression ".." Expression "]"
    ArrayRangeThenSyntax = "[" Expression "," Expression ".." Expression "]"
    IntervalSyntax = "(" Expression ".." Expression ")"
    IntervalThenSyntax = "(" Expression "," Expression ".." Expression ")"

    methodName = identifier | binaryOperator
    identifier = letter letterOrDigitOrUnderscore*
    letterOrDigitOrUnderscore = letter | digit | "_"
    reservedIdentifier = "nil" | "true" | "false"
    binaryOperator = binaryChar+
    binaryChar = "!" | "%" | "&" | "*" | "+" | "/" | "<" | "=" | ">" | "?" | "@" | "~" | "|" | "-" | "^" | "#" | "$"

    literal = numberLiteral | singleQuotedStringLiteral | doubleQuotedStringLiteral | backtickQuotedStringLiteral
    numberLiteral = floatLiteral | integerLiteral
    floatLiteral = "-"? digit+ "." digit+
    integerLiteral = "-"? digit+
    singleQuotedStringLiteral = "\'" (~"\'" sourceCharacter)* "\'"
    doubleQuotedStringLiteral = "\"" (~"\"" sourceCharacter)* "\""
    backtickQuotedStringLiteral = backtickCharacter (~backtickCharacter sourceCharacter)* backtickCharacter
    backtickCharacter = "${String.fromCodePoint(96)}"
    sourceCharacter = any

    primitiveCharacter = ~">" sourceCharacter

    comment = multiLineCComment | singleLineCppComment
    multiLineMlComment = "(*" (~"*)" sourceCharacter)* "*)"
    singleLineLispComment = ";;" (~lineTerminator sourceCharacter)*
    multiLineCComment = "/*" (~"*/" sourceCharacter)* "*/"
    singleLineCppComment = "//" (~lineTerminator sourceCharacter)*
    lineTerminator = "\n" | "\r"
    space += comment

}
`);

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
import * as sl from './sl-grammar.js'
sl.temporariesKeywordNames('var i, j;') //= ['i', 'j']
sl.temporariesSyntaxNames('| i j |') //= ['i', 'j']
sl.blockArity('{ arg i, j; i + 1 * j }') === 2
*/
