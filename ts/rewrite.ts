import ohm from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';

import { arraySum } from '../lib/jssc3/ts/kernel/array.ts';

import { slParse, slSemantics } from './grammar.ts';
import { resolveMethodName } from './operator.ts';
import { slOptions } from './options.ts';

export const context = { packageName: 'UnknownPackage' };

function genName(name: string, arity: number): string {
	return `${resolveMethodName(name)}_${arity}`;
}

function genArityCheck(k: number, a: string): string {
	return [
		`if(arguments.length !== ${k}) {`,
		`const errorMessage = 'Arity: expected ${k}, ${a}';`,
		'/* console.error(errorMessage); */',
		'throw new Error(errorMessage);',
		'}\n',
	].join(' ');
}

function genDotTrailing(
	lhs: ohm.Node,
	name: ohm.Node,
	args: ohm.Node,
	trailing: ohm.Node,
) {
	const qualifiedName = `${
		genName(name.asJs, 1 + args.arityOf + trailing.children.length)
	}`;
	const argsJs = args.children.map((each) => each.asJs);
	const trailingJs = trailing.children.map((each) => each.asJs);
	return `${qualifiedName}(${[lhs.asJs].concat(argsJs, trailingJs)})`;
}

function genApplyTrailing(rcv: ohm.Node, arg: ohm.Node, trailing: ohm.Node) {
	const opt = arg.asJs;
	const name = `${genName(rcv.asJs, arg.arityOf + trailing.children.length)}`;
	return `${name}(${opt === '' ? '' : opt + ', '} ${
		commaList(trailing.children)
	})`;
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
sl.copyTraitToType(
	${traitName},
	'${typeName}'
);`).join('\n');
	const addMethods = makeMethodList(
		'addMethod',
		[typeName],
		methodNames,
		methodBlocks,
	);
	return `${addType}\n\n${copyTraits}\n\n${addMethods}\n`;
}

function genRange(start: ohm.Node, end: ohm.Node): string {
	// console.debug('genRange');
	return `_${genName('upOrDownTo', 2)}(${start.asJs}, ${end.asJs})`;
}

function genListRange(start: ohm.Node, end: ohm.Node): string {
	// console.debug('genListRange');
	return `_${genName('asList', 1)}(${genRange(start, end)})`;
}

const asJs: ohm.ActionDict<string> = {
	TypeExtension(
		_plus,
		typeName,
		_leftBrace,
		methodName,
		methodBlock,
		_rightBrace,
	) {
		return makeMethodList(
			'addMethod',
			[typeName.sourceString],
			methodName.children.map((c) => c.sourceString),
			methodBlock.children,
		);
	},
	TypeListExtension(
		_plus,
		_leftBracket,
		typeNameList,
		_rightBracket,
		_leftBrace,
		methodName,
		methodBlock,
		_rightBrace,
	) {
		const typeNameArray = typeNameList.asIteration().children.map((c) =>
			c.sourceString
		);
		// console.debug(`TypeListExtension: [${typeNameArray}].size = ${typeNameArray.length}`);
		return makeMethodList(
			'addMethod',
			typeNameArray,
			methodName.children.map((c) => c.sourceString),
			methodBlock.children,
		);
	},
	TypeDefinition(
		typeName,
		trait,
		_leftBrace,
		instanceVariables,
		methodName,
		methodBlock,
		_rightBrace,
	) {
		return makeTypeDefinition(
			false,
			typeName.sourceString,
			trait.asJs,
			instanceVariables.asJs,
			methodName.children.map((c) => c.sourceString),
			methodBlock.children,
		);
	},
	HostTypeDefinition(
		typeName,
		_isHostType,
		trait,
		_leftBrace,
		instanceVariables,
		methodName,
		methodBlock,
		_rightBrace,
	) {
		return makeTypeDefinition(
			true,
			typeName.sourceString,
			trait.asJs,
			instanceVariables.asJs,
			methodName.children.map((c) => c.sourceString),
			methodBlock.children,
		);
	},
	TraitList(_colon, _leftBracket, names, _rightBracket) {
		return names.asIteration().children.map((c) => `'${c.sourceString}'`).join(
			', ',
		);
	},
	TraitExtension(
		_plus,
		_at,
		traitName,
		_leftBrace,
		methodName,
		methodBlock,
		_rightBrace,
	) {
		// console.debug(`TraitExtension: ${traitName.sourceString}`);
		return makeMethodList(
			'extendTraitWithMethod',
			[traitName.sourceString],
			methodName.children.map((c) => c.sourceString),
			methodBlock.children,
		);
	},
	TraitListExtension(
		_plus,
		_at,
		_leftBracket,
		traitNameList,
		_rightBracket,
		_leftBrace,
		methodName,
		methodBlock,
		_rightBrace,
	) {
		const traitNameArray = traitNameList.asIteration().children.map((c) =>
			c.sourceString
		);
		// console.debug(`TraitListExtension: [${traitNameArray}].size = ${traitNameArray.length}`);
		return makeMethodList(
			'extendTraitWithMethod',
			traitNameArray,
			methodName.children.map((c) => c.sourceString),
			methodBlock.children,
		);
	},
	TypeTypeExtension(
		_plus,
		typeName,
		_caret,
		_leftBrace,
		methodName,
		methodBlock,
		_rightBrace,
	) {
		// console.debug(`TypeTypeExtension: ${typeName.sourceString}`);
		return makeMethodList(
			'addMethod',
			[typeName.sourceString + '^'],
			methodName.children.map((c) => c.sourceString),
			methodBlock.children,
		);
	},
	TraitDefinition(
		_at,
		traitName,
		_leftBrace,
		methodName,
		methodBlock,
		_rightBrace,
	) {
		const trait =
			`sl.addTrait('${traitName.sourceString}', '${context.packageName}');\n`;
		const mth = makeMethodList(
			'addTraitMethod',
			[traitName.sourceString],
			methodName.children.map((c) => c.sourceString),
			methodBlock.children,
		);
		return `${trait}\n${mth}\n`;
	},
	ConstantDefinition(_constant, _dot_, name, _equals, value) {
		return `globalThis._${name.sourceString} = ${value.asJs};\n`;
	},
	Program(tmp, stm) {
		return tmp.asJs + stm.asJs;
	},
	/*	TemporariesWithInitializers(
		_leftVerticalBar,
		tmp,
		_semiColon,
		_rightVerticalBar,
	) {
		return `let ${commaList(tmp.asIteration().children)};\n`;
	},*/
	TemporaryBlockLiteralInitializer(name, _equals, blk) {
		const unqualifiedName = name.asJs;
		const qualifiedName = `${
			genName(unqualifiedName, blk.parametersOf.length)
		}`; // blk.arityOf
		const binding = `${qualifiedName} = ${blk.asJs}`;
		const reBinding = slOptions.multipleNamesForLocalBlocks
			? `, ${unqualifiedName} = ${qualifiedName}`
			: '';
		// console.debug(`TemporaryWithBlockLiteralInitializer: ${reBinding}`);
		return `${binding}${reBinding}`;
	},
	TemporaryExpressionInitializer(name, _equals, exp) {
		return `${name.asJs} = ${exp.asJs}`;
	},
	TemporaryDictionaryInitializer(
		_leftParen,
		lhs,
		_rightParen,
		_equals,
		rhs,
	) {
		const namesArray = lhs.asIteration().children.map((c) => c.sourceString);
		const rhsName = genSym();
		const slots = namesArray.map((name) =>
			`_${name} = _${genName('at', 2)}(${rhsName}, '${name}')`
		).join(', ');
		return `${rhsName} = ${rhs.asJs}, ${slots}`;
	},
	TemporaryListInitializer(
		_leftBracket,
		lhs,
		_rightBracket,
		_equals,
		rhs,
	) {
		const namesArray = lhs.asIteration().children.map((c) => c.asJs);
		const rhsName = genSym();
		const slots = namesArray.map((name, index) =>
			`${name} = _${genName('at', 2)}(${rhsName}, ${index + 1})`
		).join(', ');
		// console.debug('TemporaryListInitializer', namesArray, rhsName);
		return `${rhsName} = _assertIsOfSize_2(${rhs.asJs}, ${namesArray.length}), ${slots}`;
	},
	SlotNames(_leftVerticalBar, slots, _rightVerticalBar) {
		// Space separated list of quoted names for internal use only, see makeTypeDefinition
		return slots.children.map((e) => `'${e.sourceString}'`).join(' ');
	},
	VarTemporaries(_var, tmp, _semicolon) {
		return `let ${commaList(tmp.asIteration().children)};`;
	},
	LetTemporary(_let, tmp, _semicolon) {
		return `let ${tmp.asJs};`;
	},
	LetTemporaries(_var, tmp, _semicolon) {
		return `let ${commaList(tmp.asIteration().children)};`;
	},
	ScalarAssignment(lhs, _colonEquals, rhs) {
		return `${lhs.asJs} = ${rhs.asJs}`;
	},
	ListAssignment(_leftBracket, lhs, _rightBracket, _colonEquals, rhs) {
		const namesArray = lhs.asIteration().children.map((c) => c.asJs);
		const rhsListName = genSym();
		const slots = namesArray.map((name, index) =>
			`${name} = _${genName('at', 2)}(${rhsListName}, ${index + 1})`
		).join(';\n');
		// console.debug('ListAssignment', namesArray, rhsListName);
		return `/* List Assignment */(function() {\n\tconst ${rhsListName} = ${rhs.asJs};\n\t${slots};\n})()`;
	},
	DictionaryAssignment(_leftParen, lhs, _rightParen, _colonEquals, rhs) {
		const namesArray = lhs.asIteration().children.map((c) => c.sourceString);
		const rhsDictionaryName = genSym();
		const slots = namesArray.map((name) =>
			`_${name} = _${genName('at', 2)}(${rhsDictionaryName}, '${name}')`
		).join(';\n');
		return `/* DictionaryAssignment */\n(function() {\n\tconst ${rhsDictionaryName} = ${rhs.asJs};\n\t${slots};\n})()`;
	},
	AssignmentOperatorSyntax(lhs, op, rhs) {
		const text =
			`${lhs.sourceString} := ${lhs.sourceString} ${op.asJs} (${rhs.sourceString})`;
		return rewriteString(text);
	},
	infixMethod(name, _colon) {
		return `_${genName(name.sourceString, 2)}`;
	},
	operator(op) {
		return `_${genName(op.sourceString, 2)}`;
	},
	boundOperator(op) {
		const name = `_${resolveMethodName(op.sourceString)}`;
		// console.debug('boundOperator', name);
		return name;
	},
	operatorWithUnaryAdverb(op, _dot, adverb) {
		// console.debug(`operatorWithAdverb: ${op.sourceString} ${adverb.sourceString}`);
		return `_${genName(adverb.sourceString, 1)}(_${
			genName(op.sourceString, 2)
		})`;
	},
	operatorWithBinaryAdverb(
		op,
		_dot,
		adverb,
		_openParen,
		parameter,
		_closeParen,
	) {
		// console.debug(`operatorWithAdverb: ${op.sourceString} ${adverb.sourceString}`);
		return `_${genName(adverb.sourceString, 2)}(
			_${genName(op.sourceString, 2)},
			${parameter.asJs}
		)`;
	},
	BinaryExpression(lhs, ops, rhs) {
		let left = lhs.asJs;
		const opsArray = ops.children.map((c) => c.asJs);
		const rhsArray = rhs.children.map((c) => c.asJs);
		while (opsArray.length > 0) {
			const op = opsArray.shift();
			const right = rhsArray.shift();
			left = `${op}(${left}, ${right})`;
		}
		return left;
	},

	AtPutSyntax(c, _leftBracket, k, _rightBracket, _equals, v) {
		const elem = k.asIteration().children;
		return `_${genName('atPut', 2 + elem.length)}(${c.asJs}, ${
			commaList(elem)
		}, ${v.asJs})`;
	},
	QuotedAtPutSyntax(c, _colonColon, k, _colonEquals, v) {
		return `_${genName('atPut', 3)}(${c.asJs}, '${k.sourceString}', ${v.asJs})`;
	},
	AtPutDelegateSyntax(c, _colonDot, k, _colonEquals, v) {
		return `_${
			genName('atPutDelegateTo', 4)
		}(${c.asJs}, '${k.sourceString}', ${v.asJs}, 'parent')`;
	},
	AtSyntax(c, _leftBracket, k, _rightBracket) {
		const elem = k.asIteration().children;
		return `_${genName('at', 1 + elem.length)}(${c.asJs}, ${commaList(elem)})`;
	},
	AtIfAbsentSyntax(c, _leftBracket, k, _rightBracket, _colonQuery, a) {
		return `_${genName('atIfAbsent', 3)}(${c.asJs}, ${k.asJs}, ${a.asJs})`;
	},
	AtIfAbsentPutSyntax(c, _leftBracket, k, _rightBracket, _colonQueryEquals, a) {
		return `_${genName('atIfAbsentPut', 3)}(${c.asJs}, ${k.asJs}, ${a.asJs})`;
	},
	QuotedAtSyntax(c, _colonColon, k) {
		return `_${genName('at', 2)}(${c.asJs}, '${k.sourceString}')`;
	},
	QuotedAtIfAbsentSyntax(c, _colonColon, k, _colonQuery, a) {
		return `_${
			genName('atIfAbsent', 3)
		}(${c.asJs}, '${k.sourceString}', ${a.asJs})`;
	},
	QuotedAtIfAbsentPutSyntax(c, _colonColon, k, _colonQueryEquals, a) {
		return `_${
			genName('atIfAbsentPut', 3)
		}(${c.asJs}, '${k.sourceString}', ${a.asJs})`;
	},
	ReadSlotSyntax(c, _colonArrow, k) {
		return `${c.asJs}['${k.sourceString}']`;
	},
	WriteSlotSyntax(c, _colonArrow, k, _colonEquals, v) {
		return `${c.asJs}['${k.sourceString}'] = ${v.asJs}`;
	},
	MessageSendSyntax(d, _colonDot, k, a) {
		return `_${
			genName('messageSend', 4)
		}(${d.asJs}, '${k.sourceString}', 'parent', [${
			a.children.map((c) => c.asJs)
		}])`;
	},
	ValueApply(p, _dot, a) {
		return `${p.asJs}(${a.asJs})`;
	},
	NonEmptyParameterList(_leftParen, sq, _rightParen) {
		return commaList(sq.asIteration().children);
	},

	DotExpressionWithTrailingClosuresSyntax(lhs, _dot, name, args, trailing) {
		return genDotTrailing(lhs, name, args, trailing);
	},
	DotExpressionWithTrailingDictionariesSyntax(lhs, _dot, name, args, trailing) {
		return genDotTrailing(lhs, name, args, trailing);
	},
	DotExpressionWithAssignmentSyntax(lhs, _dot, name, _colonEquals, rhs) {
		return `${genName(name.asJs, 2)}(${lhs.asJs}, ${rhs.asJs})`;
	},
	DotExpression(lhs, _dot, names, args) {
		let rcv = lhs.asJs;
		const namesArray = names.children.map((c) => c.asJs);
		const argsArray = args.children.map((c) => c.asJs);
		const arityArray = args.children.map((c) => c.arityOf);
		while (namesArray.length > 0) {
			const name = namesArray.shift();
			const arg = argsArray.shift();
			const arity = arityArray.shift();
			if (arg.length === 0) {
				rcv = `${genName(name, 1)}(${rcv})`;
			} else {
				rcv = `${genName(name, 1 + arity)}(${[rcv].concat([arg])})`;
			}
		}
		return rcv;
	},

	Block(_leftBrace, blockBody, _rightBrace) {
		return blockBody.asJs;
	},
	BlockBody(arg, tmp, prm, stm) {
		const tmpJs = tmp.asJs;
		const prmJs = prm.asJs;
		const stmJs = stm.asJs;
		let arityCheck = '';
		if (slOptions.insertArityCheck) {
			/* console.error(${JSON.stringify(stm.sourceString)});  */
			arityCheck = [
				'/* ArityCheck */',
				genArityCheck(arg.arityOf, arg.asJs),
			].join('\n');
		}
		return [
			`(function(${arg.asJs}) {\n`,
			arityCheck,
			(tmpJs.length > 0) ? ('/* Temporaries */\n' + tmpJs + '\n') : '',
			(prmJs.length > 0) ? ('/* Primitive */\n' + prmJs + '\n') : '',
			(stmJs.length > 0) ? ('/* Statements */\n' + stmJs + '\n') : '',
			'})',
		].join('');
	},
	Arguments(arg, _verticalBar) {
		return commaList(arg.children);
	},
	ArgumentName(_colon, name) {
		return name.asJs;
	},
	Primitive(_beginPrimitive, s, _endPrimitive) {
		return s.sourceString;
	},
	NonFinalExpression(e, _semicolon, stm) {
		return `${e.asJs}; ${stm.asJs};`;
	},
	FinalExpression(e) {
		return `return ${e.asJs};`;
	},

	ApplyWithTrailingClosuresSyntax(rcv, arg, trailing) {
		return genApplyTrailing(rcv, arg, trailing);
	},
	ApplyWithTrailingDictionariesSyntax(rcv, arg, trailing) {
		return genApplyTrailing(rcv, arg, trailing);
	},
	ApplySyntax(rcv, arg) {
		return `${genName(rcv.asJs, arg.arityOf)}(${arg.asJs})`;
	},
	ParameterList(_leftParen, sq, _rightParen) {
		return commaList(sq.asIteration().children);
	},
	ParenthesisedExpression(_leftParen, e, _rightParen) {
		return `(${e.asJs})`;
	},
	DictionaryExpression(_leftParen, dict, _rightParen) {
		return `Object.fromEntries([${commaList(dict.asIteration().children)}])`;
	},
	NonEmptyDictionaryExpression(_leftParen, dict, _rightParen) {
		return `Object.fromEntries([${commaList(dict.asIteration().children)}])`;
	},
	NameAssociation(lhs, _colon, rhs) {
		return `['${lhs.sourceString}', ${rhs.asJs}]`;
	},
	StringAssociation(lhs, _colon, rhs) {
		return `[${lhs.sourceString}, ${rhs.asJs}]`;
	},
	ListExpression(_leftBracket, items, _rightBracket) {
		return `[${commaList(items.asIteration().children)}]`;
	},
	TupleExpression(_leftBracket, items, _rightBracket) {
		const elem = items.asIteration().children;
		// console.debug('TupleExpression', elem.length);
		return `_asTuple_1([${commaList(elem)}])`;
	},
	ListRangeSyntax(_leftBracket, start, _dotDot, end, _rightBracket) {
		return genListRange(start, end);
	},
	ListRangeThenSyntax(
		_leftBracket,
		start,
		_comma_,
		then,
		_dotDot,
		end,
		_rightBracket,
	) {
		return `_${genName('asList', 1)}(_${
			genName('thenTo', 3)
		}(${start.asJs}, ${then.asJs}, ${end.asJs}))`;
	},
	RangeSyntax(_leftParen, start, _dotDot, end, _rightParen) {
		return genRange(start, end);
	},
	RangeThenSyntax(
		_leftParen,
		start,
		_comma_,
		then,
		_dotDot,
		end,
		_rightParen,
	) {
		return `_${genName('thenTo', 3)}(${start.asJs}, ${then.asJs}, ${end.asJs})`;
	},
	EmptyListSyntax(_leftBracket, _rightBracket) {
		// console.debug('EmptyListSyntax');
		return '[]';
	},
	VectorSyntax(_leftBracket, items, _rightBracket) {
		// console.debug('VectorSyntax', items.sourceString);
		return `[${commaList(items.children)}]`;
	},
	VectorSyntaxUnarySend(lhs, _dot_, rhs) {
		return `${genName(rhs.asJs, 1)}(${lhs.asJs})`;
	},
	VectorSyntaxRange(start, _dotDot_, end) {
		return `_${genName('asList', 1)}(_${
			genName('upTo', 2)
		}(${start.asJs}, ${end.asJs}))`;
	},
	MatrixSyntax(_leftBracket, items, _rightBracket) {
		// console.debug('MatrixSyntax', items.sourceString);
		return `[${commaList(items.asIteration().children)}]`;
	},
	MatrixSyntaxItems(items) {
		return `[${commaList(items.children)}]`;
	},
	VolumeSyntax(_leftBracket, items, _rightBracket) {
		// console.debug('VolumeSyntax', items.sourceString);
		return `[${commaList(items.asIteration().children)}]`;
	},
	VolumeSyntaxItems(items) {
		return `[${commaList(items.asIteration().children)}]`;
	},
	TreeSyntax(_leftBracket, items, _rightBracket) {
		// console.debug('TreeSyntax', items.sourceString);
		return `[${commaList(items.children)}]`;
	},

	unusedVariableIdentifier(_underscore) {
		const identifier = genSym();
		// console.debug('unusedVariableIdentifier', identifier);
		return identifier;
	},
	unqualifiedIdentifier(c1, cN) {
		const identifier = `_${c1.sourceString}${cN.sourceString}`;
		// console.debug('unqualifiedIdentifier', identifier);
		return identifier;
	},
	arityQualifiedIdentifier(c1, cN, _aritySeparator, a) {
		const arityPart = `_${a.sourceString}`;
		const identifier = `_${c1.sourceString}${cN.sourceString}${arityPart}`;
		// console.debug('arityQualifiedIdentifier', identifier);
		return identifier;
	},
	uppercaseIdentifier(c1, cN) {
		const identifier = `_${c1.sourceString}${cN.sourceString}`;
		// console.debug('uppercaseIdentifier', identifier);
		return identifier;
	},
	lowercaseIdentifier(c1, cN) {
		const identifier = `_${c1.sourceString}${cN.sourceString}`;
		// console.debug('lowercaseIdentifier', identifier);
		return identifier;
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

	operatorAssignment(op, _colon, _equals) {
		return op.sourceString;
	},
	rangeFromByToLiteral(start, _colon, step, _anotherColon, end) {
		return `_${genName('toBy', 3)}(${start.asJs}, ${end.asJs}, ${step.asJs})`;
	},
	rangeFromToLiteral(start, _colon, end) {
		return genRange(start, end);
	},
	floatLiteral(s, i, _, f) {
		return `${s.sourceString}${i.sourceString}.${f.sourceString}`;
	},
	decimalLiteral(s, i, _, f, _d) {
		return `_parseDecimal_1('${s.sourceString}${i.sourceString}.${f.sourceString}')`;
	},
	scientificLiteral(base, _e, exponent) {
		return `${base.sourceString}e${exponent.sourceString}`;
	},
	fractionLiteral(sign, numerator, _divisor, denominator) {
		// console.debug('fractionLiteral', sign.sourceString, numerator.sourceString, denominator.sourceString);
		return `_Fraction_2(
			${sign.sourceString}${numerator.sourceString},
			${denominator.sourceString}
		)`;
	},
	complexLiteral(real, _j, imaginary) {
		// console.debug('complexLiteral', real.sourceString, imaginary.sourceString);
		return `_Complex_2(
			${real.sourceString},
			${imaginary.sourceString}
		)`;
	},
	residueLiteral(i, _z, m) {
		// console.debug('residueLiteral', i.sourceString, m.sourceString);
		return `_Residue_2(
			${i.sourceString},
			${m.sourceString}
		)`;
	},
	largeIntegerLiteral(s, i, _n) {
		return `${s.sourceString}${i.sourceString}n`;
	},
	radixIntegerLiteral(s, b, _r, i) {
		return `_assertIsSmallInteger_1(parseInt('${s.sourceString}${i.sourceString}', ${b.sourceString}))`;
	},
	integerLiteral(s, i) {
		// Allow 03 for 3 and -03 for -3
		return `${s.sourceString + parseInt(i.sourceString)}`;
	},
	constantNumberLiteral(k) {
		// console.debug('constantNumberLiteral: ', k.sourceString);
		return k.sourceString;
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return `'${quoteNewLines(s.sourceString)}'`;
	},
	doubleQuotedStringLiteral(_l, s, _r) {
		return `_${genName('DoubleQuotedString', 1)}("${s.sourceString}")`;
	},
	backtickQuotedStringLiteral(_l, s, _r) {
		return `_${genName('BacktickQuotedString', 1)}(\`${s.sourceString}\`)`;
	},

	NonemptyListOf(first, _sep, rest) {
		return `${first.asJs}; ${rest.children.map((c) => c.asJs)}`;
	},
	EmptyListOf() {
		return '';
	},
	_iter(...children) {
		return children.map((c) => c.asJs).join('');
	},
	_terminal() {
		return this.sourceString;
	},
};

slSemantics.addAttribute('asJs', asJs);

const arityOf: ohm.ActionDict<number> = {
	NonEmptyParameterList(_l, sq, _r) {
		return sq.asIteration().children.length;
	},
	ParameterList(_l, sq, _r) {
		return sq.asIteration().children.length;
	},
	/*
	Block(_l, blk, _r) {
		return blk.arityOf;
	},
	BlockBody(arg, tmp, prm, stm) {
		return arg.arityOf;
	},
	*/
	Arguments(names, _) {
		return names.children.length;
	},
	_iter(...children) {
		return arraySum(children.map((c) => c.arityOf));
	},
};

slSemantics.addAttribute('arityOf', arityOf);

const parametersOf: ohm.ActionDict<string[]> = {
	Block(_l, blk, _r) {
		return blk.parametersOf;
	},
	BlockBody(arg, _tmp, _prm, _stm) {
		return arg.parametersOf;
	},
	Arguments(names, _) {
		return names.children.map((each) => each.sourceString.substring(1));
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

function commaList(nodeArray: ohm.Node[]): string {
	return nodeArray.map((e) => e.asJs).join(', ');
}

let genSymCounter = 0;

function genSym() {
	genSymCounter += 1;
	return `__genSym${genSymCounter}`;
}

function makeMethod(
	slProc: string,
	typeNameArray: string[],
	methodName: string,
	methodBlock: ohm.Node,
): string {
	const blkSource = methodBlock.sourceString;
	const blkParameters = methodBlock.parametersOf;
	const blkJs = methodBlock.asJs;
	const blkSrc = JSON.stringify(blkSource);
	const slName = resolveMethodName(methodName);
	// console.debug('makeMethod', methodName, blkParameters);
	return typeNameArray.map(function (typeName) {
		// console.debug(`makeMethod: '${slProc}', '${typeName}', '${context.packageName}', '${methodName}'('${slName}'), ${blkParameters}`);
		return `sl.${slProc}(\n\t'${typeName}',\n\t'${context.packageName}',\n\t'${slName}',\n\t${
			JSON.stringify(blkParameters)
		},\n\t${blkJs},\n\t${blkSrc}\n);\n\n`;
	}).join('\n');
}

function makeMethodList(
	slProc: string,
	typeNameArray: string[],
	methodNames: string[],
	methodBlocks: ohm.Node[],
): string {
	let methodList = '';
	while (methodNames.length > 0) {
		const methodName = methodNames.shift()!;
		const methodBlock = methodBlocks.shift()!;
		const methodSource = makeMethod(
			slProc,
			typeNameArray,
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

// Preserve first line comment for Requires information in .cache
export function rewriteString(slText: string): string {
	const jsText = slParse(slText).asJs;
	// console.debug(`rewriteString: ${slText} => ${jsText}`);
	const slComment = slFirstLineComment(slText);
	if (slComment) {
		return `/* ${slComment} */\n\n` + jsText;
	} else {
		return jsText;
	}
}

export function rewriteStringFor(packageName: string, slText: string): string {
	let jsText: string;
	context.packageName = packageName;
	try {
		jsText = rewriteString(slText);
		context.packageName = '*UnknownPackage*';
		return jsText;
	} catch (err) {
		context.packageName = '*UnknownPackage*';
		// console.debug('rewriteStringFor', err);
		throw new Error('Rewrite failed', { cause: err });
	}
}
