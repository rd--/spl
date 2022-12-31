// @ts-nocheck

import { arraySum } from '../lib/jssc3/ts/kernel/array.ts'

import { slSemantics, slParse, slTemporariesSyntaxNames } from './grammar.ts'
import { slOptions } from './options.ts'

function genName(name, arity) {
	return slOptions.simpleArityModel ? name : `${name}_${arity}`;
}

const asJs: any = {

    ClassExtension(_e, clsNm, _l, mthNm, mthBlk, _r) {
		return makeMethodList('addMethod', [clsNm.sourceString], mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
    ClassListExtension(_e, _cl, clsNmList, _cr, _ml, mthNm, mthBlk, _mr) {
		const clsNmArray = clsNmList.asIteration().children.map(c => c.sourceString);
		// console.debug(`ClassListExtension: [${clsNmArray}].size = ${clsNmArray.length}`);
		return makeMethodList('addMethod', clsNmArray, mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
    ClassDefinition(clsNm, trt, _l, tmp, mthNm, mthBlk, _r) {
		function makeClassDefinition(clsNm: string, trt: string[], tmp, mthNms, mthBlks) {
			const tmpSrc = tmp.sourceString;
			const tmpNm = tmpSrc === '' ? [] : slTemporariesSyntaxNames(tmpSrc).map(nm => `'${nm}'`);
			const typ = `sl.addType('${clsNm}', [${tmpNm}]);`;
			const addTraits = `sl.addTypeTraits('${clsNm}', [${trt}]);`;
			const cpyTraits = trt.split(', ').filter(each => each.length > 0).map(trtNm => `sl.copyTraitToType(${trtNm}, '${clsNm}');`).join(' ');
			const mth = makeMethodList('addMethod', [clsNm], mthNms, mthBlks);
			return `${typ}${addTraits}${cpyTraits}${mth}`;
		}
		return makeClassDefinition(clsNm.sourceString, trt.asJs, tmp, mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
	TraitList(_c, _l, nm, _r) { return nm.asIteration().children.map(c => `'${c.sourceString}'`).join(', '); },
	TraitExtension(_p, _t, trtNm, _l, mthNm, mthBlk, _r) {
		// console.debug(`TraitExtension: ${trtNm.sourceString}`);
		return makeMethodList('extendTraitWithMethod', [trtNm.sourceString], mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
	TraitDefinition(_t, trtNm, _l, mthNm, mthBlk, _r) {
		const trt = `sl.addTrait('${trtNm.sourceString}');`;
		const mth = makeMethodList('addTraitMethod', [trtNm.sourceString], mthNm.children.map(c => c.sourceString), mthBlk.children);
		return `${trt}${mth}`;
	},
    Program(tmp, stm) { return tmp.asJs + stm.asJs; },
    TemporariesWithInitializers(_l, tmp, _s, _r) { return `var ${commaList(tmp.asIteration().children)};`; },
    TemporaryWithBlockLiteralInitializer(nm, _, blk) {
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
    TemporaryWithExpressionInitializer(nm, _, exp) { return `${nm.asJs} = ${exp.asJs}`; },
    TemporaryWithDictionaryInitializer(_l, lhs, _r, _e, rhs) {
		const namesArray = lhs.asIteration().children.map(c => c.sourceString);
		const rhsName = gensym();
		const slots = namesArray.map((name) => `_${name} = _${genName('at', 2)}(${rhsName}, '${name}')`).join(', ');
		return `${rhsName} = ${rhs.asJs}, ${slots}`;
	},
    TemporaryWithArrayInitializer(_l, lhs, _r, _e, rhs) {
		const namesArray = lhs.asIteration().children.map(c => c.sourceString);
		const rhsName = gensym();
		const slots = namesArray.map((name, index) => `_${name} = _${genName('at', 2)}(${rhsName}, ${index + 1})`).join(', ');
		return `${rhsName} = ${rhs.asJs}, ${slots}`;
	},
    TemporariesWithoutInitializers(_l, tmp, _r) { return `var ${commaList(tmp.children)};`; },
    TemporariesVarSyntax(_l, tmp, _r) { return `var ${commaList(tmp.asIteration().children)};`; },
    Assignment(lhs, _, rhs) { return `${lhs.asJs} = ${rhs.asJs}`; },
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

	AtPutSyntax(c, _l, k, _r, _e, v) { return `_${genName('atPut', 3)}(${c.asJs}, ${k.asJs}, ${v.asJs})`; },
	AtPutQuotedSyntax(c, _c, k, _e, v) { return `_${genName('atPut', 3)}(${c.asJs}, '${k.sourceString}', ${v.asJs})`; },
	AtSyntax(c, _l, k, _r) { return `_${genName('at', 2)}(${c.asJs}, ${k.asJs})`; },
	AtQuotedSyntax(c, _c, k) { return `_${genName('at', 2)}(${c.asJs}, '${k.sourceString}')`; },
	ValueApplySyntax(p, _d, a) { return `${p.asJs}(${a.asJs})`; },
    NonEmptyParameterList(_l, sq, _r) { return commaList(sq.asIteration().children); },

    DotExpressionWithTrailingClosuresSyntax(lhs, _dot, nm, args, tc) {
		const name = `${genName(nm.asJs, 1 + args.arityOf + tc.children.length)}`;
		return `${name}(${[lhs.asJs].concat(args.children.map(c => c.asJs), tc.children.map(c => c.asJs))})`;
	},
    DotExpressionWithTrailingDictionariesSyntax(lhs, _dot, nm, args, tc) {
		const name = `${genName(nm.asJs, 1 + args.arityOf + tc.children.length)}`;
		return `${name}(${[lhs.asJs].concat(args.children.map(c => c.asJs), tc.children.map(c => c.asJs))})`;
	},
    DotExpressionWithAssignmentSyntax(lhs, _dot, nm, _asg, rhs) { return `${genName(nm.asJs, 2)}(${lhs.asJs}, ${rhs.asJs})`; },
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

	ImplicitDictionaryAtPutSyntax(_c, k, _a, e) { return `_${genName('atPut', 3)}(_implicitDictionary, '${k.sourceString}', ${e.asJs})`; },
	ImplicitDictionaryAtSyntax(_c, k) { return `_${genName('at', 2)}(_implicitDictionary, '${k.sourceString}')`; },

    Block(_l, blk, _r) { return blk.asJs; },
    BlockBody(arg, tmp, prm, stm) {
		let arityCheck = '';
		if(slOptions.insertArityCheck) {
			arityCheck = `if(arguments.length !== ${arg.arityOf}) { var err = 'Arity: expected ${arg.arityOf}, ${arg.asJs}'; console.error(err); throw err; }`;
		}
		return `(function(${arg.asJs}) { ${arityCheck} ${tmp.asJs} ${prm.asJs} ${stm.asJs} })`;
	},
    Arguments(arg, _r) { return commaList(arg.children); },
    ArgumentName(_c, nm) { return nm.asJs; },
    Primitive(_l, s, _r) { return s.sourceString; },
    NonFinalExpression(e, _, stm) { return `${e.asJs}; ${stm.asJs};`; },
    FinalExpression(e, _) { return `return ${e.asJs};`; },

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
    Apply(rcv, arg) { return `${genName(rcv.asJs, arg.arityOf)}(...[${arg.asJs}])`; },
    ParameterList(_l, sq, _r) { return commaList(sq.asIteration().children); },
    ParenthesisedExpression(_l, e, _r) { return `(${e.asJs})`; },
    DictionaryExpression(_l, dict, _r) { return `new Map([${commaList(dict.asIteration().children)}])`; },
    NonEmptyDictionaryExpression(_l, dict, _r) { return `new Map([${commaList(dict.asIteration().children)}])`; },
    AssociationExpression(lhs, _arrow, rhs) { return `['${lhs.sourceString}', ${rhs.asJs}]`; },
    ArrayExpression(_l, array, _r) { return `[${commaList(array.asIteration().children)}]`; },
    ArrayRangeSyntax(_l, start, _d, end, _r) { return `_${genName('asArray', 1)}(_${genName('to', 2)}(${start.asJs}, ${end.asJs}))`; },
    ArrayRangeThenSyntax(_l, start, _c_, then, _d, end, _r) { return `_${genName('asArray', 1)}(_${genName('thenTo', 3)}(${start.asJs}, ${then.asJs}, ${end.asJs}))`; },
    IntervalSyntax(_l, start, _d, end, _r) { return `_${genName('to', 2)}(${start.asJs}, ${end.asJs})`; },
    IntervalThenSyntax(_l, start, _c_, then, _d, end, _r) { return `_${genName('thenTo', 3)}(${start.asJs}, ${then.asJs}, ${end.asJs})`; },

    identifier(c1, cN, _, a) {
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

    floatLiteral(s,i,_,f) { return `${s.sourceString}${i.sourceString}.${f.sourceString}`; },
    integerLiteral(s,i) { return `${s.sourceString}${i.sourceString}`; },
    singleQuotedStringLiteral(_l, s, _r) { return `'${s.sourceString}'`; },
    doubleQuotedStringLiteral(_l, s, _r) { return `_${genName('parseDoubleQuotedString', 1)}('${s.sourceString}')`; },
    backtickQuotedStringLiteral(_l, s, _r) { return `_${genName('parseBacktickQuotedString', 1)}('${s.sourceString}')`; },

	NonemptyListOf(first, _sep, rest) { return `${first.asJs}; ${rest.children.map(c => c.asJs)}`; },
	EmptyListOf() { return ''; },
    _iter(...children) { return children.map(c => c.asJs).join(''); },
    _terminal() { return this.sourceString; }
};

slSemantics.addAttribute('asJs', asJs);

const arityOf: any = {
    NonEmptyParameterList(_l, sq, _r) { return sq.asIteration().children.length },
	ParameterList(_l, sq, _r) { return sq.asIteration().children.length },
	Block(_l, blk, _r) { return blk.arityOf; },
    BlockBody(arg, tmp, prm, stm) { return arg.arityOf; },
    Arguments(nm, _) { return nm.children.length },
    _iter(...children) { return arraySum(children.map(c => c.arityOf)); },
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
