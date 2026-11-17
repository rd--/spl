import ohm from 'https://unpkg.com/ohm-js@17.1.0/dist/ohm.esm.js';

import { slParse, slSemantics } from './grammar.ts';
import { resolveMethodName } from './operator.ts';

import * as rewrite from './rewrite-shared.ts';

function isSplArityQualifiedName(s: string): boolean {
	return s.includes('/');
}

// Spl allows both + and - as prefixes to number literals.
// This function removes +, retains -, and reports errors.
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
	throw new Error(`validateSign: invalid sign: ${x}`);
}

function ensureFloatLiteral(x: string): string {
	return x.includes('.') ? x : (x + '.0');
}

function genRecordAssignmentSlots(
	withLet: boolean,
	rhsDictionaryName: string,
	keyVarNamesArray: string[],
): string {
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

// nList = names, bList = bodies
function rewriteMethodListToCore(
	nList: ohm.Node,
	bList: ohm.Node,
): string[] {
	const nArray = nList.children;
	const bArray = bList.children;
	const k = nArray.length;
	const answer: string[] = [];
	for (let i = 0; i < k; i++) {
		const n = nArray[i];
		const nResolved = n.asSl;
		const b = bArray[i];
		const bInitial = b.sourceString;
		const bCore = b.asSl;
		rewrite.rewriteContext.methodBodyInitialSourceTable.set(bCore, bInitial);
		answer.push('\t' + nResolved + ' ' + bCore);
	}
	return answer;
}

// t = types/traits, n = names, b = bodies
function rewriteTypeOrTraitExtensionToCore(
	t: ohm.Node,
	n: ohm.Node,
	b: ohm.Node,
): string {
	const begin = `+[${t.sourceString}] {`;
	const middle = rewriteMethodListToCore(n, b);
	const end = '}\n';
	return [begin, middle, end].flat().join('\n');
}

const asSl: ohm.ActionDict<string> = {
	ApplySyntax(rcv, arg) {
		return `${rcv.asSl}(${arg.asSl})`;
	},
	ApplyWithTrailingClosuresSyntax(name, args, trailing) {
		return `${name.asSl}(${
			rewrite.commaListSl(args.children.concat(trailing.children))
		})`;
	},
	ArgumentsWithAnnotations(a, _t, _verticalLine) {
		const aList = a.children.map((x) => x.asSl);
		return aList.join(' ');
	},
	ArgumentsWithoutAnnotations(a, _verticalLine) {
		return a.children.map((x) => x.asSl).join(' ');
	},
	AtAllSyntax(c, i) {
		return `atAll(${c.asSl}, ${i.asSl})`;
	},
	AtSyntax(c, _leftBracket, k, _rightBracket) {
		return `at(${c.asSl}, ${k.asSl})`;
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
	BinaryOperatorWithAdverbExpression(lhs, ops, rhs) {
		let left = lhs.asSl;
		const opsArray = ops.children.map((c) => c.asSl);
		const rhsArray = rhs.children.map((c) => c.asSl);
		while (opsArray.length > 0) {
			const op = opsArray.shift();
			const right = rhsArray.shift();
			left = `binaryApply(${op}, ${left}, ${right})`;
		}
		return left;
	},
	BlockWithAnnotations(_l, arg, prm, stm, _r) {
		const argSl = arg.asSl;
		const vBar = (argSl === '') ? '' : ' | ';
		const argRw = arg.argumentsWithTypeAnnotation;
		return `{ ${argSl}${vBar}${prm.asSl}${argRw}${stm.asSl} }`;
	},
	BlockWithoutAnnotations(_l, arg, prm, stm, _r) {
		const argSl = arg.asSl;
		const vBar = (argSl === '') ? '' : ' | ';
		return `{ ${argSl}${vBar}${prm.asSl}${stm.asSl} }`;
	},
	BlockLiteralInitializer(name, _equals, blk) {
		let nameStr = name.asSl;
		if (isSplArityQualifiedName(nameStr)) {
			return `${nameStr} = ${blk.asSl}`;
		} else {
			const blkArity = blk.parametersOf.length;
			return `${nameStr}/${blkArity} = ${blk.asSl}`;
		}
	},
	DotExpression(lhs, _dot, namesList, argsList) {
		let answer = lhs.asSl;
		const namesArray = namesList.children.map((c) => c.asSl);
		const argsArray = argsList.children.map((c) => c.asSl);
		while (namesArray.length > 0) {
			const name = namesArray.shift();
			const arg = argsArray.shift();
			if (arg.length === 0) {
				answer = `${name}(${answer})`;
			} else {
				answer = `${name}(${[answer].concat([arg])})`;
			}
		}
		return answer;
	},
	DotExpressionWithAssignmentSyntax(lhs, _dot, name, _colonEquals, rhs) {
		return `${name.asSl}MutateInPlace(${lhs.asSl}, ${rhs.asSl})`;
	},
	DotExpressionWithTrailingClosuresSyntax(lhs, _dot, name, args, trailing) {
		return `${name.asSl}(${
			rewrite.commaListSl([lhs].concat(args.children, trailing.children))
		})`;
	},
	EmptyListSyntax(_leftBracket, _rightBracket) {
		return '[]';
	},
	EmptyMapSyntax(_l, _, _r) {
		return 'Map()';
	},
	EmptyRecordSyntax(_leftParen, _colon, _rightParen) {
		return 'Record()';
	},
	ExpressionInitializer(name, _equals, exp) {
		return `${name.asSl} = ${exp.asSl}`;
	},
	FinalStatement(e) {
		return e.asSl;
	},
	WorkspaceVariableAssignment(_workspace, _dot, varName, _colonEquals, expr) {
		return `workspaceVariableAssignment!(system, '${varName.asSl}', ${expr.asSl})`;
	},
	WorkspaceVariableReference(_workspace, _dot, varName) {
		return `workspaceVariableReference(system, '${varName.asSl}')`;
	},
	LetBinding(_let, tmp) {
		return `let ${tmp.asSl}`;
	},
	LibraryItemLiteral(_l, aRecord) {
		return `LibraryItem ${aRecord.asSl}`;
	},
	ListAssignment(_leftBracket, lhs, _rightBracket, _colonEquals, rhs) {
		const namesArray = lhs.asIteration().children.map((c) => c.asSl);
		const rhsListName = rewrite.genVarSym();
		const slots = namesArray.map(
			(name, index) => `${name} := at(${rhsListName}, ${index + 1})`,
		).join('; ');
		return `nullaryApply({ let ${rhsListName} = ${rhs.asSl}; ${slots} })`;
	},
	ListConstructorSyntax(typ, lst) {
		return `${typ.asSl}(${lst.asSl})`;
	},
	ListInitializer(_leftBracket, lhs, _rightBracket, _equals, rhs) {
		const namesArray = lhs.asIteration().children.map((c) => c.asSl);
		const rhsName = rewrite.genVarSym();
		const slots = namesArray.map(
			(name, index) => `let ${name} = at(${rhsName}, ${index + 1})`,
		).join('; ');
		return `${rhsName} = assertIsOfSize(${rhs.asSl}, ${namesArray.length}); ${slots}`;
	},
	ListRangeFromToSyntax(_leftBracket, i, _dots, j, _rightBracket) {
		return `listRange(${i.asSl}, ${j.asSl})`;
	},
	ListRangeFromThenToSyntax(
		_leftBracket,
		i,
		_comma,
		j,
		_dots,
		k,
		_rightBracket,
	) {
		return `listThenTo(${i.asSl}, ${j.asSl}, ${k.asSl})`;
	},
	ListRangeFromToBySyntax(
		_leftBracket,
		i,
		_comma,
		j,
		_semicolon,
		k,
		_rightBracket,
	) {
		return `listRange(${i.asSl}, ${j.asSl}, ${k.asSl})`;
	},
	MapSyntaxItem(lhs, _c, rhs) {
		return `[${lhs.asSl}, ${rhs.asSl}]`;
	},
	MatrixSyntax(_l, items, _r) {
		return `[${rewrite.commaListSl(items.asIteration().children)}]`;
	},
	MatrixSyntaxItems(items) {
		return `[${rewrite.commaListSl(items.children)}]`;
	},
	MethodNameList(_l, items, _r) {
		return `[${rewrite.commaListSl(items.asIteration().children)}]`;
	},
	MethodDefinitions(_p, _l, n, _r, _lc, mn, mb, _rc) {
		const begin = `+[${n.sourceString}] {`;
		const middle = rewriteMethodListToCore(mn, mb);
		const end = '}\n';
		return [begin, middle, end].flat().join('\n');
	},
	NonEmptyListSyntax(_l, items, _r) {
		return `[${rewrite.commaListSl(items.asIteration().children)}]`;
	},
	NonEmptyParameterList(_leftParen, sq, _rightParen) {
		return rewrite.commaListSl(sq.asIteration().children);
	},
	NonEmptyMapSyntax(_l, d, _r) {
		return `Map([${rewrite.commaListSl(d.asIteration().children)}])`;
	},
	NonEmptyRecordSyntax(_l, d, _r) {
		return `Record([${rewrite.commaListSl(d.asIteration().children)}])`;
	},
	NonFinalStatement(e, _semicolon) {
		return `${e.asSl};`;
	},
	NonScalarListSyntax(_l, initial, _c, items, _r) {
		return `[${initial.asSl}, ${
			rewrite.commaListSl(items.asIteration().children)
		}]`;
	},
	ParameterList(_l, sq, _r) {
		return rewrite.commaListSl(sq.asIteration().children);
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
	PutSyntax(c, _leftBracket, k, _rightBracket, _colonEquals, v) {
		return `put!(${c.asSl}, ${k.asSl}, ${v.asSl})`;
	},
	Statements(nonFinal, final) {
		return nonFinal.asSl + final.asSl;
	},
	RangeFromToSyntax(_leftParenthesis, i, _dots, j, _rightParenthesis) {
		return `Range(${i.asSl}, ${j.asSl})`;
	},
	RangeFromThenToSyntax(
		_leftParenthesis,
		i,
		_comma,
		j,
		_dots,
		k,
		_rightParenthesis,
	) {
		return `thenTo(${i.asSl}, ${j.asSl}, ${k.asSl})`;
	},
	RangeFromToBySyntax(
		_leftParenthesis,
		i,
		_dots,
		j,
		_semicolon,
		k,
		_rightParenthesis,
	) {
		return `Range(${i.asSl}, ${j.asSl}, ${k.asSl})`;
	},
	RecordAssignment(_leftParen, lhs, _rightParen, _colonEquals, rhs) {
		const rhsDictionaryName = rewrite.genVarSym();
		const keyVarNamesArray = lhs.asIteration().children.map(
			(c) => c.parametersOf,
		);
		const slots = genRecordAssignmentSlots(
			false,
			rhsDictionaryName,
			keyVarNamesArray,
		);
		return `nullaryApply({ let ${rhsDictionaryName} = assertIsOfSize(${rhs.asSl}, ${keyVarNamesArray.length}); ${slots} })`;
	},
	RecordConstructorSyntax(typ, rcd) {
		return `${typ.asSl}(${rcd.asSl})`;
	},
	RecordInitializer(_leftParen, lhs, _rightParen, _equals, rhs) {
		const rhsDictionaryName = rewrite.genVarSym();
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
	ScalarAssignment(lhs, _colonEquals, rhs) {
		return `${lhs.asSl} := ${rhs.asSl}`;
	},
	StringAssociation(lhs, _colon, rhs) {
		return `[${lhs.sourceString}, ${rhs.asSl}]`;
	},
	StringConstructorSyntax(typ, str) {
		return `${typ.asSl}(${str.asSl})`;
	},
	TraitDefinition(n, _l, mn, mb, _r) {
		const begin = `${n.sourceString} {`;
		const middle = rewriteMethodListToCore(mn, mb);
		const end = '}\n';
		return [begin, middle, end].flat().join('\n');
	},
	TraitExtension(_p, t, _l, n, b, _r) {
		return rewriteTypeOrTraitExtensionToCore(t, n, b);
	},
	TupleSyntax(_l, items, _r) {
		return `Tuple([${rewrite.commaListSl(items.asIteration().children)}])`;
	},
	TypeDefinition(n, h, t, _l, v, mn, mb, _r) {
		const begin =
			`${n.sourceString}${h.sourceString} ${t.sourceString} { ${v.sourceString}`;
		const middle = rewriteMethodListToCore(mn, mb);
		const end = '}\n';
		return [begin, middle, end].flat().join('\n');
	},
	TypeExtension(_p, t, _l, n, b, _r) {
		return rewriteTypeOrTraitExtensionToCore(t, n, b);
	},
	VarDeclaration(_var, tmp, _sc) {
		const f = (x: ohm.Node) => `let ${x.sourceString} = nil;`;
		return tmp.asIteration().children.map(f).join(' ');
	},
	VectorSyntax(_l, i, _r) {
		return `[${rewrite.commaListSl(i.children)}]`;
	},
	VectorSyntaxUnarySend(lhs, _d, rhs) {
		let rcv = lhs.asSl;
		const namesArray = rhs.children.map((c) => c.asSl);
		while (namesArray.length > 0) {
			const name = namesArray.shift();
			rcv = `${name}(${rcv})`;
		}
		return rcv;
	},
	VolumeSyntax(_l, items, _r) {
		return `[${rewrite.commaListSl(items.asIteration().children)}]`;
	},
	VolumeSyntaxItems(items) {
		return `[${rewrite.commaListSl(items.asIteration().children)}]`;
	},

	argumentName(_c, name) {
		return ':' + name.sourceString;
	},
	arityQualifiedIdentifier(c1, cN, ip, _solidus, a) {
		return `${rewrite.rewriteInPlaceName(c1, cN, ip)}/${a.sourceString}`;
	},
	backtickQuotedStringLiteral(_l, s, _r) {
		return `Symbol('${s.sourceString}')`;
	},
	complexLiteral(r, _j, i) {
		const rStr = ensureFloatLiteral(r.sourceString);
		const iStr = ensureFloatLiteral(i.sourceString);
		return `Complex(${rStr}, ${iStr})`;
	},
	doubleQuotedStringLiteral(_l, s, _r) {
		const sStr = s.sourceString;
		return `DoubleQuotedString('${sStr}')`;
	},
	floatDecimalLiteral(s, i, _, f, _d, k) {
		const sStr = s.sourceString;
		const iStr = i.sourceString;
		const fStr = f.sourceString;
		let kStr = k.sourceString;
		const e = 10n ** BigInt(fStr.length);
		const eStr = e.toString(10);
		if (kStr.length === 0) {
			kStr = fStr.length;
		}
		return `Decimal(Fraction(${sStr}${iStr}${fStr}L, ${eStr}L), ${kStr}L)`;
	},
	floatLiteral(s, i, _dot, f, _f) {
		return s.sourceString +
			rewrite.deleteLeadingZeroes(
				rewrite.deleteUnderscores(i.sourceString),
			) + '.' + f.sourceString;
	},
	fractionLiteral(s, n, _s, d) {
		return `Fraction(${
			validateSign(s.sourceString)
		}${n.sourceString}L, ${d.sourceString}L)`;
	},
	imaginaryLiteral(i, _i) {
		const iStr = ensureFloatLiteral(i.sourceString);
		return `Complex(0.0, ${iStr})`;
	},
	infinityLiteral(s, i) {
		return validateSign(s.sourceString) + i.sourceString;
	},
	integerDecimalLiteral(s, i, _d, k) {
		const sStr = s.sourceString;
		const iStr = i.sourceString;
		let kStr = k.sourceString;
		if (kStr.length === 0) {
			kStr = '0';
		}
		return `Decimal(Fraction(${sStr}${iStr}L, 1L), ${kStr}L)`;
	},
	lowercaseArityQualifiedIdentifier(c1, cN, ip, _solidus, a) {
		return `${rewrite.rewriteInPlaceName(c1, cN, ip)}/${a.sourceString}`;
	},
	smallIntegerLiteral(s, i) {
		return s.sourceString + i.sourceString;
	},
	recordKeyToken(n, _c) {
		return n.sourceString;
	},
	largeIntegerLiteral(s, i, _l) {
		return s.sourceString + rewrite.deleteUnderscores(i.sourceString) + 'L';
	},
	lowercaseIdentifier(c1, cN, ip) {
		return rewrite.rewriteInPlaceName(c1, cN, ip);
	},
	nanLiteral(x) {
		return x.sourceString;
	},
	negatedIdentifier(_n, i) {
		return `negate(${i.asSl})`;
	},
	operator(op) {
		const opName = resolveMethodName(op.sourceString);
		return opName;
	},
	operatorBound(op) {
		const opName = resolveMethodName(op.sourceString);
		return opName;
	},
	operatorFree(op) {
		const opName = resolveMethodName(op.sourceString);
		const qualifiedOpName = `${opName}/2`;
		return qualifiedOpName;
	},
	operatorWithUnaryAdverb(op, _d, adverb) {
		const opName = resolveMethodName(op.sourceString);
		const qualifiedOpName = `${opName}/2`;
		return `${adverb.sourceString}(${qualifiedOpName})`;
	},
	operatorWithBinaryAdverb(op, _d, adverb, _l, parameter, _r) {
		const opName = resolveMethodName(op.sourceString);
		const qualifiedOpName = `${opName}/2`;
		return `${adverb.sourceString}(${qualifiedOpName}, ${parameter.asSl})`;
	},
	radixIntegerLiteral(s, b, _b, i) {
		const r = Number.parseInt(
			s.sourceString + rewrite.deleteUnderscores(i.sourceString),
			Number.parseInt(b.sourceString, 10),
		);
		if (Number.isNaN(r)) {
			throw new Error('radixIntegerLiteral: invalid literal');
		}
		return r.toString(10);
	},
	rangeFromToByLiteral(start, _colon, end, _anotherColon, step) {
		return `Range(${start.asSl}, ${end.asSl}, ${step.asSl})`;
	},
	rangeFromToLiteral(start, _colon, end) {
		return `Range(${start.asSl}, ${end.asSl})`;
	},
	residueLiteral(i, _z, m) {
		return `Residue(${i.sourceString}L, ${m.sourceString}L)`;
	},
	floatScientificLiteral(b, _letterE, e) {
		const bStr = b.sourceString;
		const eStr = e.sourceString;
		return `times(${bStr}, power(10.0, ${eStr}.0))`;
	},
	integerScientificLiteral(b, _letterE, e) {
		const bStr = b.sourceString;
		const eStr = e.sourceString;
		return `times(${bStr}L, power(10L, ${eStr}L))`;
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return "'" + s.sourceString + "'";
	},
	unqualifiedIdentifier(c1, cN, ip) {
		return rewrite.rewriteInPlaceName(c1, cN, ip);
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

const argumentsWithTypeAnnotation: ohm.ActionDict<string> = {
	ArgumentsWithAnnotations(a, t, _verticalLine) {
		const aList = a.children.map((x) => x.asSl);
		const tList = t.children.map((x) => x.asSl);
		// FIX: use length instead of non-existent .size
		const vList = aList.map((x) => x.substring(1));
		const qList: string[] = [];
		const k = aList.length;
		for (let i = 0; i < k; i++) {
			if (tList[i] !== '') {
				qList.push(`${vList[i]} := ${tList[i]}(${vList[i]}); `);
			}
		}
		return qList.join('');
	},

	_iter(...children) {
		return children.map((c) => c.argumentsWithTypeAnnotation);
	},
};

slSemantics.addAttribute(
	'argumentsWithTypeAnnotation',
	argumentsWithTypeAnnotation,
);

const parametersOf: ohm.ActionDict<string[]> = {
	ArgumentsWithAnnotations(names, _types, _verticalLine) {
		return names.children.map(
			(each) => rewrite.dropFirstLetter(each.sourceString),
		);
	},
	ArgumentsWithoutAnnotations(names, _verticalLine) {
		return names.children.map(
			(each) => rewrite.dropFirstLetter(each.sourceString),
		);
	},
	BlockWithAnnotations(_l, arg, _prm, _stm, _r) {
		return arg.parametersOf;
	},
	BlockWithoutAnnotations(_l, arg, _prm, _stm, _r) {
		return arg.parametersOf;
	},
	RecordInitializerItem(lhs, rhs) {
		return [
			rewrite.dropLastLetter(lhs.sourceString),
			rhs.sourceString,
		];
	},

	_iter(...children) {
		if (children.length === 0) {
			return [];
		} else if (children.length === 1) {
			return children[0].parametersOf;
		} else {
			throw new Error('rewrite_spl_core: parametersOf: _iter?');
		}
	},
};

slSemantics.addAttribute('parametersOf', parametersOf);

export function rewriteSlToCore(slText: string): string {
	const slCoreText = slParse(slText).asSl;
	// console.debug('rewriteSlToCore', slText, slCoreText);
	return slCoreText;
}
