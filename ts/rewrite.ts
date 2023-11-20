import ohm from 'https://unpkg.com/ohm-js@17/dist/ohm.esm.js';

import { arraySum } from '../lib/jssc3/ts/kernel/array.ts'

import { slSemantics, slParse, slTemporariesSyntaxNames } from './grammar.ts'
import { resolveMethodName, operatorMethodName } from './operator.ts'
import { slOptions } from './options.ts'

export const context = { packageName: 'UnknownPackage' };

function genName(name: string, arity: number): string {
	return slOptions.simpleArityModel ? name : `${name}_${arity}`;
}

function atMethod(): string {
	return slOptions.uncheckedIndexing ? 'basicAt' : 'at'; // unsafeAt
}

function atPutMethod(): string {
	return slOptions.uncheckedIndexing ? 'basicAtPut' : 'atPut'; // unsafeAtPut
}

function quoteNewLines(input: string): string {
	return input.replaceAll('\n', '\\n');
}

function makeTypeDefinition(
	isHostType: boolean,
	typeName: string,
	traits: string,
	instanceVariables: ohm.Node,
	methodNames: string[],
	methodBlocks: ohm.Node[]
):string {
	// console.debug(`makeTypeDefinition: ${isHostType} ${typeName}`);
	const instanceVariablesSource = instanceVariables.sourceString;
	const instanceVariablesList =
		instanceVariablesSource === '' ?
		[] :
		slTemporariesSyntaxNames(instanceVariablesSource).map(name => `'${name}'`);
	const traitList = traits.split(', ').filter(each => each.length > 0);
	const addType = `sl.addType(${isHostType}, '${typeName}', '${context.packageName}', [${traits}], [${instanceVariablesList}]);`;
	const copyTraits = traitList.map(traitNm => `sl.copyTraitToType(${traitNm}, '${typeName}');`).join(' ');
	const addMethods = makeMethodList('addMethod', [typeName], methodNames, methodBlocks);
	return `${addType}${copyTraits}${addMethods}`;
}

const asJs: ohm.ActionDict<string> = {

	TypeExtension(_plus, typeName, _leftBrace, methodName, methodBlock, _rightBrace) {
		return makeMethodList('addMethod', [typeName.sourceString], methodName.children.map(c => c.sourceString), methodBlock.children);
	},
	TypeListExtension(_plus, _leftBracket, typeNameList, _rightBracket, _leftBrace, methodName, methodBlock, _rightBrace) {
		const typeNameArray = typeNameList.asIteration().children.map(c => c.sourceString);
		// console.debug(`TypeListExtension: [${typeNameArray}].size = ${typeNameArray.length}`);
		return makeMethodList('addMethod', typeNameArray, methodName.children.map(c => c.sourceString), methodBlock.children);
	},
	TypeDefinition(typeName, trait, _leftBrace, tmp, methodName, methodBlock, _rightBrace) {
		return makeTypeDefinition(false, typeName.sourceString, trait.asJs, tmp, methodName.children.map(c => c.sourceString), methodBlock.children);
	},
	HostTypeDefinition(typeName, _isHostType, trait, _leftBrace, tmp, methodName, methodBlock, _rightBrace) {
		return makeTypeDefinition(true, typeName.sourceString, trait.asJs, tmp, methodName.children.map(c => c.sourceString), methodBlock.children);
	},
	TraitList(_colon, _leftBracket, nm, _rightBracket) {
		return nm.asIteration().children.map(c => `'${c.sourceString}'`).join(', ');
	},
	TraitExtension(_plus, _at, traitNm, _leftBrace, methodName, methodBlock, _rightBrace) {
		// console.debug(`TraitExtension: ${traitNm.sourceString}`);
		return makeMethodList('extendTraitWithMethod', [traitNm.sourceString], methodName.children.map(c => c.sourceString), methodBlock.children);
	},
	TypeTypeExtension(_plus, typeName, _caret, _leftBrace, methodName, methodBlock, _rightBrace) {
		// console.debug(`TypeTypeExtension: ${traitNm.sourceString}`);
		return makeMethodList('addMethod', [typeName.sourceString + '^'], methodName.children.map(c => c.sourceString), methodBlock.children);
	},
	TraitDefinition(_at, traitNm, _leftBrace, methodName, methodBlock, _rightBrace) {
		const trait = `sl.addTrait('${traitNm.sourceString}', '${context.packageName}');`;
		const mth = makeMethodList('addTraitMethod', [traitNm.sourceString], methodName.children.map(c => c.sourceString), methodBlock.children);
		return `${trait}${mth}`;
	},
	ConstantDefinition(_constant, _dot_, name, _equals, value) {
		return `globalThis._${name.sourceString} = ${value.asJs};`
	},
	Program(tmp, stm) {
		return tmp.asJs + stm.asJs;
	},
	TemporariesWithInitializers(_leftVerticalBar, tmp, _semiColon, _rightVerticalBar) {
		return `var ${commaList(tmp.asIteration().children)};`;
	},
	TemporaryWithBlockLiteralInitializer(nm, _equals, blk) {
		const name = nm.asJs;
		const genNm = `${genName(name, blk.arityOf)}`;
		const genBind = `${genNm} = ${blk.asJs}`;
		const reBind =
			(!slOptions.simpleArityModel && slOptions.multipleNamesForLocalBlocks) ?
			`, ${name} = ${genNm}` :
			'';
		// console.log(`TemporaryWithBlockLiteralInitializer: ${reBind}`);
		return `${genBind}${reBind}`;
	},
	TemporaryWithExpressionInitializer(nm, _equals, exp) {
		return `${nm.asJs} = ${exp.asJs}`;
	},
	TemporaryWithDictionaryInitializer(_leftParen, lhs, _rightParen, _equals, rhs) {
		const namesArray = lhs.asIteration().children.map(c => c.sourceString);
		const rhsName = gensym();
		const slots = namesArray.map((name) => `_${name} = _${genName('at', 2)}(${rhsName}, '${name}')`).join(', ');
		return `${rhsName} = ${rhs.asJs}, ${slots}`;
	},
	TemporaryWithArrayInitializer(_leftBracket, lhs, _rightBracket, _equals, rhs) {
		const namesArray = lhs.asIteration().children.map(c => c.sourceString);
		const rhsName = gensym();
		const slots = namesArray.map((name, index) => `_${name} = _${genName('at', 2)}(${rhsName}, ${index + 1})`).join(', ');
		return `${rhsName} = _assertIsOfSize_2(${rhs.asJs}, ${namesArray.length}), ${slots}`;
	},
	TemporariesWithoutInitializers(_leftVerticalBar, tmp, _rightVerticalBar) {
		return `var ${commaList(tmp.children)};`;
	},
	TemporariesParenSyntax(_leftParen, tmp, _rightParen) {
		return `var ${commaList(tmp.asIteration().children)};`;
	},
	TemporariesVarWithoutInitializersSyntax(_var, tmp, _semicolon) {
		return `var ${commaList(tmp.asIteration().children)};`;
	},
	TemporariesVarWithInitializersSyntax(_var, tmp, _semicolon) {
		return `var ${commaList(tmp.asIteration().children)};`;
	},
	ScalarAssignment(lhs, _colonEquals, rhs) {
		return `${lhs.asJs} = ${rhs.asJs}`;
	},
	ArrayAssignment(_leftBracket, lhs, _rightBracket, _colonEquals, rhs) {
		const namesArray = lhs.asIteration().children.map(c => c.sourceString);
		const rhsArrayName = gensym();
		const slots = namesArray.map((name, index) => `_${name} = _${genName('at', 2)}(${rhsArrayName}, ${index + 1})`).join('; ');
		return `(function() { var ${rhsArrayName} = ${rhs.asJs}; ${slots}; })()`;
	},
	DictionaryAssignment(_leftParen, lhs, _rightParen, _colonEquals, rhs) {
		const namesArray = lhs.asIteration().children.map(c => c.sourceString);
		const rhsDictionaryName = gensym();
		const slots = namesArray.map((name, index) => `_${name} = _${genName('at', 2)}(${rhsDictionaryName}, '${name}')`).join('; ');
		return `(function() { var ${rhsDictionaryName} = ${rhs.asJs}; ${slots}; })()`;
	},
	AssignmentOperatorSyntax(lhs, op, rhs) {
		const text = `${lhs.sourceString} := ${lhs.sourceString} ${op.asJs} (${rhs.sourceString})`;
		return rewriteString(text);
	},
	binaryOperator(op) {
		return `_${genName(operatorMethodName(op.sourceString), 2)}`;
	},
	binaryOperatorWithAdverb(op, _dot, adverb) {
		// console.log(`binaryOperatorWithAdverb: ${op.sourceString} ${adverb.sourceString}`);
		return `_${genName(adverb.sourceString, 1)}(_${genName(operatorMethodName(op.sourceString), 2)})`;
	},
	BinaryExpression(lhs, ops, rhs) {
		let left = lhs.asJs;
		const opsArray = ops.children.map(c => c.asJs);
		const rhsArray = rhs.children.map(c => c.asJs);
		while (opsArray.length > 0) {
			const op = opsArray.shift();
			const right = rhsArray.shift();
			left = `${op}(${left}, ${right})`;
		}
		return left;
	},

	AtPutSyntax(c, _leftBracket, k, _rightBracket, _equals, v) {
		return `_${genName(atPutMethod(), 3)}(${c.asJs}, ${k.asJs}, ${v.asJs})`;
	},
	QuotedAtPutSyntax(c, _colonColon, k, _colonEquals, v) {
		return `_${genName(atPutMethod(), 3)}(${c.asJs}, '${k.sourceString}', ${v.asJs})`;
	},
	AtPutDelegateSyntax(c, _colonDot, k, _colonEquals, v) {
		return `_${genName('atPutDelegateTo', 4)}(${c.asJs}, '${k.sourceString}', ${v.asJs}, 'parent')`;
	},
	AtSyntax(c, _leftBracket, k, _rightBracket) {
		return `_${genName(atMethod(), 2)}(${c.asJs}, ${k.asJs})`;
	},
	AtIfAbsentSyntax(c, _leftBracket, k, _rightBracket, _colonQuery, a) {
		return `_${genName('atIfAbsent', 3)}(${c.asJs}, ${k.asJs}, ${a.asJs})`;
	},
	AtIfAbsentPutSyntax(c, _leftBracket, k, _rightBracket, _colonQueryEquals, a) {
		return `_${genName('atIfAbsentPut', 3)}(${c.asJs}, ${k.asJs}, ${a.asJs})`;
	},
	AtAllArraySyntax(c, _leftBracket, k, _rightBracket) {
		return `_${genName('atAll', 2)}(${c.asJs}, [${commaList(k.asIteration().children)}])`;
	},
	AtAllVectorSyntax(c, _leftBracket, k, _rightBracket) {
		return `_${genName('atAll', 2)}(${c.asJs}, [${commaList(k.children)}])`;
	},
	AtMatrixSyntax(c, _leftBracket, i, _semicolon, j, _rightBracket) {
		var at = `_${genName(atMethod(), 2)}`;
		return `${at}(${at}(${c.asJs}, ${i.asJs}), ${j.asJs})`;
	},
	AtVolumeSyntax(c, _leftBracket, i, _semicolonOne, j, _semicolonTwo, k, _rightBracket) {
		var at = `_${genName(atMethod(), 2)}`;
		return `${at}(${at}(${at}(${c.asJs}, ${i.asJs}), ${j.asJs}), ${k.asJs})`;
	},
	AtPathSyntax(c, _leftBracket, k, _rightBracket) {
		return `_${genName('atPath', 2)}(${c.asJs}, [${commaList(k.asIteration().children)}])`;
	},
	AtPathPutSyntax(collection, _leftBracket, keys, _rightBracket, _colonEquals, value) {
		return `_${genName('atPathPut', 3)}(${collection.asJs}, [${commaList(keys.asIteration().children)}], ${value.asJs})`;
	},
	QuotedAtSyntax(c, _colonColon, k) {
		return `_${genName(atMethod(), 2)}(${c.asJs}, '${k.sourceString}')`;
	},
	QuotedAtIfAbsentSyntax(c, _colonColon, k, _colonQuery, a) {
		return `_${genName('atIfAbsent', 3)}(${c.asJs}, '${k.sourceString}', ${a.asJs})`;
	},
	QuotedAtIfAbsentPutSyntax(c, _colonColon, k, _colonQueryEquals, a) {
		return `_${genName('atIfAbsentPut', 3)}(${c.asJs}, '${k.sourceString}', ${a.asJs})`;
	},
	ReadSlotSyntax(c, _colonArrow, k) {
		return `${c.asJs}['${k.sourceString}']`;
	},
	WriteSlotSyntax(c, _colonArrow, k, _colonEquals, v) {
		return `${c.asJs}['${k.sourceString}'] = ${v.asJs}`;
	},
	MessageSendSyntax(d, _colonDot, k, a) {
		return `_${genName('messageSend', 4)}(${d.asJs}, '${k.sourceString}', 'parent', [${a.children.map(c => c.asJs)}])`;
	},
	ValueApply(p, _dot, a) {
		return `${p.asJs}(${a.asJs})`;
	},
	NonEmptyParameterList(_leftParen, sq, _rightParen) {
		return commaList(sq.asIteration().children);
	},

	DotExpressionWithTrailingClosuresSyntax(lhs, _dot, nm, args, tc) {
		const name = `${genName(nm.asJs, 1 + args.arityOf + tc.children.length)}`;
		return `${name}(${[lhs.asJs].concat(args.children.map(c => c.asJs), tc.children.map(c => c.asJs))})`;
	},
	DotExpressionWithTrailingDictionariesSyntax(lhs, _dot, nm, args, tc) {
		const name = `${genName(nm.asJs, 1 + args.arityOf + tc.children.length)}`;
		return `${name}(${[lhs.asJs].concat(args.children.map(c => c.asJs), tc.children.map(c => c.asJs))})`;
	},
	DotExpressionWithAssignmentSyntax(lhs, _dot, nm, _colonEquals, rhs) {
		return `${genName(nm.asJs, 2)}(${lhs.asJs}, ${rhs.asJs})`;
	},
	DotExpression(lhs, _dot, nms, args) {
		let rcv = lhs.asJs;
		const namesArray = nms.children.map(c => c.asJs);
		const argsArray = args.children.map(c => c.asJs);
		const arityArray = args.children.map(c => c.arityOf);
		while (namesArray.length > 0) {
			const nm = namesArray.shift();
			const arg = argsArray.shift();
			const arity = arityArray.shift();
			if(arg.length === 0) {
				rcv = `${genName(nm, 1)}(${rcv})`;
			} else {
				rcv = `${genName(nm, 1 + arity)}(${[rcv].concat([arg])})`;
			}
		}
		return rcv;
	},

	Block(_leftBrace, blk, _rightBrace) {
		return blk.asJs; },
	BlockBody(arg, tmp, prm, stm) {
		let arityCheck = '';
		if(slOptions.insertArityCheck) {
			arityCheck = `if(arguments.length !== ${arg.arityOf}) { var errorMessage = 'Arity: expected ${arg.arityOf}, ${arg.asJs}'; console.error(errorMessage); throw Error(errorMessage); }`;
		}
		return `(function(${arg.asJs}) { ${arityCheck} ${tmp.asJs} ${prm.asJs} ${stm.asJs} })`;
	},
	Arguments(arg, _verticalBar) {
		return commaList(arg.children);
	},
	ArgumentName(_colon, nm) {
		return nm.asJs;
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

	ApplyWithTrailingClosuresSyntax(rcv, arg, tc) {
		const opt = arg.asJs;
		const name = `${genName(rcv.asJs, arg.arityOf + tc.children.length)}`;
		return `${name}(...[${opt === '' ? '' : opt + ', '} ${commaList(tc.children)}])`;
	},
	ApplyWithTrailingDictionariesSyntax(rcv, arg, tc) {
		const opt = arg.asJs;
		const name = `${genName(rcv.asJs, arg.arityOf + tc.children.length)}`;
		return `${name}(...[${opt === '' ? '' : opt + ', '} ${commaList(tc.children)}])`;
	},
	ApplySyntax(rcv, arg) {
		return `${genName(rcv.asJs, arg.arityOf)}(...[${arg.asJs}])`;
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
	IdentifierAssociation(lhs, _colon, rhs) {
		return `['${lhs.sourceString}', ${rhs.asJs}]`;
	},
	StringAssociation(lhs, _colon, rhs) {
		return `[${lhs.sourceString}, ${rhs.asJs}]`;
	},
	ArrayExpression(_leftBracket, array, _rightBracket) {
		return `[${commaList(array.asIteration().children)}]`;
	},
	ArrayIntervalSyntax(_leftBracket, start, _dotDot, end, _rightBracket) {
		return `_${genName('Array', 1)}(_${genName('upOrDownTo', 2)}(${start.asJs}, ${end.asJs}))`;
	},
	ArrayIntervalThenSyntax(_leftBracket, start, _comma_, then, _dotDot, end, _rightBracket) {
		return `_${genName('Array', 1)}(_${genName('thenTo', 3)}(${start.asJs}, ${then.asJs}, ${end.asJs}))`;
	},
	IntervalSyntax(_leftParen, start, _dotDot, end, _rightParen) {
		return `_${genName('upOrDownTo', 2)}(${start.asJs}, ${end.asJs})`;
	},
	IntervalThenSyntax(_leftParen, start, _comma_, then, _dotDot, end, _rightParen) {
		return `_${genName('thenTo', 3)}(${start.asJs}, ${then.asJs}, ${end.asJs})`;
	},
	VectorSyntax(_leftBracket, items, _rightBracket) {
		return `[${commaList(items.children)}]`;
	},
	VectorSyntaxUnarySend(lhs, _dot_, rhs) {
		return `${genName(rhs.asJs, 1)}(${lhs.asJs})`;
	},
	VectorSyntaxRange(start, _dotDot_, end) {
		return `_${genName('Array', 1)}(_${genName('upTo', 2)}(${start.asJs}, ${end.asJs}))`;
	},
	MatrixSyntax(_leftBracket, items, _rightBracket) {
		return `[${commaList(items.asIteration().children)}]`;
	},
	MatrixSyntaxItems(items) {
		return `[${commaList(items.children)}]`;
	},
	VolumeSyntax(_leftBracket, items, _rightBracket) {
		return `[${commaList(items.asIteration().children)}]`;
	},
	VolumeSyntaxItems(items) {
		return `[${commaList(items.asIteration().children)}]`;
	},

	unusedVariableIdentifier(_underscore) {
		const idenfitifer = gensym();
		//console.log('unusedVariableIdentifier', identifier);
		return gensym();
	},
	unqualifiedIdentifier(c1, cN) {
		const identifier = `_${c1.sourceString}${cN.sourceString}`;
		//console.log('unqualifiedIdentifier', identifier);
		return identifier;
	},
	arityQualifiedIdentifier(c1, cN, _aritySeparator, a) {
		const arityPart =
			slOptions.simpleArityModel ?
			'' :
			`_${a.sourceString}`;
		const identifier = `_${c1.sourceString}${cN.sourceString}${arityPart}`;
		//console.log('arityQualifiedIdentifier', identifier);
		return identifier;
	},
	reservedIdentifier(id) {
		switch(id.sourceString) {
			case 'nil': return 'null';
			case 'true': return 'true';
			case 'false': return 'false';
			default: throw Error('rewrite: reservedIdentifier?');
		}
	},

	operatorAssignment(op, _colon, _equals) {
		return op.sourceString
	},
	integerIntervalLiteral(start, _dotDot, end) {
		// console.log('integerIntervalLiteral', start.sourceString, end.sourceString);
		return `_${genName('upTo', 2)}(${start.asJs}, ${end.asJs})`;
	},
	floatLiteral(s,i,_,f) {
		return `${s.sourceString}${i.sourceString}.${f.sourceString}`;
	},
	scientificLiteral(base, _e , exponent) {
		return `${base.sourceString}e${exponent.sourceString}`;
	},
	fractionLiteral(s,n,_colon,d) {
		return `_normalized_1(_Fraction_2(${s.sourceString}${n.sourceString}, ${d.sourceString}))`;
	},
	largeIntegerLiteral(s,i,_n) {
		return `${s.sourceString}${i.sourceString}n`;
	},
	radixIntegerLiteral(s,b,_r,i) {
		return `_assertIsSmallInteger_1(parseInt('${s.sourceString}${i.sourceString}', ${b.sourceString}))`;
	},
	integerLiteral(s,i) {
		return `${s.sourceString}${i.sourceString}`;
	},
	constantNumberLiteral(k) {
		// console.debug('constantNumberLiteral: ', k.sourceString);
		return k.sourceString;
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return `'${quoteNewLines(s.sourceString)}'`;
	},
	doubleQuotedStringLiteral(_l, s, _r) {
		return `_${genName('parseDoubleQuotedString', 1)}("${s.sourceString}")`;
	},
	backtickQuotedStringLiteral(_l, s, _r) {
		return `_${genName('parseBacktickQuotedString', 1)}(\`${s.sourceString}\`)`;
	},

	NonemptyListOf(first, _sep, rest) {
		return `${first.asJs}; ${rest.children.map(c => c.asJs)}`;
	},
	EmptyListOf() {
		return '';
	},
	_iter(...children) {
		return children.map(c => c.asJs).join('');
	},
	_terminal() {
		return this.sourceString;
	}
};

slSemantics.addAttribute('asJs', asJs);

const arityOf: ohm.ActionDict<number> = {
	NonEmptyParameterList(_l, sq, _r) {
		return sq.asIteration().children.length
	},
	ParameterList(_l, sq, _r) {
		return sq.asIteration().children.length
	},
	Block(_l, blk, _r) {
		return blk.arityOf;
	},
	BlockBody(arg, tmp, prm, stm) {
		return arg.arityOf;
	},
	Arguments(nm, _) {
		return nm.children.length
	},
	_iter(...children) {
		return arraySum(children.map(c => c.arityOf));
	},
}

slSemantics.addAttribute('arityOf', arityOf);

function commaList(nodeArray: ohm.Node[]): string {
	return nodeArray.map(e => e.asJs).join(', ');
}

let rewriteGensymCounter = 0;

function gensym() {
	rewriteGensymCounter += 1;
	return `__gensym${rewriteGensymCounter}`;
}

function makeMethod(
	slProc: string,
	clsNmArray: string[],
	methodName: string,
	methodBlock: ohm.Node
): string {
	const blkSource = methodBlock.sourceString;
	const blkArity = methodBlock.arityOf;
	const blkJs = methodBlock.asJs;
	const blkSrc = JSON.stringify(blkSource);
	const slName = resolveMethodName(methodName);
	return clsNmArray.map(function(clsNm) {
		// console.debug(`makeMethod: '${slProc}', '${clsNm}', '${context.packageName}', '${methodName}'('${slName}'), ${blkArity}`);
		return ` sl.${slProc}('${clsNm}', '${context.packageName}', '${slName}', ${blkArity}, ${blkJs}, ${blkSrc});`
	}).join(' ');
}

function makeMethodList(
	slProc: string,
	clsNmArray: string[],
	methodNames: string[],
	methodBlocks: ohm.Node[]
): string {
	let mthList = '';
	while (methodNames.length > 0) {
		const methodName = methodNames.shift()!;
		const methodBlock = methodBlocks.shift()!;
		const mthSrc = makeMethod(slProc, clsNmArray, methodName, methodBlock);
		// console.debug(`makeMethodList: ${mthSrc}`);
		mthList += mthSrc;
	}
	return mthList;
}

export function rewriteString(str: string): string {
	const answer = slParse(str).asJs;
	// console.debug(`rewriteString: ${str} => ${answer}`);
	return answer;
}
