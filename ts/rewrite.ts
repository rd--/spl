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
	return `if(arguments.length !== ${k}) {
	const errorMessage = 'Arity: expected ${k}, ${a}';
	/* console.error(errorMessage); */
	throw new Error(errorMessage);
}`;
}

// Spl allows both + and - as prefixes to number literals.
// This functions removes +, retains -, and reports errors.
function validateSign(x: string): string {
	if(x === '+') {
		return '';
	};
	if(x === '-') {
		return x;
	}
	if(x === '') {
		return x;
	}
	throw new Error('validateSign: invalid sign: ' + x);
}

function genDictionaryAssignmentSlots(rhsDictionaryName: string, keyVarNamesArray: string[]) {
	// console.debug('genDictionaryAssignmentSlots', rhsDictionaryName, keyVarNamesArray);
	const slots = keyVarNamesArray.map(
		function (keyVarNames) {
			const keyName = keyVarNames[0];
			const varName = keyVarNames[1];
			return `_${varName} = _${
				genName('at', 2)
			}(${rhsDictionaryName}, '${keyName}')`;
		},
	).join(', ');
	// console.debug('genDictionaryAssignmentSlots', slots);
	return slots;
}

function genDotTrailing(
	lhs: ohm.Node,
	name: ohm.Node,
	args: ohm.Node | null,
	trailing: ohm.Node,
	fn: (x: ohm.Node) => string
) {
	const numArgs = args ? args.arityOf : 0;
	const qualifiedName = `${
		genName(fn(name), 1 + numArgs + trailing.children.length)
	}`;
	return `${qualifiedName}(${
		commaList([lhs].concat(args ? args.children : [], trailing.children), fn)
	})`;
}

function genApplyTrailing(
	name: ohm.Node,
	args: ohm.Node | null,
	trailing: ohm.Node,
	fn: (x: ohm.Node) => string
) {
	const numArgs = (args ? args.arityOf : 0) + trailing.children.length;
	const qualifiedName = `${genName(fn(name), numArgs)}`;
	return `${qualifiedName}(${
		commaList((args ? args.children : []).concat(trailing.children), fn)
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
	/*ConstantDefinition(_constant, _dot_, name, _equals, value) {
		return `globalThis._${name.sourceString} = ${value.asJs};\n`;
	},*/
	LibraryItem(_libraryItem, aRecord) {
		return `_addLibraryItem_2(_system, _asLibraryItem_1(${aRecord.asJs}));\n`;
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
		return `let ${commaListJs(tmp.asIteration().children)};\n`;
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
		const rhsDictionaryName = genSym();
		const keyVarNamesArray = lhs.asIteration().children.map((c) => c.parametersOf);
		const slots = genDictionaryAssignmentSlots(
			rhsDictionaryName,
			keyVarNamesArray,
		);
		return `${rhsDictionaryName} = _assertIsOfSize_2(${rhs.asJs}, ${keyVarNamesArray.length}), ${slots}`;
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
		return `let ${commaListJs(tmp.asIteration().children)};`;
	},
	LetTemporary(_let, tmp, _semicolon) {
		return `let ${tmp.asJs};`;
	},
	/*
	LetTemporaries(_var, tmp, _semicolon) {
		return `let ${commaListJs(tmp.asIteration().children)};`;
	},
	*/
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
		return `/* List Assignment */ (function() {
	const ${rhsListName} = ${rhs.asJs};
	${slots};
})()`;
	},
	DictionaryAssignment(_leftParen, lhs, _rightParen, _colonEquals, rhs) {
		const rhsDictionaryName = genSym();
		const keyVarNamesArray = lhs.asIteration().children.map((c) => c.parametersOf);
		const slots = genDictionaryAssignmentSlots(
			rhsDictionaryName,
			keyVarNamesArray,
		);
		return `/* DictionaryAssignment */ (function() {
	const ${rhsDictionaryName} = _assertIsOfSize_2(${rhs.asJs}, ${keyVarNamesArray.length});
	${slots};
})()`;
	},
	/*
	AssignmentOperatorSyntax(lhs, op, rhs) {
		const text =
			`${lhs.sourceString} := ${lhs.sourceString} ${op.asJs} (${rhs.sourceString})`;
		return rewriteSlToJs(text);
	},
	*/
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
			commaListJs(elem)
		}, ${v.asJs})`;
	},
	QuotedAtSyntax(c, _colonColon, k) {
		return `_${genName('at', 2)}(${c.asJs}, '${k.sourceString}')`;
	},
	QuotedAtPutSyntax(c, _colonColon, k, _colonEquals, v) {
		return `_${genName('atPut', 3)}(${c.asJs}, '${k.sourceString}', ${v.asJs})`;
	},
	AtSyntax(c, _leftBracket, k, _rightBracket) {
		const elem = k.asIteration().children;
		return `_${genName('at', 1 + elem.length)}(${c.asJs}, ${commaListJs(elem)})`;
	},
	AtAllSyntax(c, _leftBracket, k, _rightBracket) {
		const elem = k.asIteration().children;
		return `_${genName('atAll', 1 + elem.length)}(${c.asJs}, ${commaListJs(elem)})`;
	},
	/*
	AtPutDelegateSyntax(c, _colonDot, k, _colonEquals, v) {
		return `_${
			genName('atPutDelegateTo', 4)
		}(${c.asJs}, '${k.sourceString}', ${v.asJs}, 'parent')`;
	},
	AtIfAbsentSyntax(c, _leftBracket, k, _rightBracket, _colonQuery, a) {
		return `_${genName('atIfAbsent', 3)}(${c.asJs}, ${k.asJs}, ${a.asJs})`;
	},
	AtIfAbsentPutSyntax(c, _leftBracket, k, _rightBracket, _colonQueryEquals, a) {
		return `_${genName('atIfAbsentPut', 3)}(${c.asJs}, ${k.asJs}, ${a.asJs})`;
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
	*/
	ValueApply(p, _dot, a) {
		return `${p.asJs}(${a.asJs})`;
	},
	NonEmptyParameterList(_leftParen, sq, _rightParen) {
		return commaListJs(sq.asIteration().children);
	},

	DotExpressionWithTrailingClosuresSyntax(lhs, _dot, name, args, trailing) {
		return genDotTrailing(lhs, name, args, trailing, (x) => x.asJs);
	},
	DotExpressionWithTrailingDictionarySyntax(lhs, _dot, name, trailing) {
		return genDotTrailing(lhs, name, null, trailing, (x) => x.asJs);
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
		return commaListJs(arg.children);
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

	ApplyWithTrailingClosuresSyntax(name, args, trailing) {
		return genApplyTrailing(name, args, trailing, (x) => x.asJs);
	},
	ApplyWithTrailingDictionarySyntax(name, trailing) {
		return genApplyTrailing(name, null, trailing, (x) => x.asJs);
	},
	ApplySyntax(rcv, arg) {
		return `${genName(rcv.asJs, arg.arityOf)}(${arg.asJs})`;
	},
	ParameterList(_leftParen, sq, _rightParen) {
		return commaListJs(sq.asIteration().children);
	},
	ParenthesisedExpression(_leftParen, e, _rightParen) {
		return `(${e.asJs})`;
	},
	DictionaryExpression(_leftParen, dict, _rightParen) {
		return `Object.fromEntries([${commaListJs(dict.asIteration().children)}])`;
	},
	NonEmptyDictionaryExpression(_leftParen, dict, _rightParen) {
		return `Object.fromEntries([${commaListJs(dict.asIteration().children)}])`;
	},
	KeyVarNameAssociation(lhs, _colon, rhs) {
		throw new Error('KeyVarNameAssociation: see parametersOf');
	},
	NameAssociation(lhs, _colon, rhs) {
		return `['${lhs.sourceString}', ${rhs.asJs}]`;
	},
	StringAssociation(lhs, _colon, rhs) {
		return `[${lhs.sourceString}, ${rhs.asJs}]`;
	},
	ListExpression(_leftBracket, items, _rightBracket) {
		return `[${commaListJs(items.asIteration().children)}]`;
	},
	TupleExpression(_leftBracket, items, _rightBracket) {
		const elem = items.asIteration().children;
		// console.debug('TupleExpression', elem.length);
		return `_asTuple_1([${commaListJs(elem)}])`;
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
		return `[${commaListJs(items.children)}]`;
	},
	VectorSyntaxUnarySend(lhs, _dot_, rhs) {
		return `${genName(rhs.asJs, 1)}(${lhs.asJs})`;
	},
	/*
	VectorSyntaxRange(start, _dotDot_, end) {
		return `_${genName('asList', 1)}(_${
			genName('upTo', 2)
		}(${start.asJs}, ${end.asJs}))`;
	},
	*/
	MatrixSyntax(_leftBracket, items, _rightBracket) {
		// console.debug('MatrixSyntax', items.sourceString);
		return `[${commaListJs(items.asIteration().children)}]`;
	},
	MatrixSyntaxItems(items) {
		return `[${commaListJs(items.children)}]`;
	},
	VolumeSyntax(_leftBracket, items, _rightBracket) {
		// console.debug('VolumeSyntax', items.sourceString);
		return `[${commaListJs(items.asIteration().children)}]`;
	},
	VolumeSyntaxItems(items) {
		return `[${commaListJs(items.asIteration().children)}]`;
	},
	/*
	TreeSyntax(_leftBracket, items, _rightBracket) {
		// console.debug('TreeSyntax', items.sourceString);
		return `[${commaListJs(items.children)}]`;
	},
	*/

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
		return `_${genName('to', 2)}(${start.asJs}, ${end.asJs})`;
	},
	floatLiteral(s, i, _, f) {
		return `${s.sourceString}${i.sourceString}.${f.sourceString}`;
	},
	floatDecimalLiteral(s, i, _, f, _d) {
		return `_basicParseDecimal_1('${s.sourceString}${i.sourceString}.${f.sourceString}')`;
	},
	integerDecimalLiteral(s, i, _d) {
		return `_basicParseDecimal_1('${s.sourceString}${i.sourceString}')`;
	},
	scientificLiteral(base, _e, exponent) {
		return `${base.sourceString}e${exponent.sourceString}`;
	},
	fractionLiteral(sign, numerator, _divisor, denominator) {
		// console.debug('fractionLiteral', sign.sourceString, numerator.sourceString, denominator.sourceString);
		return `_Fraction_2(
			${validateSign(sign.sourceString)}${numerator.sourceString}n,
			${denominator.sourceString}n
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
	largeIntegerLiteral(s, i, _l) {
		return `${s.sourceString}${i.sourceString}n`;
	},
	radixIntegerLiteral(s, b, _r, i) {
		const r = Number.parseInt(s.sourceString + i.sourceString, Number.parseInt(b.sourceString, 10));
		if(Number.isNaN(r)) {
			throw new Error('radixIntegerLiteral: invalid literal');
		}
		return r.toString(10);
	},
	integerLiteral(s, i) {
		// Allow 03 for 3 and -03 for -3
		return `${s.sourceString + parseInt(i.sourceString)}`;
	},
	constantNumberLiteral(k) {
		const text = k.sourceString;
		//console.debug('constantNumberLiteral: ', text);
		if(text === "Pi") {
			return "3.1415926535897932384626433";
		}
		/*if(text === "inf") {
			return "Infinity";
		}*/
		return text;
	},
	singleQuotedStringLiteral(_l, s, _r) {
		// console.debug(`singleQuotedStringLiteral: ${s.sourceString}`);
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

const asSl: ohm.ActionDict<string> = {
	ApplySyntax(rcv, arg) {
		return `${rcv.sourceString}(${arg.asSl})`;
	},
	ApplyWithTrailingClosuresSyntax(name, args, trailing) {
		return `${name.sourceString}(${commaListSl(args.children.concat(trailing.children))})`;
	},
	ApplyWithTrailingDictionarySyntax(name, trailing) {
		return `${name.sourceString}(${commaListSl(trailing.children)})`;
	},
	Arguments(a, _p) {
		return commaListSl(a.children);
	},
	ArgumentName(_c, name) {
		return ':' + name.sourceString;
	},
	Primitive(_l, s, _r) {
		return '<primitive: ' + s.sourceString + '>';
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
	BinaryExpression(lhs, ops, rhs) {
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
	Block(_l, b, _r) {
		return `{ ${b.asSl} }`;
	},
	BlockBody(arg, tmp, prm, stm) {
		return `${arg.asSl} | ${tmp.asSl}${prm.asSl}${stm.asSl}`;
	},
	DictionaryExpression(_l, d, _r) {
		return `Record([${commaListSl(d.asIteration().children)}])`;
	},
	NonEmptyDictionaryExpression(_l, d, _r) {
		return `Record([${commaListSl(d.asIteration().children)}])`;
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
		return `${name.sourceString}(${commaListSl([lhs].concat(args.children, trailing.children))})`;
	},
	DotExpressionWithTrailingDictionarySyntax(lhs, _dot, name, trailing) {
		return `${name.sourceString}(${commaListSl([lhs].concat(trailing.children))})`;
	},
	EmptyListSyntax(_l, _r) {
		return '[]';
	},
	FinalExpression(e) {
		return e.asSl;
	},
	LetTemporary(_l, tmp, _s) {
		return `let ${tmp.asSl}; `;
	},
	ListExpression(_l, items, _r) {
		return `[${commaListSl(items.asIteration().children)}]`;
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
	NameAssociation(lhs, _c, rhs) {
		return `['${lhs.sourceString}', ${rhs.asSl}]`;
	},
	NonEmptyParameterList(_leftParen, sq, _rightParen) {
		return commaListSl(sq.asIteration().children);
	},
	NonFinalExpression(e, _s, stm) {
		return `${e.asSl}; ${stm.asSl}`;
	},
	ParameterList(_l, sq, _r) {
		return commaListSl(sq.asIteration().children);
	},
	ParenthesisedExpression(_left, e, _right) {
		return '(' + e.asSl + ')'
	},
	Program(tmp, stm) {
		return tmp.asSl + stm.asSl;
	},
	QuotedAtSyntax(c, _colons, k) {
		return `at(${c.asSl}, '${k.sourceString}')`;
	},
	QuotedAtPutSyntax(c, _colons, k, _equals, v) {
		return `atPut(${c.asSl}, '${k.sourceString}', ${v.asSl})`;
	},
	RangeSyntax(_left, start, _dots, end, _right) {
		return `upOrDownTo(${start.asSl}, ${end.asSl})`;
	},
	RangeThenSyntax(_left, start, _comma, then, _dots, end, _right) {
		return `thenTo(${start.asSl}, ${then.asSl}, ${end.asSl})`;
	},
	ScalarAssignment(lhs, _e, rhs) {
		return `${lhs.asSl} := ${rhs.asSl}`;
	},
	TemporaryExpressionInitializer(name, _e, exp) {
		return `${name.sourceString} = ${exp.asSl}`;
	},
	TupleExpression(_l, items, _r) {
		return `asTuple([${commaListSl(items.asIteration().children)}])`;
	},
	ValueApply(p, _d, a) {
		return `${p.asSl} . (${a.asSl})`;
	},
	VectorSyntax(_l, items, _r) {
		return `[${commaListSl(items.children)}]`;
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

	backtickQuotedStringLiteral(_l, s, _r) {
		return `BacktickQuotedString('${s.sourceString}')`;
	},
	complexLiteral(r, _j, i) {
		return `Complex(${r.sourceString}, ${i.sourceString})`;
	},
	doubleQuotedStringLiteral(_l, s, _r) {
		return `DoubleQuotedString('${s.sourceString}')`;
	},
	floatLiteral(s, i, _dot, f) {
		return s.sourceString + i.sourceString + '.' + f.sourceString;
	},
	fractionLiteral(s, n, _s, d) {
		return `Fraction(${validateSign(s.sourceString)}${n.sourceString}L, ${d.sourceString}L)`;
	},
	infixMethod(name, _colon) {
		return name.sourceString;
	},
	integerLiteral(s, i) {
		return s.sourceString + i.sourceString;
	},
	largeIntegerLiteral(s, i, _l) {
		return s.sourceString + i.sourceString + 'L';
	},
	lowercaseIdentifier(c1, cN) {
		return c1.sourceString + cN.sourceString;
	},
	operator(op) {
		return op.sourceString;
	},
	operatorWithUnaryAdverb(op, _d, adverb) {
		return `${adverb.sourceString}(${op.sourceString})`;
	},
	radixIntegerLiteral(s, b, _r, i) {
		const r = Number.parseInt(s.sourceString + i.sourceString, Number.parseInt(b.sourceString, 10));
		if(Number.isNaN(r)) {
			throw new Error('radixIntegerLiteral: invalid literal');
		}
		return r.toString(10);
	},

	rangeFromByToLiteral(start, _colon, step, _anotherColon, end) {
		return `toBy(${start.asSl}, ${end.asSl}, ${step.asSl})`;
	},
	rangeFromToLiteral(start, _colon, end) {
		return `to(${start.asSl}, ${end.asSl})`;
	},
	residueLiteral(i, _z, m) {
		return `Residue(${i.sourceString}, ${m.sourceString})`;
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return `'${s.sourceString}'`;
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
		return `${p.asSl}; ${rest.map((c) => c.asSl)}`;
	},

	_iter(...children) {
		return children.map((c) => c.asSl).join('');
	},
	_terminal() {
		return this.sourceString;
	},
};

slSemantics.addAttribute('asSl', asSl);

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
	KeyVarNameAssociation(lhs, _colon, rhs) {
		return [
			lhs.sourceString,
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

function commaList(nodeArray: ohm.Node[], fn: ((x: ohm.Node) => string)): string {
	return nodeArray.map(fn).join(', ');
}

function commaListJs(nodeArray: ohm.Node[]): string {
	return commaList(nodeArray, (e) => e.asJs);
}

function commaListSl(nodeArray: ohm.Node[]): string {
	return commaList(nodeArray, (e) => e.asSl);
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

export function rewriteSlToCore(slText: string): string {
	const slCoreText = slParse(slText).asSl;
	// console.debug(`rewriteSlToCore: ${slText} => ${slCoreText}`);
	return slCoreText;
}

// Preserve first line comment for Requires information in .cache
export function rewriteSlToJs(slText: string): string {
	const jsText = slParse(slText).asJs;
	// console.debug(`rewriteSlToJs: ${slText} => ${jsText}`);
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
		throw new Error('Rewrite failed', { cause: err });
	}
}
