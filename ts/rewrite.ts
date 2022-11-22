// @ts-nocheck

import { consoleDebug } from '../lib/jssc3/ts/kernel/error.ts'

import { slSemantics, slParse, slBlockArity, slTemporariesSyntaxNames } from './grammar.ts'

// This is noticeably slower because of the way the arity is checked, for now make optional.
const insertArityCheck = false;

const asJs: any = {

    ClassExtension(_e, clsNm, _l, mthNm, mthBlk, _r) {
		return makeMethodList('addMethod', clsNm.sourceString, mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
    ClassDefinition(clsNm, trt, _l, tmp, mthNm, mthBlk, _r) {
		function makeClassDefinition(clsNm: string, trt: string[], tmp, mthNms, mthBlks) {
			const tmpSrc = tmp.sourceString;
			const tmpNm = tmpSrc === '' ? [] : slTemporariesSyntaxNames(tmpSrc).map(nm => `'${nm}'`);
			const typ = `sl.addType('${clsNm}', [${tmpNm}]);`;
			const addTraits = `sl.addTypeTraits('${clsNm}', [${trt}]);`;
			const cpyTraits = trt.split(', ').filter(each => each.length > 0).map(trtNm => `sl.copyTraitToType(${trtNm}, '${clsNm}');`).join(' ');
			const mth = makeMethodList('addMethod', clsNm, mthNms, mthBlks);
			return `${typ}${addTraits}${cpyTraits}${mth}`;
		}
		return makeClassDefinition(clsNm.sourceString, trt.asJs, tmp, mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
	TraitList(_c, _l, nm, _r) { return nm.asIteration().children.map(c => `'${c.sourceString}'`).join(', '); },
	TraitExtension(_p, _t, trtNm, _l, mthNm, mthBlk, _r) {
		consoleDebug(`TraitExtension: ${trtNm.sourceString}`);
		return makeMethodList('extendTraitWithMethod', trtNm.sourceString, mthNm.children.map(c => c.sourceString), mthBlk.children);
	},
	TraitDefinition(_t, trtNm, _l, mthNm, mthBlk, _r) {
		const trt = `sl.addTrait('${trtNm.sourceString}');`;
		const mth = makeMethodList('addTraitMethod', trtNm.sourceString, mthNm.children.map(c => c.sourceString), mthBlk.children);
		return `${trt}${mth}`;
	},
    Program(tmp, stm) { return tmp.asJs + stm.asJs; },
    TemporariesWithInitializers(_l, tmp, _s, _r) { return 'var ' + commaList(tmp.asIteration().children) + ';'; },
    TemporaryWithIdentifierInitializer(nm, _, exp) { return nm.asJs + ' = ' + exp.asJs; },
    TemporaryWithDictionaryInitializer(_l, lhs, _r, _e, rhs) {
		const namesArray = lhs.asIteration().children.map(c => c.sourceString);
		const rhsName = gensym();
		const slots = namesArray.map((name) => `_${name} = _at(${rhsName}, '${name}')`).join(', ');
		return `${rhsName} = ${rhs.asJs}, ${slots}`;
	},
    TemporaryWithArrayInitializer(_l, lhs, _r, _e, rhs) {
		const namesArray = lhs.asIteration().children.map(c => c.sourceString);
		const rhsName = gensym();
		const slots = namesArray.map((name, index) => `_${name} = _at(${rhsName}, ${index + 1})`).join(', ');
		return `${rhsName} = ${rhs.asJs}, ${slots}`;
	},
    TemporariesWithoutInitializers(_l, tmp, _r) { return 'var ' + commaList(tmp.children) + '; '; },
    TemporariesVarSyntax(_l, tmp, _r) { return 'var ' + commaList(tmp.asIteration().children) + '; '; },
    Assignment(lhs, _, rhs) { return lhs.asJs + ' = ' + rhs.asJs; },
    BinaryExpression(lhs, ops, rhs) {
		let left = lhs.asJs;
		const opsArray = ops.children.map(c => c.asJs);
		const rhsArray = rhs.children.map(c => c.asJs);
		while (opsArray.length > 0) {
			const op = opsArray.shift();
			const right = rhsArray.shift();
			left = `_${sl.operatorMethodName(op)}(${left}, ${right})`;
		}
		return left;
	},

	PutSyntax(c, _l, k, _r, _e, v) { return `_put(${c.asJs}, ${k.asJs}, ${v.asJs})`; },
	PutQuotedSyntax(c, _c, k, _e, v) { return `_put(${c.asJs}, '${k.sourceString}', ${v.asJs})`; },
	AtSyntax(c, _l, k, _r) { return `_at(${c.asJs}, ${k.asJs})`; },
	AtQuotedSyntax(c, _c, k) { return `_at(${c.asJs}, '${k.sourceString}')`; },
	ValueSyntax(p, _d, a) { return `${p.asJs}(${a.asJs})`; },
    NonEmptyParameterList(_l, sq, _r) { return commaList(sq.asIteration().children); },

    DotExpressionWithTrailingClosuresSyntax(lhs, _dot, nm, args, tc) {
		return `${nm.asJs}(${[lhs.asJs].concat(args.children.map(c => c.asJs), tc.children.map(c => c.asJs))})`;
	},
    DotExpressionWithAssignmentSyntax(lhs, _dot, nm, _asg, rhs) { return `${nm.asJs}(${lhs.asJs}, ${rhs.asJs})`; },
    DotExpression(lhs, _dot, nms, args) {
		let rcv = lhs.asJs;
		const namesArray = nms.children.map(c => c.asJs);
		const argsArray = args.children.map(c => c.asJs);
		while (namesArray.length > 0) {
			const nm = namesArray.shift();
			const arg = argsArray.shift();
			if(arg.length === 0) {
				rcv = `${nm}(${rcv})`;
			} else {
				rcv = `${nm}(${[rcv].concat([arg])})`;
			}
		}
		return rcv;
	},

	ImplicitDictionaryPutSyntax(_c, k, _a, e) { return `_put(_implicitDictionary, '${k.sourceString}', ${e.asJs})`; },
	ImplicitDictionaryAtSyntax(_c, k) { return `_at(_implicitDictionary, '${k.sourceString}')`; },

    Block(_l, blk, _r) { return blk.asJs; },
    BlockBody(arg, tmp, prm, stm) {
		let arityCheck = '';
		if(insertArityCheck) {
			const blkSource = '{ ' + this.sourceString + '}'
			const arity = slBlockArity(blkSource);
			arityCheck = `if(arguments.length !== ${arity}) { throw(Error('Arity')); }`;
		}
		return `function(${arg.asJs}) { ${arityCheck} ${tmp.asJs} ${prm.asJs} ${stm.asJs} }`;
	},
    ArgumentList(arg, _r) { return commaList(arg.children); },
    ArgumentName(_c, nm) { return nm.asJs; },
    ArgumentListArgSyntax(_l, arg, _r) { return commaList(arg.asIteration().children); },
    Primitive(_l, s, _r) { return s.sourceString; },
    NonFinalExpression(e, _, stm) { return e.asJs + '; ' + stm.asJs; },
    FinalExpression(e, _) { return 'return ' + e.asJs + ';'; },

    ApplyWithTrailingClosuresSyntax(rcv, arg, tc) {
		const opt = arg.asJs;
		return `${rcv.asJs}(...[${opt === '' ? '' : opt + ', '} ${commaList(tc.children)}])`;
	},
    Apply(rcv, arg) { return `${rcv.asJs}(...[${arg.asJs}])`; },
    ParameterList(_l, sq, _r) { return commaList(sq.asIteration().children); },
    ParenthesisedExpression(_l, e, _r) { return '(' + e.asJs + ')'; },
    DictionaryExpression(_l, dict, _r) { return `new Map([${commaList(dict.asIteration().children)}])`; },
    AssociationExpression(lhs, _arrow, rhs) { return `['${lhs.sourceString}', ${rhs.asJs}]`; },
    ArrayExpression(_l, array, _r) { return `[${commaList(array.asIteration().children)}]`; },
    ArrayRangeSyntax(_l, start, _d, end, _r) { return `_asArray(_to(${start.asJs}, ${end.asJs}))`; },
    ArrayRangeThenSyntax(_l, start, _c_, then, _d, end, _r) { return `_asArray(_thenTo(${start.asJs}, ${then.asJs}, ${end.asJs}))`; },
    IntervalSyntax(_l, start, _d, end, _r) { return `_to(${start.asJs}, ${end.asJs})`; },
    IntervalThenSyntax(_l, start, _c_, then, _d, end, _r) { return `_thenTo(${start.asJs}, ${then.asJs}, ${end.asJs})`; },

    identifier(_l, _r) { return `_${this.sourceString}`; },
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
    doubleQuotedStringLiteral(_l, s, _r) { return `_parseDoubleQuotedString('${s.sourceString}')`; },
    backtickQuotedStringLiteral(_l, s, _r) { return `_parseBacktickQuotedString('${s.sourceString}')`; },

	NonemptyListOf(first, _sep, rest) { return first.asJs + '; ' + rest.children.map(c => c.asJs); },
	EmptyListOf() { return ''; },
    _iter(...children) { return children.map(c => c.asJs).join(''); },
    _terminal() { return this.sourceString; }
};

slSemantics.addAttribute('asJs', asJs);

function commaList(nodeArray): string {
    return nodeArray.map(e => e.asJs).join(', ');
}

let rewriteGensymCounter = 0;

function gensym() {
	rewriteGensymCounter += 1;
	return `__gensym${rewriteGensymCounter}`;
}

function makeMethod(slProc: string, clsNm: string, mthNm: string, mthBlk): string {
	const blkSource = mthBlk.sourceString;
	const blkArity = slBlockArity(blkSource);
	return ` sl.${slProc}('${clsNm}', '${sl.methodName(mthNm)}', ${blkArity}, ${mthBlk.asJs}, ${JSON.stringify(blkSource)});`;
}

function makeMethodList(slProc: string, clsNm: string, mthNms: string[], mthBlks): string {
	let mthList = '';
	while (mthNms.length > 0) {
		const mthNm = mthNms.shift();
		const mthBlk = mthBlks.shift();
		mthList += makeMethod(slProc, clsNm, mthNm, mthBlk);
	}
	return mthList;
}

export function rewriteString(str: string): string {
	const answer = slParse(str).asJs;
	consoleDebug(`rewriteString: ${str} => ${answer}`);
	return answer;
}
