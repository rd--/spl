import ohm from 'https://unpkg.com/ohm-js@17.1.0/dist/ohm.esm.js';

import { slParse, slSemantics } from './grammar.ts';

import * as rewrite from './rewrite-shared.ts';

export type SlAst = (string | SlAst)[];

const asAst: ohm.ActionDict<SlAst> = {
	ApplySyntax(rcv, arg) {
		return ['Apply', rcv.asAst].concat(arg.asAst.flat(1));
	},
	ArgumentsWithoutAnnotations(a, _p) {
		return ['Arguments'].concat(
			a.children.map((x) => x.asAst),
		);
	},
	Primitive(_l, s, _r) {
		return ['Primitive', s.sourceString];
	},
	BlockWithoutAnnotations(_l, arg, prm, stm, _r) {
		return ['Block'].concat(
			[
				arg.asAst,
				prm.asAst,
				stm.asAst.flat(1),
			].flat(1),
		);
	},
	EmptyListSyntax(_l, _r) {
		return ['List'];
	},
	ExpressionInitializer(name, _equals, exp) {
		return [name.asAst, exp.asAst];
	},
	FinalStatement(e) {
		return e.asAst;
	},
	LetBinding(_l, tmp) {
		return ['Let', tmp.asAst].flat(1);
	},
	NonEmptyListSyntax(_l, items, _r) {
		return ['List'].concat(items.children.map((x) => x.asAst).flat(1));
	},
	NonEmptyParameterList(_l, sq, _r) {
		return sq.children.map((x) => x.asAst);
	},
	NonFinalStatement(e, _semicolon) {
		return e.asAst;
	},
	ParameterList(_l, sq, _r) {
		return sq.children.map((x) => x.asAst);
	},
	ParenthesisedExpression(_left, e, _right) {
		return e.asAst;
	},
	Program(tmp, stm) {
		return ['Program', tmp.asAst.flat(1), stm.asAst].flat(1);
	},
	ScalarAssignment(lhs, _colonEquals, rhs) {
		return ['Assignment', [lhs.asAst], [rhs.asAst]].flat(1);
	},
	Statements(nonFinal, final) {
		return nonFinal.children.map((x) => x.asAst).concat([final.asAst]);
	},

	argumentName(_, x) {
		return ['Identifier', x.sourceString];
	},
	arityQualifiedIdentifier(c1, cN, ip, _solidus, a) {
		return [
			'Identifier',
			`${rewrite.rewriteInPlaceName(c1, cN, ip)}/${a.sourceString}`,
		];
	},
	floatLiteral(s, i, _, f, _f) {
		const x = s.sourceString + i.sourceString + '.' + f.sourceString;
		return ['Float', x];
	},
	infinityLiteral(s, i) {
		return ['Float', s.sourceString + i.sourceString];
	},
	smallIntegerLiteral(s, i) {
		return ['SmallInteger', s.sourceString + i.sourceString];
	},
	largeIntegerLiteral(s, i, _l) {
		return ['Integer', s.sourceString + i.sourceString + 'L'];
	},
	lowercaseIdentifier(c1, cN, ip) {
		return ['Identifier', rewrite.rewriteInPlaceName(c1, cN, ip)];
	},
	nanLiteral(_n) {
		return ['Float', 'NaN'];
	},
	reservedIdentifier(x) {
		return ['ReservedIdentifier', x.sourceString];
	},
	scientificLiteral(b, _letterE, e) {
		return ['Float', b.sourceString + 'E' + e.sourceString];
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return ['String', s.sourceString];
	},
	unqualifiedIdentifier(c1, cN, ip) {
		return ['Identifier', rewrite.rewriteInPlaceName(c1, cN, ip)];
	},
	uppercaseIdentifier(c1, cN) {
		return ['Identifier', c1.sourceString + cN.sourceString];
	},

	EmptyListOf() {
		return [];
	},
	NonemptyListOf(p, _s, q) {
		const rest = q.children;
		if (rest.length === 0) {
			return [p.asAst];
		}
		return [p.asAst].concat(rest.map((c) => c.asAst));
	},

	_iter(...children) {
		return children.map((c) => c.asAst);
	},
	_terminal() {
		return this.asAst;
	},
};

slSemantics.addAttribute('asAst', asAst);

export function rewriteSlToAst(slText: string): SlAst {
	const slCoreText = slParse(slText).asSl;
	const slAst = slParse(slCoreText).asAst;
	return slAst;
}
