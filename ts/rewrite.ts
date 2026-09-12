import ohm from 'https://unpkg.com/ohm-js@17.1.0/dist/ohm.esm.js';

import { arraySum } from '../lib/jssc3/ts/kernel/array.ts';

import { slParse, slSemantics } from './grammar.ts';
import { resolveMethodName } from './operator.ts';
import { slOptions } from './options.ts';

export const context = {
	packageName: '*UnknownPackage*',
	packageSymCounter: 0,
	methodBodyInitialSourceTable: new Map(), // key=core,value=initial
};

function deleteUnderscores(text: string): string {
	return text.replaceAll('_', '');
}

function deleteLeadingZeroes(s: string): string {
	return s.replace(/^0+(?!\.|$)/, '');
}

function isArityQualifiedName(s: string): boolean {
	return s.includes(':/');
}

function initContext(name: string): void {
	// console.debug('initContext');
	context.packageName = name;
	context.packageSymCounter = 0;
	context.methodBodyInitialSourceTable.clear();
}

function genPackageSym(prefix: string): string {
	context.packageSymCounter += 1;
	const sym = `${prefix}${context.packageSymCounter}`;
	// console.debug(`genPackageSym: ${sym}`);
	return sym;
}

function genVarSym(): string {
	return genPackageSym('__SplVar');
}

function genName(name: string, arity: number): string {
	return `${name}_${arity}`;
}

/*
let genSymCounter = 0;

function genSym(prefix: string): string {
	genSymCounter += 1;
	return `${prefix}${genSymCounter}`;
}
*/

function genArityCheck(k: number, a: string): string {
	return [
		'/* ArityCheck */',
		`if(arguments.length !== ${k}) {`,
		`	const errorMessage = 'Arity: expected ${k}, ${a}';`,
		'	throw new Error(errorMessage);',
		'}',
	].join('\n');
}

// nList = names, bList = bodies
function rewriteMethodListToCore(nList: ohm.Node, bList: ohm.Node): string[] {
	const nArray = nList.children;
	const bArray = bList.children;
	const k = nArray.length;
	const answer = [];
	for (let i = 0; i < k; i++) {
		const n = nArray[i];
		const nResolved = n.asSl;
		const b = bArray[i];
		const bInitial = b.sourceString;
		const bCore = b.asSl;
		context.methodBodyInitialSourceTable.set(bCore, bInitial);
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
	methodNames: ohm.Node[],
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
		 /* Equivalent to ExpressionInitializer after simplifier, required as grammar is reused */
		return `${name.asJs} = ${blk.asJs}`;
	},
	EmptyListSyntax(_l, _r) {
		return '[]';
	},
	ExpressionInitializer(name, _e, exp) {
		return `${name.asJs} = ${exp.asJs}`;
	},
	FinalStatement(e) {
		return `return ${e.asJs};`;
	},
	LetBinding(_let, tmp) {
		return `let ${tmp.asJs}`;
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
			mn.children,
			mb.children,
		);
	},
	NonEmptyListSyntax(_leftBracket, items, _rightBracket) {
		return `[${commaListJs(items.asIteration().children)}]`;
	},
	NonEmptyParameterList(_l, sq, _r) {
		return commaListJs(sq.asIteration().children);
	},
	NonFinalStatement(e, _semicolon) {
		return `${e.asJs};`;
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
	Statements(nonFinal, final) {
		return nonFinal.asJs + final.asJs;
	},
	TraitDefinition(nm, _l, mn, mb, _r) {
		const unqualifiedTraitName = nm.sourceString.substring(1);
		const trait =
			`sl.addTrait('${unqualifiedTraitName}', '${context.packageName}');\n`;
		const mth = makeMethodList(
			'addMethodToExistingTrait',
			[unqualifiedTraitName],
			mn.children,
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
			mn.children,
			mb.children,
		);
	},
	ValueApply(p, _d, a) {
		return `${p.asJs}(${a.asJs})`;
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
	floatLiteral(s, i, _, f) {
		return `${s.sourceString}${i.sourceString}.${f.sourceString}`;
	},
	infinityLiteral(s, i) {
		return s.sourceString + i.sourceString;
	},
	smallIntegerLiteral(s, i) {
		// Allow 03 for 3 and -03 for -3
		const x = parseInt(deleteUnderscores(i.sourceString));
		if (Number.isSafeInteger(x)) {
			return `${s.sourceString + x}`;
		} else {
			throw new Error('smallIntegerLiteral: not small integer: ' + x);
		}
	},
	largeIntegerLiteral(s, i, _l) {
		const sT = s.sourceString;
		let iT = deleteLeadingZeroes(i.sourceString);
		return `${sT}${iT}n`;
	},
	lowercaseIdentifier(c1, cN) {
		return `_${c1.sourceString}${cN.sourceString}`;
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
		return genPackageSym('__SplUnused');
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
		return `${rcv.asSl}(${arg.asSl})`;
	},
	ApplyWithTrailingClosuresSyntax(name, args, trailing) {
		return `${name.asSl}(${
			commaListSl(args.children.concat(trailing.children))
		})`;
	},
	Arguments(a, _p) {
		return a.children.map((x) => x.asSl).join(' ');
	},
	AtAllSyntax(c, i) {
		return `atAll(${c.asSl}, ${i.asSl})`;
	},
	AtPutSyntax(c, _l, k, _r, _e, v) {
		return `atPut(${c.asSl}, ${k.asSl}, ${v.asSl})`;
	},
	AtSyntax(c, _l, k, _r) {
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
		let nameStr = name.asSl;
		if(isArityQualifiedName(nameStr)) {
			return `${nameStr} = ${blk.asSl}`;
		} {
			let blkArity = blk.parametersOf.length;
			return `${nameStr}:/${blkArity} = ${blk.asSl}`;
		}
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
		return `${name.asSl}(${
			commaListSl([lhs].concat(args.children, trailing.children))
		})`;
	},
	EmptyListSyntax(_l, _r) {
		return '[]';
	},
	EmptyRecordSyntax(_l, _c, _r) {
		return 'Record()';
	},
	ExpressionInitializer(name, _e, exp) {
		return `${name.asSl} = ${exp.asSl}`;
	},
	FinalStatement(e) {
		return e.asSl;
	},
	LetBinding(_l, tmp) {
		return `let ${tmp.asSl}`;
	},
	LibraryItemLiteral(_l, aRecord) {
		return `LibraryItem ${aRecord.asSl}`;
	},
	ListAssignment(_l, lhs, _r, _e, rhs) {
		const namesArray = lhs.asIteration().children.map((c) => c.asSl);
		const rhsListName = genVarSym();
		const slots = namesArray.map(
			(name, index) => `${name} := at(${rhsListName}, ${index + 1})`,
		).join('; ');
		return `({ let ${rhsListName} = ${rhs.asSl}; ${slots} } . ())`;
	},
	ListConstructorSyntax(typ, lst) {
		return `${typ.asSl}(${lst.asSl})`;
	},
	ListInitializer(_l, lhs, _r, _e, rhs) {
		const namesArray = lhs.asIteration().children.map((c) => c.asSl);
		const rhsName = genVarSym();
		const slots = namesArray.map(
			(name, index) => `let ${name} = at(${rhsName}, ${index + 1})`,
		).join('; ');
		return `${rhsName} = assertIsOfSize(${rhs.asSl}, ${namesArray.length}); ${slots}`;
	},
	ListRangeFromToSyntax(_leftBracket, i, _dots, j, _rightBracket) {
		return `listRange(${i.asSl}, ${j.asSl})`;
	},
	ListRangeFromThenToSyntax(_leftBracket, i, _comma, j, _dots, k, _rightBracket) {
		return `listThenTo(${i.asSl}, ${j.asSl}, ${k.asSl})`;
	},
	ListRangeFromToBySyntax(_leftBracket, i, _comma, j, _semicolon, k, _rightBracket) {
		return `listRange(${i.asSl}, ${j.asSl}, ${k.asSl})`;
	},
	MatrixSyntax(_l, items, _r) {
		return `[${commaListSl(items.asIteration().children)}]`;
	},
	MatrixSyntaxItems(items) {
		return `[${commaListSl(items.children)}]`;
	},
	MethodNameList(_l, items, _r) {
		return `[${commaListSl(items.asIteration().children)}]`
	},
	MethodDefinitions(_p, _l, n, _r, _lc, mn, mb, _rc) {
		const begin = `+[${n.sourceString}] {`;
		const middle = rewriteMethodListToCore(mn, mb);
		const end = '}\n';
		return [begin, middle, end].flat().join('\n');
	},
	NonEmptyListSyntax(_l, items, _r) {
		return `[${commaListSl(items.asIteration().children)}]`;
	},
	NonEmptyParameterList(_leftParen, sq, _rightParen) {
		return commaListSl(sq.asIteration().children);
	},
	NonEmptyRecordSyntax(_l, d, _r) {
		return `Record([${commaListSl(d.asIteration().children)}])`;
	},
	NonFinalStatement(e, _semicolon) {
		return `${e.asSl};`;
	},
	NonScalarListSyntax(_l, initial, _c, items, _r) {
		return `[${initial.asSl}, ${commaListSl(items.asIteration().children)}]`;
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
	Statements(nonFinal, final) {
		return nonFinal.asSl + final.asSl;
	},
	UncheckedSlotReadSyntax(c, _colons, k) {
		return `uncheckedSlotRead(${c.asSl}, '${k.sourceString}')`;
	},
	UncheckedSlotWriteSyntax(c, _colons, k, _equals, v) {
		return `uncheckedSlotWrite(${c.asSl}, '${k.sourceString}', ${v.asSl})`;
	},
	RangeFromToSyntax(_leftParenthesis, i, _dots, j, _rightParenthesis) {
		return `Range(${i.asSl}, ${j.asSl})`;
	},
	RangeFromThenToSyntax(_leftParenthesis, i, _comma, j, _dots, k, _rightParenthesis) {
		return `thenTo(${i.asSl}, ${j.asSl}, ${k.asSl})`;
	},
	RangeFromToBySyntax(_leftParenthesis, i, _dots, j, _semicolon, k, _rightParenthesis) {
		return `Range(${i.asSl}, ${j.asSl}, ${k.asSl})`;
	},
	RecordAssignment(_l, lhs, _r, _e, rhs) {
		const rhsDictionaryName = genVarSym();
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
	RecordConstructorSyntax(typ, rcd) {
		return `${typ.asSl}(${rcd.asSl})`;
	},
	RecordInitializer(_l, lhs, _r, _e, rhs) {
		const rhsDictionaryName = genVarSym();
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
		return `Tuple([${commaListSl(items.asIteration().children)}])`;
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
	ValueApply(p, _d, a) {
		return `${p.asSl} . (${a.asSl})`;
	},
	VarDeclaration(_var, tmp, _sc) {
		let f = (x) => `let ${x.sourceString} = nil;`;
		return procList(tmp.asIteration().children, f, ' ');
	},
	VectorSyntax(_l, i, _r) {
		return `[${commaListSl(i.children)}]`;
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
	floatDecimalLiteral(s, i, _, f, _d, k) {
		const sT = s.sourceString;
		const iT = i.sourceString;
		const fT = f.sourceString;
		let kT = k.sourceString;
		const e = 10n ** BigInt(fT.length);
		if (kT.length === 0) {
			kT = fT.length;
		}
		return `Decimal(Fraction(${sT}${iT}${fT}L, ${e.toString(10)}L), ${kT})`;
		/* return `parseDecimal('${s.sourceString}${i.sourceString}.${f.sourceString}D${k.sourceString}')`; */
	},
	floatLiteral(s, i, _dot, f) {
		return s.sourceString +
			deleteLeadingZeroes(deleteUnderscores(i.sourceString)) + '.' +
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
	integerDecimalLiteral(s, i, _d, k) {
		const sT = s.sourceString;
		const iT = i.sourceString;
		let kT = k.sourceString;
		if (kT.length === 0) {
			kT = 0;
		}
		return `Decimal(Fraction(${sT}${iT}L, 1L), ${kT})`;
		/* return `parseDecimal('${s.sourceString}${i.sourceString}D${k.sourceString}')`; */
	},
	smallIntegerLiteral(s, i) {
		return s.sourceString + i.sourceString;
	},
	recordKeyToken(n, _c) {
		return n.sourceString;
	},
	largeIntegerLiteral(s, i, _l) {
		return s.sourceString + deleteUnderscores(i.sourceString) + 'L';
	},
	lowercaseIdentifier(c1, cN) {
		return c1.sourceString + cN.sourceString;
	},
	nanLiteral(x) {
		return x.sourceString;
	},
	negatedIdentifier(_n, i) {
		return `negate(${i.asSl})`;
	},
	operator(op) {
		const opName = resolveMethodName(op.sourceString);
		// console.debug(`operator: ${opName}`);
		return opName;
	},
	operatorBound(op) {
		const opName = resolveMethodName(op.sourceString);
		// console.debug(`operatorBound: ${opName}`);
		return opName;
	},
	operatorFree(op) {
		const opName = resolveMethodName(op.sourceString);
		const qualifiedOpName = `${opName}:/2`;
		// console.debug(`operatorFree: ${qualifiedOpName}`);
		return qualifiedOpName;
	},
	operatorWithUnaryAdverb(op, _d, adverb) {
		const opName = resolveMethodName(op.sourceString);
		const qualifiedOpName = `${opName}:/2`;
		// console.debug(`operatorWithUnaryAdverb: ${qualifiedOpName}`);
		return `${adverb.sourceString}(${qualifiedOpName})`;
	},
	operatorWithBinaryAdverb(op, _d, adverb, _l, parameter, _r) {
		const opName = resolveMethodName(op.sourceString);
		const qualifiedOpName = `${opName}:/2`;
		// console.debug(`operatorWithBinaryAdverb: ${qualifiedOpName}`);
		return `${adverb.sourceString}(${qualifiedOpName}, ${parameter.asSl})`;
	},
	radixIntegerLiteral(s, b, _r, i) {
		const r = Number.parseInt(
			s.sourceString + deleteUnderscores(i.sourceString),
			Number.parseInt(b.sourceString, 10),
		);
		if (Number.isNaN(r)) {
			throw new Error('radixIntegerLiteral: invalid literal');
		}
		return r.toString(10);
	},
	rangeFromToByLiteral(start, _colon, end, _anotherColon, step) {
		return `rangeOrRelativeRange(${start.asSl}, ${end.asSl}, ${step.asSl})`;
	},
	rangeFromToLiteral(start, _colon, end) {
		return `rangeOrRelativeRange(${start.asSl}, ${end.asSl}, 1)`;
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
	ScalarAssignment(lhs, _e, rhs) {
		return ['Assignment', [lhs.asAst], [rhs.asAst]].flat(1);
	},
	Statements(nonFinal, final) {
		return nonFinal.children.map((x) => x.asAst).concat([final.asAst]);
	},
	ValueApply(p, _d, a) {
		return [
			'Apply',
			[p.asAst].concat(
				a.asAst
			)
		];
	},

	argumentName(_, x) {
		return ['Identifier', x.sourceString];
	},
	arityQualifiedIdentifier(c1, cN, _s, a) {
		return ['Identifier', c1.sourceString + cN.sourceString + ':/' + a.sourceString];
	},
	floatLiteral(s, i, _, f) {
		const x = s.sourceString + i.sourceString + '.' + f.sourceString;
		return ['SmallFloat', x];
	},
	infinityLiteral(s, i) {
		return ['SmallFloat', s.sourceString + i.sourceString];
	},
	smallIntegerLiteral(s, i) {
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

function procList(nodeArray: ohm.Node[], fn: (x: ohm.Node) => string, sep: string): string {
	return nodeArray.map(fn).join(sep);
}

function commaList(nodeArray: ohm.Node[], fn: (x: ohm.Node) => string): string {
	return procList(nodeArray, fn, ', ');
}

function commaListJs(nodeArray: ohm.Node[]): string {
	return commaList(nodeArray, (e) => e.asJs);
}

function commaListSl(nodeArray: ohm.Node[]): string {
	return commaList(nodeArray, (e) => e.asSl);
}

function makeMethod(
	slProc: string,
	typeOrTraitNameArray: string[],
	methodName: ohm.Node,
	methodBlock: ohm.Node,
): string {
	const blkCoreSource = methodBlock.sourceString;
	const blkInitialSource = context.methodBodyInitialSourceTable.get(
		blkCoreSource,
	);
	const blkParameters = methodBlock.parametersOf;
	const blkJs = methodBlock.asJs;
	const blkSrc = JSON.stringify(blkInitialSource);
	// console.debug('makeMethod', slProc, methodName, blkParameters, context.packageName);
	return typeOrTraitNameArray.map(function (typeOrTraitName) {
		// console.debug('makeMethod', typeOrTraitName);
		return `sl.${slProc}(\n\t'${typeOrTraitName}',\n\t'${context.packageName}',\n\t'${methodName}',\n\t${
			JSON.stringify(blkParameters)
		},\n\t${blkJs},\n\t${blkSrc}\n);\n\n`;
	}).join('\n');
}

function extractMethodNameList(methodNameOrList: ohm.Node): string[] {
	if (methodNameOrList.ctorName === 'MethodNameList') {
		return methodNameOrList.child(1).asIteration().children.map((c) =>
			c.sourceString
		);
	}
	{
		return [methodNameOrList.sourceString];
	}
}

function makeMethodList(
	slProc: string,
	typeOrTraitNameArray: string[],
	methodNames: ohm.Node[],
	methodBlocks: ohm.Node[],
): string {
	let methodList = '';
	while (methodNames.length > 0) {
		const methodNameList = extractMethodNameList(methodNames.shift()!.child(0));
		const methodBlock = methodBlocks.shift()!;
		// console.debug('makeMethodList', methodNameList);
		for (const methodName of methodNameList) {
			const methodSource = makeMethod(
				slProc,
				typeOrTraitNameArray,
				methodName,
				methodBlock,
			);
			// console.debug(`makeMethodList: ${methodSource}`);
			methodList += methodSource;
		}
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
	// console.debug(`rewriteSlToCore: Sl=(${slText}) ==> Core=(${slCoreText})`);
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
	// console.debug(`rewriteSlToJs: Sl=(${slText}) => Core=(${slCoreText}) => Js=(${jsText})`);
	const slComment = slFirstLineComment(slText);
	if (slComment) {
		return `/* ${slComment} */\n\n` + jsText;
	} else {
		return jsText;
	}
}

export function rewriteSlToJsFor(packageName: string, slText: string): string {
	let jsText: string;
	initContext(packageName);
	try {
		jsText = rewriteSlToJs(slText);
		initContext('*UnknownPackage*');
		return jsText;
	} catch (err) {
		initContext('*UnknownPackage*');
		// console.debug('rewriteSlToJsFor', packageName, slText, err);
		throw new Error('rewriteSlToJsFor: Rewrite failed: ', { cause: err });
	}
}
