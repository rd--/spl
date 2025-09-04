import ohm from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';

import { arraySum } from '../lib/jssc3/ts/kernel/array.ts';

import { slParse, slSemantics } from './grammar.ts';
import { resolveMethodName } from './operator.ts';
import { slOptions } from './options.ts';

export const context = { packageName: 'UnknownPackage' };

function genName(name: string, arity: number): string {
	return `${resolveMethodName(name)}_${arity}`;
}

function clearLeadingZeroes(s: string): string {
	return s.replace(/^0+(?!\.|$)/, '');
}

function genArityCheck(k: number, a: string): string {
	return [
		'/* ArityCheck */',
		`if(arguments.length !== ${k}) {`,
		`	const errorMessage = 'Arity: expected ${k}, ${a}';`,
		'	throw new Error(errorMessage);',
		'}',
	].join('\n');
}

function rewriteMethodList(n: ohm.Node, b: ohm.Node): string[] {
	const nArray = n.children;
	const bArray = b.children;
	const k = nArray.length;
	const answer = [];
	for (let i = 0; i < k; i++) {
		answer.push('\t' + nArray[i].sourceString + ' ' + bArray[i].asSl);
	}
	return answer;
}

function rewriteTypeOrTraitExtension(
	t: ohm.Node,
	n: ohm.Node,
	b: ohm.Node,
): string {
	const begin = `+[${t.sourceString}] {`;
	const middle = rewriteMethodList(n, b);
	const end = '}\n';
	return [begin, middle, end].flat().join('\n');
}

// Spl allows both + and - as prefixes to number literals.
// This functions removes +, retains -, and reports errors.
function validateSign(x: string): string {
	if (x === '+') {
		return '';
	}
	if (x === '-') {
		return x;
	}
	if (x === '') {
		return x;
	}
	throw new Error('validateSign: invalid sign: ' + x);
}

function genRecordAssignmentSlots(
	withLet: boolean,
	rhsDictionaryName: string,
	keyVarNamesArray: string[],
) {
	const slots = keyVarNamesArray.map(
		function (keyVarNames) {
			const maybeLet = withLet ? 'let ' : '';
			const bindingOperator = withLet ? '=' : ':=';
			const keyName = keyVarNames[0];
			const varName = keyVarNames[1];
			return `${maybeLet}${varName} ${bindingOperator} at(${rhsDictionaryName}, '${keyName}')`;
		},
	).join('; ');
	return slots;
}

function quoteNewLines(input: string): string {
	return input.replaceAll('\n', '\\n');
}

function makeTypeDefinition(
	isHostType: boolean,
	typeName: string,
	traits: string,
	instanceVariables: string,
	methodNames: string[],
	methodBlocks: ohm.Node[],
): string {
	// console.debug(`makeTypeDefinition: ${isHostType} ${typeName} ${instanceVariables}`);
	const instanceVariablesList = instanceVariables.split(' ');
	const traitList = traits.split(', ').filter((each) => each.length > 0);
	const addType = `
sl.addType(
	${isHostType},
	'${typeName}',
	'${context.packageName}',
	[${traits}],
	[${instanceVariablesList}]
);`;
	const copyTraits = traitList.map((traitName) => `
sl.copyTraitMethodsToType(
	${traitName},
	'${typeName}'
);`).join('\n');
	const addMethods = makeMethodList(
		'addMethodToExistingType',
		[typeName],
		methodNames,
		methodBlocks,
	);
	return `${addType}\n\n${copyTraits}\n\n${addMethods}\n`;
}

const asJs: ohm.ActionDict<string> = {
	ApplySyntax(rcv, arg) {
		return `${genName(rcv.asJs, arg.arityOf)}(${arg.asJs})`;
	},
	Arguments(arg, _vb) {
		return commaListJs(arg.children);
	},
	Block(_l, arg, tmp, prm, stm, _r) {
		const argJs = arg.asJs;
		const tmpJs = tmp.asJs;
		const prmJs = prm.asJs;
		const stmJs = stm.asJs;
		let arityCheck = '';
		if (slOptions.insertArityCheck) {
			arityCheck = genArityCheck(arg.arityOf, arg.asJs);
		}
		return [
			`sl.annotateFunction(function(${argJs}) {\n`,
			arityCheck,
			(tmpJs.length > 0) ? ('/* Temporaries */\n' + tmpJs + '\n') : '',
			(prmJs.length > 0) ? ('/* Primitive */\n' + prmJs + '\n') : '',
			(stmJs.length > 0) ? ('/* Statements */\n' + stmJs + '\n') : '',
			`}, ${JSON.stringify(arg.parametersOf)})`,
		].join('');
	},
	BlockLiteralInitializer(name, _eq, blk) {
		return `${genName(name.asJs, blk.parametersOf.length)} = ${blk.asJs}`;
	},
	EmptyListSyntax(_l, _r) {
		return '[]';
	},
	ExpressionInitializer(name, _e, exp) {
		return `${name.asJs} = ${exp.asJs}`;
	},
	FinalExpression(e) {
		return `return ${e.asJs};`;
	},
	LetTemporary(_let, tmp, _sc) {
		return `let ${tmp.asJs};`;
	},
	LibraryItemExpression(_libraryItem, aRecord) {
		return `_addLibraryItem_2(_system, _asLibraryItem_1(${aRecord.asJs}));\n`;
	},
	MethodDefinitions(_p, _l, n, _r, _lc, mn, mb, _rc) {
		return makeMethodList(
			'extendTypeOrTraitWithMethod',
			n.asIteration().children.map(
				(c) => c.sourceString,
			),
			mn.children.map((c) => c.sourceString),
			mb.children,
		);
	},
	NonEmptyParameterList(_l, sq, _r) {
		return commaListJs(sq.asIteration().children);
	},
	NonFinalExpression(e, _semicolon, stm) {
		return `${e.asJs}; ${stm.asJs};`;
	},
	ListExpression(_leftBracket, items, _rightBracket) {
		return `[${commaListJs(items.asIteration().children)}]`;
	},
	ParameterList(_leftParen, sq, _rightParen) {
		return commaListJs(sq.asIteration().children);
	},
	ParenthesisedExpression(_leftParen, e, _rightParen) {
		return `(${e.asJs})`;
	},
	Primitive(_l, s, _r) {
		return s.sourceString;
	},
	Program(tmp, stm) {
		return tmp.asJs + stm.asJs;
	},
	RecordKeyAssociation(lhs, rhs) {
		return `['${lhs.asJs}', ${rhs.asJs}]`;
	},
	ScalarAssignment(lhs, _ce, rhs) {
		return `${lhs.asJs} = ${rhs.asJs}`;
	},
	SlotDefinitions(_l, slots, _r) {
		// Space separated list of quoted names for internal use only, see makeTypeDefinition
		return slots.children.map(
			function (e) {
				let [nm, ty] = e.sourceString.split(':'); // ignore type
				return `'${nm}'`;
			},
		).join(' ');
	},
	StringAssociation(lhs, _c, rhs) {
		return `[${lhs.sourceString}, ${rhs.asJs}]`;
	},
	TraitDefinition(nm, _l, mn, mb, _r) {
		const unqualifiedTraitName = nm.sourceString.substring(1);
		const trait =
			`sl.addTrait('${unqualifiedTraitName}', '${context.packageName}');\n`;
		const mth = makeMethodList(
			'addMethodToExistingTrait',
			[unqualifiedTraitName],
			mn.children.map((c) => c.sourceString),
			mb.children,
		);
		return `${trait}\n${mth}\n`;
	},
	TraitList(_c, _l, names, _r) {
		return names.asIteration().children.map(
			(c) => `'${c.sourceString}'`,
		).join(', ');
	},
	TypeDefinition(n, h, t, _l, v, mn, mb, _r) {
		return makeTypeDefinition(
			h.sourceString === '!',
			n.sourceString,
			t.asJs,
			v.asJs,
			mn.children.map((c) => c.sourceString),
			mb.children,
		);
	},
	ValueApply(p, _d, a) {
		return `${p.asJs}(${a.asJs})`;
	},
	VarTemporaries(_var, tmp, _sc) {
		return `let ${commaListJs(tmp.asIteration().children)};`;
	},
	VectorSyntax(_l, items, _r) { // Required for unit case. CF Help File
		let c = items.children;
		if (c.length === 1) {
			return `[${c[0].asJs}]`;
		}
		throw new Error(`VectorSyntax: ${c.length}`);
	},

	argumentName(_c, name) {
		return name.asJs;
	},
	arityQualifiedIdentifier(c1, cN, _s, a) {
		return `_${c1.sourceString}${cN.sourceString}_${a.sourceString}`;
	},
	boundOperator(op) {
		const name = `_${resolveMethodName(op.sourceString)}`;
		return name;
	},
	floatLiteral(s, i, _, f) {
		return `${s.sourceString}${i.sourceString}.${f.sourceString}`;
	},
	infinityLiteral(s, i) {
		return s.sourceString + i.sourceString;
	},
	integerLiteral(s, i) {
		// Allow 03 for 3 and -03 for -3
		return `${s.sourceString + parseInt(i.sourceString)}`;
	},
	largeIntegerLiteral(s, i, _l) {
		return `${s.sourceString}${i.sourceString}n`;
	},
	lowercaseIdentifier(c1, cN) {
		return `_${c1.sourceString}${cN.sourceString}`;
	},
	operator(op) {
		return `_${genName(op.sourceString, 2)}`;
	},
	recordKeyToken(n, _c) {
		return n.sourceString;
	},
	reservedIdentifier(id) {
		switch (id.sourceString) {
			case 'nil':
				return 'null';
			case 'true':
				return 'true';
			case 'false':
				return 'false';
			default:
				throw new Error('rewrite: reservedIdentifier?');
		}
	},
	scientificLiteral(base, _e, exponent) {
		return `${base.sourceString}E${exponent.sourceString}`;
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return `'${quoteNewLines(s.sourceString)}'`;
	},
	systemVariableIdentifier(p, k) {
		return p.sourceString + k.sourceString;
	},
	unqualifiedIdentifier(c1, cN) {
		return `_${c1.sourceString}${cN.sourceString}`;
	},
	unusedVariableIdentifier(_underscore) {
		return genSym('__genSym');
	},
	uppercaseIdentifier(c1, cN) {
		return `_${c1.sourceString}${cN.sourceString}`;
	},

	EmptyListOf() {
		return '';
	},
	NonemptyListOf(first, _sep, rest) {
		return `${first.asJs}; ${rest.children.map((c) => c.asJs).join('; ')}`;
	},

	_iter(...children) {
		return children.map((c) => c.asJs).join('');
	},
	_terminal() {
		return this.sourceString;
	},
};

slSemantics.addAttribute('asJs', asJs);

const asSl: ohm.ActionDict<string> = {
	ApplySyntax(rcv, arg) {
		return `${rcv.sourceString}(${arg.asSl})`;
	},
	ApplyWithTrailingClosuresSyntax(name, args, trailing) {
		return `${name.sourceString}(${
			commaListSl(args.children.concat(trailing.children))
		})`;
	},
	ApplyWithTrailingRecordSyntax(name, trailing) {
		return `${name.sourceString}(${commaListSl(trailing.children)})`;
	},
	Arguments(a, _p) {
		return a.children.map((x) => x.asSl).join(' ');
	},
	AtAllSyntax(c, _l, k, _r) {
		const elem = k.asIteration().children;
		return `atAll(${c.asSl}, ${commaListSl(elem)})`;
	},
	AtPutSyntax(c, _l, k, _r, _e, v) {
		const elem = k.asIteration().children;
		return `atPut(${c.asSl}, ${commaListSl(elem)}, ${v.asSl})`;
	},
	AtSyntax(c, _l, k, _r) {
		const elem = k.asIteration().children;
		return `at(${c.asSl}, ${commaListSl(elem)})`;
	},
	BinaryOperatorExpression(lhs, ops, rhs) {
		let left = lhs.asSl;
		const opsArray = ops.children.map((c) => c.asSl);
		const rhsArray = rhs.children.map((c) => c.asSl);
		while (opsArray.length > 0) {
			const op = opsArray.shift();
			const right = rhsArray.shift();
			left = `${op}(${left}, ${right})`;
		}
		return left;
	},
	BinaryAdverbExpression(lhs, ops, rhs) {
		let left = lhs.asSl;
		const opsArray = ops.children.map((c) => c.asSl);
		const rhsArray = rhs.children.map((c) => c.asSl);
		while (opsArray.length > 0) {
			const op = opsArray.shift();
			const right = rhsArray.shift();
			left = `(${op} . (${left}, ${right}))`;
		}
		return left;
	},
	Block(_l, arg, tmp, prm, stm, _r) {
		const argSl = arg.asSl;
		const vBar = (argSl === '') ? '' : ' | ';
		return `{ ${argSl}${vBar}${tmp.asSl}${prm.asSl}${stm.asSl} }`;
	},
	BlockLiteralInitializer(name, _e, blk) {
		return `${name.sourceString} = ${blk.asSl}`;
	},
	MapSyntaxItem(lhs, _c, rhs) {
		return `[${lhs.asSl}, ${rhs.asSl}]`;
	},
	DotExpression(lhs, _dot, names, args) {
		let rcv = lhs.asSl;
		const namesArray = names.children.map((c) => c.asSl);
		const argsArray = args.children.map((c) => c.asSl);
		while (namesArray.length > 0) {
			const name = namesArray.shift();
			const arg = argsArray.shift();
			if (arg.length === 0) {
				rcv = `${name}(${rcv})`;
			} else {
				rcv = `${name}(${[rcv].concat([arg])})`;
			}
		}
		return rcv;
	},
	DotExpressionWithAssignmentSyntax(lhs, _d, name, _e, rhs) {
		return `${name.asSl}(${lhs.asSl}, ${rhs.asSl})`;
	},
	DotExpressionWithTrailingClosuresSyntax(lhs, _dot, name, args, trailing) {
		return `${name.sourceString}(${
			commaListSl([lhs].concat(args.children, trailing.children))
		})`;
	},
	DotExpressionWithTrailingRecordSyntax(lhs, _dot, name, trailing) {
		return `${name.sourceString}(${
			commaListSl([lhs].concat(trailing.children))
		})`;
	},
	EmptyListSyntax(_l, _r) {
		return '[]';
	},
	EmptyMapSyntax(_l, _, _r) {
		return 'Map()';
	},
	EmptyRecordSyntax(_l, _c, _r) {
		return 'Record()';
	},
	ExpressionInitializer(name, _e, exp) {
		return `${name.sourceString} = ${exp.asSl}`;
	},
	FinalExpression(e) {
		return e.asSl;
	},
	LetTemporary(_l, tmp, _s) {
		return `let ${tmp.asSl}; `;
	},
	LibraryItemLiteral(_l, aRecord) {
		return `LibraryItem ${aRecord.asSl}`;
	},
	ListAssignment(_l, lhs, _r, _e, rhs) {
		const namesArray = lhs.asIteration().children.map((c) => c.asSl);
		const rhsListName = genSym('__SPL');
		const slots = namesArray.map(
			(name, index) => `${name} := at(${rhsListName}, ${index + 1})`,
		).join('; ');
		return `({ let ${rhsListName} = ${rhs.asSl}; ${slots} } . ())`;
	},
	ListExpression(_l, items, _r) {
		return `[${commaListSl(items.asIteration().children)}]`;
	},
	ListInitializer(_l, lhs, _r, _e, rhs) {
		const namesArray = lhs.asIteration().children.map((c) => c.asSl);
		const rhsName = genSym('__SPL');
		const slots = namesArray.map(
			(name, index) => `let ${name} = at(${rhsName}, ${index + 1})`,
		).join('; ');
		return `${rhsName} = assertIsOfSize(${rhs.asSl}, ${namesArray.length}); ${slots}`;
	},
	ListRangeSyntax(_left, start, _dots, end, _right) {
		return `asList(upOrDownTo(${start.asSl}, ${end.asSl}))`;
	},
	ListRangeThenSyntax(_left, start, _comma, then, _dots, end, _right) {
		return `asList(thenTo(${start.asSl}, ${then.asSl}, ${end.asSl}))`;
	},
	MatrixSyntax(_l, items, _r) {
		return `[${commaListSl(items.asIteration().children)}]`;
	},
	MatrixSyntaxItems(items) {
		return `[${commaListSl(items.children)}]`;
	},
	MethodDefinitions(_p, _l, n, _r, _lc, mn, mb, _rc) {
		const begin = `+[${n.sourceString}] {`;
		const middle = rewriteMethodList(mn, mb);
		const end = '}\n';
		return [begin, middle, end].flat().join('\n');
	},
	NonEmptyMapSyntax(_l, d, _r) {
		return `Map([${commaListSl(d.asIteration().children)}])`;
	},
	NonEmptyParameterList(_leftParen, sq, _rightParen) {
		return commaListSl(sq.asIteration().children);
	},
	NonEmptyRecordSyntax(_l, d, _r) {
		return `Record([${commaListSl(d.asIteration().children)}])`;
	},
	NonFinalExpression(e, _s, stm) {
		return `${e.asSl}; ${stm.asSl}`;
	},
	ParameterList(_l, sq, _r) {
		return commaListSl(sq.asIteration().children);
	},
	ParenthesisedExpression(_left, e, _right) {
		return '(' + e.asSl + ')';
	},
	Primitive(_l, s, _r) {
		return '<primitive: ' + s.sourceString + '>\n';
	},
	Program(tmp, stm) {
		return tmp.asSl + stm.asSl;
	},
	PropertyReadSyntax(c, _colons, k) {
		return `propertyRead(${c.asSl}, '${k.sourceString}')`;
	},
	PropertyWriteSyntax(c, _colons, k, _equals, v) {
		return `propertyWrite(${c.asSl}, '${k.sourceString}', ${v.asSl})`;
	},
	RangeSyntax(_left, start, _dots, end, _right) {
		return `upOrDownTo(${start.asSl}, ${end.asSl})`;
	},
	RangeThenSyntax(_left, start, _comma, then, _dots, end, _right) {
		return `thenTo(${start.asSl}, ${then.asSl}, ${end.asSl})`;
	},
	RecordAssignment(_l, lhs, _r, _e, rhs) {
		const rhsDictionaryName = genSym('__SPL');
		const keyVarNamesArray = lhs.asIteration().children.map(
			(c) => c.parametersOf,
		);
		const slots = genRecordAssignmentSlots(
			false,
			rhsDictionaryName,
			keyVarNamesArray,
		);
		return `({ let ${rhsDictionaryName} = assertIsOfSize(${rhs.asSl}, ${keyVarNamesArray.length}); ${slots} } . ())`;
	},
	RecordInitializer(_l, lhs, _r, _e, rhs) {
		const rhsDictionaryName = genSym('__SPL');
		const keyVarNamesArray = lhs.asIteration().children.map(
			(c) => c.parametersOf,
		);
		const slots = genRecordAssignmentSlots(
			true,
			rhsDictionaryName,
			keyVarNamesArray,
		);
		return `${rhsDictionaryName} = assertIsOfSize(${rhs.asSl}, ${keyVarNamesArray.length}); ${slots}`;
	},
	RecordKeyAssociation(lhs, rhs) {
		return `['${lhs.asSl}', ${rhs.asSl}]`;
	},
	ScalarAssignment(lhs, _e, rhs) {
		return `${lhs.asSl} := ${rhs.asSl}`;
	},
	StringAssociation(lhs, _c, rhs) {
		return `[${lhs.sourceString}, ${rhs.asSl}]`;
	},
	TraitDefinition(n, _l, mn, mb, _r) {
		const begin = `${n.sourceString} {`;
		const middle = rewriteMethodList(mn, mb);
		const end = '}\n';
		return [begin, middle, end].flat().join('\n');
	},
	TraitExtension(_p, t, _l, n, b, _r) {
		return rewriteTypeOrTraitExtension(t, n, b);
	},
	TupleExpression(_l, items, _r) {
		return `Tuple([${commaListSl(items.asIteration().children)}])`;
	},
	TypeDefinition(n, h, t, _l, v, mn, mb, _r) {
		const begin =
			`${n.sourceString}${h.sourceString} ${t.sourceString} { ${v.sourceString}`;
		const middle = rewriteMethodList(mn, mb);
		const end = '}\n';
		return [begin, middle, end].flat().join('\n');
	},
	TypeExtension(_p, t, _l, n, b, _r) {
		return rewriteTypeOrTraitExtension(t, n, b);
	},
	ValueApply(p, _d, a) {
		return `${p.asSl} . (${a.asSl})`;
	},
	VarTemporaries(_v, t, _s) {
		return `var ${t.sourceString};`;
	},
	VectorSyntax(_l, i, _r) {
		return `[${commaListSl(i.children)}]`;
	},
	VectorSyntaxUnarySend(lhs, _d, rhs) {
		return `${rhs.asSl}(${lhs.asSl})`;
	},
	VolumeSyntax(_l, items, _r) {
		return `[${commaListSl(items.asIteration().children)}]`;
	},
	VolumeSyntaxItems(items) {
		return `[${commaListSl(items.asIteration().children)}]`;
	},

	argumentName(_c, name) {
		return ':' + name.sourceString;
	},
	arityQualifiedIdentifier(c1, cN, _s, a) {
		return c1.sourceString + cN.sourceString + ':/' + a.sourceString;
	},
	backtickQuotedStringLiteral(_l, s, _r) {
		return `Symbol('${s.sourceString}')`;
		/* return `BacktickQuotedString('${s.sourceString}')`; */
	},
	complexLiteral(r, _j, i) {
		return `Complex(${r.sourceString}, ${i.sourceString})`;
	},
	doubleQuotedStringLiteral(_l, s, _r) {
		return `DoubleQuotedString('${s.sourceString}')`;
	},
	floatDecimalLiteral(s, i, _, f, _d) {
		return `parseDecimal('${s.sourceString}${i.sourceString}.${f.sourceString}D')`;
	},
	floatLiteral(s, i, _dot, f) {
		return s.sourceString + clearLeadingZeroes(i.sourceString) + '.' +
			f.sourceString;
	},
	fractionLiteral(s, n, _s, d) {
		return `Fraction(${
			validateSign(s.sourceString)
		}${n.sourceString}L, ${d.sourceString}L)`;
	},
	imaginaryLiteral(i, _i) {
		return `Complex(0, ${i.sourceString})`;
	},
	infinityLiteral(s, i) {
		return validateSign(s.sourceString) + i.sourceString;
	},
	integerDecimalLiteral(s, i, _d) {
		return `parseDecimal('${s.sourceString}${i.sourceString}D')`;
	},
	integerLiteral(s, i) {
		return s.sourceString + i.sourceString;
	},
	recordKeyToken(n, _c) {
		return n.sourceString;
	},
	largeIntegerLiteral(s, i, _l) {
		return s.sourceString + i.sourceString + 'L';
	},
	lowercaseIdentifier(c1, cN) {
		return c1.sourceString + cN.sourceString;
	},
	nanLiteral(x) {
		return x.sourceString;
	},
	operator(op) {
		return op.sourceString;
	},
	operatorWithUnaryAdverb(op, _d, adverb) {
		return `${adverb.sourceString}(${op.sourceString})`;
	},
	operatorWithBinaryAdverb(op, _d, adverb, _l, parameter, _r) {
		return `${adverb.sourceString}(${op.sourceString}, ${parameter.asSl})`;
	},
	radixIntegerLiteral(s, b, _r, i) {
		const r = Number.parseInt(
			s.sourceString + i.sourceString,
			Number.parseInt(b.sourceString, 10),
		);
		if (Number.isNaN(r)) {
			throw new Error('radixIntegerLiteral: invalid literal');
		}
		return r.toString(10);
	},
	spanFromByToLiteral(start, _colon, step, _anotherColon, end) {
		return `Span(${start.asSl}, ${end.asSl}, ${step.asSl})`;
	},
	spanFromToLiteral(start, _colon, end) {
		return `Span(${start.asSl}, ${end.asSl}, 1)`;
	},
	residueLiteral(i, _z, m) {
		return `Residue(${i.sourceString}, ${m.sourceString})`;
	},
	scientificLiteral(b, _e, e) {
		return b.sourceString + 'E' + e.sourceString;
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return "'" + s.sourceString + "'";
	},
	symbolicCharacterLiteral(c) {
		let i = c.sourceString.codePointAt(0)!;
		let a = String.fromCodePoint(i - 119841);
		return "Symbol('" + a + "')";
	},
	unqualifiedIdentifier(c1, cN) {
		return c1.sourceString + cN.sourceString;
	},
	uppercaseIdentifier(c1, cN) {
		return c1.sourceString + cN.sourceString;
	},

	EmptyListOf() {
		return '';
	},
	NonemptyListOf(p, _s, q) {
		const rest = q.children;
		if (rest.length === 0) {
			return p.asSl;
		}
		return `${p.asSl}; ${rest.map((c) => c.asSl).join('; ')}`;
	},

	_iter(...children) {
		return children.map((c) => c.asSl).join('');
	},
	_terminal() {
		return this.sourceString;
	},
};

slSemantics.addAttribute('asSl', asSl);

export type SlAst = (string | SlAst)[];

const asAst: ohm.ActionDict<SlAst> = {
	ApplySyntax(rcv, arg) {
		return ['Apply', rcv.asAst].concat(arg.asAst.flat(1));
	},
	Arguments(a, _p) {
		return ['Arguments'].concat(
			a.children.map((x) => x.asAst),
		);
	},
	Primitive(_l, s, _r) {
		return ['Primitive', s.sourceString];
	},
	Block(_l, arg, tmp, prm, stm, _r) {
		return ['Block'].concat(
			[
				arg.asAst,
				tmp.asAst.flat(1),
				prm.asAst,
				stm.asAst.flat(1),
			].flat(1),
		);
	},
	EmptyListSyntax(_l, _r) {
		return ['List'];
	},
	ExpressionInitializer(name, _e, exp) {
		return [name.asAst, exp.asAst];
	},
	FinalExpression(e) {
		return [e.asAst];
	},
	LetTemporary(_l, tmp, _s) {
		return ['Let', tmp.asAst].flat(1);
	},
	ListExpression(_l, items, _r) {
		return ['List'].concat(items.children.map((x) => x.asAst).flat(1));
	},
	NonEmptyParameterList(_l, sq, _r) {
		return sq.children.map((x) => x.asAst);
	},
	NonFinalExpression(e, _s, stm) {
		return [e.asAst].concat(stm.asAst);
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
	ScalarAssignment(lhs, _e, rhs) {
		return ['Assignment', [lhs.asAst], [rhs.asAst]].flat(1);
	},
	ValueApply(p, _d, a) {
		return [
			'Apply',
			[p.asAst].concat(
				a.asAst,
			),
		];
	},

	argumentName(_, x) {
		return ['Identifier', x.sourceString];
	},
	boundOperator(x) {
		return ['Operator', x.sourceString];
	},
	floatLiteral(s, i, _, f) {
		const x = s.sourceString + i.sourceString + '.' + f.sourceString;
		return ['SmallFloat', x];
	},
	infinityLiteral(s, i) {
		return ['SmallFloat', s.sourceString + i.sourceString];
	},
	integerLiteral(s, i) {
		return ['SmallInteger', s.sourceString + i.sourceString];
	},
	largeIntegerLiteral(s, i, _l) {
		return ['LargeInteger', s.sourceString + i.sourceString + 'L'];
	},
	lowercaseIdentifier(c1, cN) {
		return ['Identifier', c1.sourceString + cN.sourceString];
	},
	nanLiteral(_n) {
		return ['SmallFloat', 'NaN'];
	},
	operator(op) {
		return ['Operator', op.sourceString];
	},
	reservedIdentifier(x) {
		return ['ReservedIdentifier', x.sourceString];
	},
	scientificLiteral(b, _e, e) {
		return ['SmallFloat', b.sourceString + 'E' + e.sourceString];
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return ['String', s.sourceString];
	},
	unqualifiedIdentifier(c1, cN) {
		return ['Identifier', c1.sourceString + cN.sourceString];
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

const arityOf: ohm.ActionDict<number> = {
	Arguments(names, _) {
		return names.children.length;
	},
	NonEmptyParameterList(_l, sq, _r) {
		return sq.asIteration().children.length;
	},
	ParameterList(_l, sq, _r) {
		return sq.asIteration().children.length;
	},

	_iter(...children) {
		return arraySum(children.map((c) => c.arityOf));
	},
};

slSemantics.addAttribute('arityOf', arityOf);

const parametersOf: ohm.ActionDict<string[]> = {
	Arguments(names, _) {
		return names.children.map(
			(each) => each.sourceString.substring(1),
		);
	},
	Block(_l, arg, _tmp, _prm, _stm, _r) {
		return arg.parametersOf;
	},
	RecordInitializerItem(lhs, rhs) {
		return [
			lhs.sourceString.substring(0, lhs.sourceString.length - 1),
			rhs.sourceString,
		];
	},

	_iter(...children) {
		if (children.length == 0) {
			return [];
		} else if (children.length == 1) {
			return children[0].parametersOf;
		} else {
			throw new Error('rewrite: parametersOf: _iter?');
		}
	},
};

slSemantics.addAttribute('parametersOf', parametersOf);

function commaList(nodeArray: ohm.Node[], fn: (x: ohm.Node) => string): string {
	return nodeArray.map(fn).join(', ');
}

function commaListJs(nodeArray: ohm.Node[]): string {
	return commaList(nodeArray, (e) => e.asJs);
}

function commaListSl(nodeArray: ohm.Node[]): string {
	return commaList(nodeArray, (e) => e.asSl);
}

let genSymCounter = 0;

function genSym(prefix: string): string {
	genSymCounter += 1;
	return `${prefix}${genSymCounter}`;
}

function makeMethod(
	slProc: string,
	typeOrTraitNameArray: string[],
	methodName: string,
	methodBlock: ohm.Node,
): string {
	const blkSource = methodBlock.sourceString;
	const blkParameters = methodBlock.parametersOf;
	const blkJs = methodBlock.asJs;
	const blkSrc = JSON.stringify(blkSource);
	const slName = resolveMethodName(methodName);
	// console.debug('makeMethod', methodName, blkParameters);
	return typeOrTraitNameArray.map(function (typeOrTraitName) {
		// console.debug(`makeMethod: '${slProc}', '${typeOrTraitName}', '${context.packageName}', '${methodName}'('${slName}'), ${blkParameters}`);
		return `sl.${slProc}(\n\t'${typeOrTraitName}',\n\t'${context.packageName}',\n\t'${slName}',\n\t${
			JSON.stringify(blkParameters)
		},\n\t${blkJs},\n\t${blkSrc}\n);\n\n`;
	}).join('\n');
}

function makeMethodList(
	slProc: string,
	typeOrTraitNameArray: string[],
	methodNames: string[],
	methodBlocks: ohm.Node[],
): string {
	let methodList = '';
	while (methodNames.length > 0) {
		const methodName = methodNames.shift()!;
		const methodBlock = methodBlocks.shift()!;
		const methodSource = makeMethod(
			slProc,
			typeOrTraitNameArray,
			methodName,
			methodBlock,
		);
		// console.debug(`makeMethodList: ${methodSource}`);
		methodList += methodSource;
	}
	return methodList;
}

function slFirstLineComment(slText: string): string | null {
	if (slText.startsWith('/*')) {
		const index = slText.indexOf('*/');
		return (index > 0) ? slText.slice(2, index) : null;
	} else {
		return null;
	}
}

export function rewriteSlToCore(slText: string): string {
	const slCoreText = slParse(slText).asSl;
	// console.debug(`rewriteSlToCore: ${slText} => ${slCoreText}`);
	return slCoreText;
}

export function rewriteSlToAst(slText: string): SlAst {
	const slCoreText = slParse(slText).asSl;
	const slAst = slParse(slCoreText).asAst;
	// console.debug(`rewriteSlToAst: ${slText} => ${slCoreText} => ${slAst}`);
	return slAst;
}

// Preserve first line comment for Requires information in .cache
export function rewriteSlToJs(slText: string): string {
	const slCoreText = rewriteSlToCore(slText);
	const jsText = slParse(slCoreText).asJs;
	// console.debug(`rewriteSlToJs: ${slText} => ${slCoreText} => ${jsText}`);
	const slComment = slFirstLineComment(slText);
	if (slComment) {
		return `/* ${slComment} */\n\n` + jsText;
	} else {
		return jsText;
	}
}

export function rewriteSlToJsFor(packageName: string, slText: string): string {
	let jsText: string;
	context.packageName = packageName;
	try {
		jsText = rewriteSlToJs(slText);
		context.packageName = '*UnknownPackage*';
		return jsText;
	} catch (err) {
		context.packageName = '*UnknownPackage*';
		// console.debug('rewriteSlToJsFor', packageName, slText, err);
		throw new Error('rewriteSlToJsFor: Rewrite failed: ', { cause: err });
	}
}
