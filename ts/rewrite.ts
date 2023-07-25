// @ts-nocheck

import { arraySum } from '../lib/jssc3/ts/kernel/array.ts'

import { slSemantics, slParse, slTemporariesSyntaxNames } from './grammar.ts'
import { slOptions } from './options.ts'

function genName(name, arity) {
	return slOptions.simpleArityModel ? name : `${name}_${arity}`;
}

function quoteNewLines(input: string): string {
	return input.replaceAll('\n', '\\n');
}

const asJs: any = {

	TypeExtension(_plus, typNm, _leftBrace, mthNm, mthBlk, _rightBrace) {
		return makeMethodList('addMethod', [typNm.sourceString], mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
	TypeListExtension(_plus, _leftBracket, typNmList, _rightBracket, _leftBrace, mthNm, mthBlk, _rightBrace) {
		const typNmArray = typNmList.asIteration().children.map(c => c.sourceString);
		// console.debug(`TypeListExtension: [${typNmArray}].size = ${typNmArray.length}`);
		return makeMethodList('addMethod', typNmArray, mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
	TypeDefinition(typNm, trt, _leftBrace, tmp, mthNm, mthBlk, _rightBrace) {
		function makeTypeDefinition(typNm: string, trt: string[], tmp, mthNms, mthBlks) {
			const tmpSrc = tmp.sourceString;
			const tmpNm = tmpSrc === '' ? [] : slTemporariesSyntaxNames(tmpSrc).map(nm => `'${nm}'`);
			const traitList = trt.split(', ').filter(each => each.length > 0);
			const addType = `sl.addType('${typNm}', [${trt}], [${tmpNm}]);`;
			const copyTraits = traitList.map(trtNm => `sl.copyTraitToType(${trtNm}, '${typNm}');`).join(' ');
			const addMethods = makeMethodList('addMethod', [typNm], mthNms, mthBlks);
			return `${addType}${copyTraits}${addMethods}`;
		}
		return makeTypeDefinition(typNm.sourceString, trt.asJs, tmp, mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
	TraitList(_colon, _leftBracket, nm, _rightBracket) {
		return nm.asIteration().children.map(c => `'${c.sourceString}'`).join(', ');
	},
	TraitExtension(_plus, _at, trtNm, _leftBrace, mthNm, mthBlk, _rightBrace) {
		// console.debug(`TraitExtension: ${trtNm.sourceString}`);
		return makeMethodList('extendTraitWithMethod', [trtNm.sourceString], mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
	TraitDefinition(_at, trtNm, _leftBrace, mthNm, mthBlk, _rightBrace) {
		const trt = `sl.addTrait('${trtNm.sourceString}');`;
		const mth = makeMethodList('addTraitMethod', [trtNm.sourceString], mthNm.children.map(c => c.sourceString), mthBlk.children);
		return `${trt}${mth}`;
	},
	ConstantDefinition(name, _equals, value) {
		return `globalThis._${name.sourceString} = ${value.asJs};`
	},
	Program(tmp, stm) {
		return tmp.asJs + stm.asJs;
	},
	TemporariesWithInitializers(_verticalBar1, tmp, _semiColon, _verticalBar2) {
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
		return `${rhsName} = ${rhs.asJs}, ${slots}`;
	},
	TemporariesWithoutInitializers(_verticalBar1, tmp, _verticalBar2) {
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
	BinaryExpression(lhs, ops, rhs) {
		let left = lhs.asJs;
		const opsArray = ops.children.map(c => c.asJs);
		const rhsArray = rhs.children.map(c => c.asJs);
		while (opsArray.length > 0) {
			const op = opsArray.shift();
			const right = rhsArray.shift();
			left = `_${genName(sl.operatorMethodName(op), 2)}(${left}, ${right})`;
		}
		return left;
	},

	AtPutSyntax(c, _leftBracket, k, _rightBracket, _equals, v) {
		return `_${genName('atPut', 3)}(${c.asJs}, ${k.asJs}, ${v.asJs})`;
	},
	AtPutQuotedSyntax(c, _colonColon, k, _colonEquals, v) {
		return `_${genName('atPut', 3)}(${c.asJs}, '${k.sourceString}', ${v.asJs})`;
	},
	AtPutDelegateSyntax(c, _colonDot, k, _colonEquals, v) {
		return `_${genName('atPutDelegateTo', 4)}(${c.asJs}, '${k.sourceString}', ${v.asJs}, 'parent')`;
	},
	AtSyntax(c, _leftBracket, k, _rightBracket) {
		return `_${genName('at', 2)}(${c.asJs}, ${k.asJs})`;
	},
	AtQuotedSyntax(c, _colonColon, k) {
		return `_${genName('at', 2)}(${c.asJs}, '${k.sourceString}')`;
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

	ImplicitDictionaryAtPutSyntax(_colonColon, k, _colonEquals, e) {
		return `_${genName('atPut', 3)}(_implicitDictionary, '${k.sourceString}', ${e.asJs})`; },
	ImplicitDictionaryAtSyntax(_colonColon, k) {
		return `_${genName('at', 2)}(_implicitDictionary, '${k.sourceString}')`; },

	Block(_leftBrace, blk, _rightBrace) {
		return blk.asJs; },
	BlockBody(arg, tmp, prm, stm) {
		let arityCheck = '';
		if(slOptions.insertArityCheck) {
			arityCheck = `if(arguments.length !== ${arg.arityOf}) { var err = 'Arity: expected ${arg.arityOf}, ${arg.asJs}'; console.error(err); throw err; }`;
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
	ArrayRangeSyntax(_leftBracket, start, _dotDot, end, _rightBracket) {
		return `_${genName('asArray', 1)}(_${genName('upOrDownTo', 2)}(${start.asJs}, ${end.asJs}))`;
	},
	ArrayRangeThenSyntax(_leftBracket, start, _comma_, then, _dotDot, end, _rightBracket) {
		return `_${genName('asArray', 1)}(_${genName('thenTo', 3)}(${start.asJs}, ${then.asJs}, ${end.asJs}))`;
	},
	IntervalSyntax(_leftParen, start, _dotDot, end, _rightParen) {
		return `_${genName('upOrDownTo', 2)}(${start.asJs}, ${end.asJs})`;
	},
	IntervalThenSyntax(_leftParen, start, _comma_, then, _dotDot, end, _rightParen) {
		return `_${genName('thenTo', 3)}(${start.asJs}, ${then.asJs}, ${end.asJs})`;
	},

	identifier(c1, cN, _colonDividedBy, a) {
		const arityPart =
			slOptions.simpleArityModel ?
			'' :
			`${a.children.length === 0 ? '' : ('_' + a.sourceString.slice(2))}`;
		const name = `_${c1.sourceString}${cN.sourceString}${arityPart}`;
		return name;
	},
	reservedIdentifier(id) {
		switch(id.sourceString) {
			case 'nil': return 'null';
			case 'true': return 'true';
			case 'false': return 'false';
		}
	},

	floatLiteral(s,i,_,f) {
		return `${s.sourceString}${i.sourceString}.${f.sourceString}`;
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
	singleQuotedStringLiteral(_l, s, _r) {
		return `'${quoteNewLines(s.sourceString)}'`;
	},
	doubleQuotedStringLiteral(_l, s, _r) {
		return `_${genName('parseDoubleQuotedString', 1)}('${s.sourceString}')`;
	},
	backtickQuotedStringLiteral(_l, s, _r) {
		return `_${genName('parseBacktickQuotedString', 1)}('${s.sourceString}')`;
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

const arityOf: any = {
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

function commaList(nodeArray): string {
	return nodeArray.map(e => e.asJs).join(', ');
}

let rewriteGensymCounter = 0;

function gensym() {
	rewriteGensymCounter += 1;
	return `__gensym${rewriteGensymCounter}`;
}

function makeMethod(slProc: string, clsNmArray: string[], mthNm: string, mthBlk): string {
	const blkSource = mthBlk.sourceString;
	const blkArity = mthBlk.arityOf;
	const blkJs = mthBlk.asJs;
	const blkSrc = JSON.stringify(blkSource);
	const slName = sl.methodName(mthNm);
	return clsNmArray.map(function(clsNm) {
		// console.debug(`makeMethod: '${slProc}', '${clsNm}', '${mthNm}'('${slName}'), ${blkArity}`);
		return ` sl.${slProc}('${clsNm}', '${slName}', ${blkArity}, ${blkJs}, ${blkSrc});`
	}).join(' ');
}

function makeMethodList(slProc: string, clsNmArray: string[], mthNms: string[], mthBlks): string {
	let mthList = '';
	while (mthNms.length > 0) {
		const mthNm = mthNms.shift();
		const mthBlk = mthBlks.shift();
		const mthSrc = makeMethod(slProc, clsNmArray, mthNm, mthBlk);
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
