import ohm from 'https://unpkg.com/ohm-js@17.1.0/dist/ohm.esm.js';

import { slParse, slSemantics } from './grammar.ts';

import * as rewrite from './rewrite-shared.ts';

import { rewriteSlToCore } from './rewrite-spl-to-core.ts';

function isJsArityQualifiedName(s: string): boolean {
	const isSpecialVar = s.startsWith('__Spl'); /* __SplVar or __SplUnused */
	return !isSpecialVar && s.includes('_', 1);
}

function jsArityQualifiedNameParseArity(s: string): number {
	const r = /_([0-9]+)$/;
	const m = s.match(r);
	if (!m) {
		throw new Error(
			`jsArityQualifiedNameParseArity: cannot parse arity from '${s}'`,
		);
	}
	return Number(m[1]);
}

function genName(name: string, arity: number): string {
	return `${name}_${arity}`;
}

function genArityChecks(argJs: string, arityCheckContextLabel: string): string {
	const argList = argJs.split(', ');
	const checks = argList.map(
		function (nm) {
			if (isJsArityQualifiedName(nm)) {
				return `sl.splArityCheck(${nm}, ${
					jsArityQualifiedNameParseArity(nm)
				}, '${arityCheckContextLabel}');`;
			}
			return '';
		},
	);
	return checks.join('');
}

function arityCheckInitializer(nameJs: string, rhsJs: string): string {
	const binding = `${nameJs} = ${rhsJs}`;
	if (isJsArityQualifiedName(nameJs)) {
		return `${binding}; ${genArityChecks(nameJs, 'Initializer: ' + nameJs)}`;
	}
	return binding;
}

function quoteNewLines(input: string): string {
	return input.replaceAll('\n', '\\n');
}

function makeMethod(
	slProc: string,
	typeOrTraitNameArray: string[],
	methodName: ohm.Node,
	methodBlock: ohm.Node,
): string {
	const blkCoreSource = methodBlock.sourceString;
	const blkInitialSource = rewrite.rewriteContext.methodBodyInitialSourceTable
		.get(
			blkCoreSource,
		);
	const blkParameters = methodBlock.parametersOf;
	const blkJs = methodBlock.asJs;
	const blkSrc = JSON.stringify(blkInitialSource);
	return typeOrTraitNameArray.map(function (typeOrTraitName) {
		return `sl.${slProc}(\n\t'${typeOrTraitName}',\n\t'${rewrite.rewriteContext.packageName}',\n\t'${methodName}',\n\t${
			JSON.stringify(blkParameters)
		},\n\t${blkJs},\n\t${blkSrc}\n);\n\n`;
	}).join('\n');
}

function extractMethodNameList(
	methodNameOrList: ohm.Node,
): string[] {
	if (methodNameOrList.ctorName === 'MethodNameList') {
		return methodNameOrList.child(1).asIteration().children.map((c) =>
			c.sourceString
		);
	} else {
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
		const methodNameList = extractMethodNameList(
			methodNames.shift()!.child(0),
		);
		const methodBlock = methodBlocks.shift()!;
		for (const methodName of methodNameList) {
			const methodSource = makeMethod(
				slProc,
				typeOrTraitNameArray,
				methodName,
				methodBlock,
			);
			methodList += methodSource;
		}
	}
	return methodList;
}

function makeTypeDefinition(
	isHostType: boolean,
	typeName: string,
	traits: string,
	instanceVariables: string,
	methodNames: ohm.Node[],
	methodBlocks: ohm.Node[],
): string {
	const instanceVariablesList = instanceVariables.split(' ');
	const traitList = traits.split(', ').filter((each) => each.length > 0);
	const addType = `
sl.addType(
\t${isHostType},
\t'${typeName}',
\t'${rewrite.rewriteContext.packageName}',
\t[${traits}],
\t[${instanceVariablesList}]
);`;
	const copyTraits = traitList.map((traitName) => `
sl.copyTraitMethodsToType(
\t${traitName},
\t'${typeName}'
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
	ArgumentsWithoutAnnotations(arg, _vb) {
		return rewrite.commaListJs(arg.children);
	},
	BlockWithoutAnnotations(_l, arg, prm, stm, _r) {
		const argJs = arg.asJs;
		const prmJs = prm.asJs;
		const stmJs = stm.asJs;
		const arityCheck = genArityChecks(argJs, 'Block definition: ' + argJs);
		return [
			`sl.annotateFunction(function(${argJs}) {\n`,
			arityCheck,
			(prmJs.length > 0) ? ('/* Primitive */\n' + prmJs + '\n') : '',
			(stmJs.length > 0) ? ('/* Statements */\n' + stmJs + '\n') : '',
			`}, ${JSON.stringify(arg.parametersOf)})`,
		].join('');
	},
	BlockLiteralInitializer(name, _equals, blk) {
		return arityCheckInitializer(name.asJs, blk.asJs);
	},
	ConciseSlotDefinitions(_l, slots, _r) {
		return slots.children.map(
			(e) => `"${e.sourceString}"`,
		).join(' ');
	},
	VerboseSlotDefinitions(_slot, slots, _semicolon) {
		return slots.children.map(
			(e) => `"${e.sourceString}"`,
		).join(' ');
	},
	EmptyListSyntax(_l, _r) {
		return '[]';
	},
	ExpressionInitializer(name, _equals, exp) {
		return arityCheckInitializer(name.asJs, exp.asJs);
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
		return `[${rewrite.commaListJs(items.asIteration().children)}]`;
	},
	NonEmptyParameterList(_l, sq, _r) {
		return rewrite.commaListJs(sq.asIteration().children);
	},
	NonFinalStatement(e, _semicolon) {
		return `${e.asJs};`;
	},
	ParameterList(_leftParen, sq, _rightParen) {
		return rewrite.commaListJs(sq.asIteration().children);
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
	Statements(nonFinal, final) {
		return nonFinal.asJs + final.asJs;
	},
	TraitDefinition(nm, _l, mn, mb, _r) {
		const traitName = nm.sourceString;
		const trait =
			`sl.addTrait('${traitName}', '${rewrite.rewriteContext.packageName}');\n`;
		const mth = makeMethodList(
			'addMethodToExistingTrait',
			[traitName],
			mn.children,
			mb.children,
		);
		return `${trait}\n${mth}\n`;
	},
	TraitList(_c, _l, names, _r) {
		return names.asIteration().children.map(
			(c) => `'@${c.sourceString}'`,
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
	VectorSyntax(_l, items, _r) {
		const c = items.children;
		if (c.length === 1) {
			return `[${c[0].asJs}]`;
		}
		throw new Error(`VectorSyntax: ${c.length}`);
	},

	argumentName(_c, name) {
		return name.asJs;
	},
	arityQualifiedIdentifier(c1, cN, ip, _solidus, a) {
		return `_${rewrite.rewriteInPlaceName(c1, cN, ip)}_${a.sourceString}`;
	},
	floatLiteral(s, i, _, f, _f) {
		const sStr = s.sourceString;
		const iStr = i.sourceString;
		const fStr = f.sourceString;
		return `${sStr}${iStr}.${fStr}`;
	},
	infinityLiteral(s, i) {
		return s.sourceString + i.sourceString;
	},
	lowercaseArityQualifiedIdentifier(c1, cN, ip, _solidus, a) {
		return `_${rewrite.rewriteInPlaceName(c1, cN, ip)}_${a.sourceString}`;
	},
	smallIntegerLiteral(s, i) {
		const sStr = s.sourceString;
		const iStr = i.sourceString;
		const x = parseInt(rewrite.deleteUnderscores(iStr));
		if (Number.isSafeInteger(x)) {
			return `${sStr + x}`;
		} else {
			throw new Error('smallIntegerLiteral: not small integer: ' + x);
		}
	},
	largeIntegerLiteral(s, i, _l) {
		const sT = s.sourceString;
		let iT = rewrite.deleteLeadingZeroes(i.sourceString);
		return `${sT}${iT}n`;
	},
	lowercaseIdentifier(c1, cN, ip) {
		return `_${rewrite.rewriteInPlaceName(c1, cN, ip)}`;
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
				throw new Error('rewrite_core_js: reservedIdentifier?');
		}
	},
	singleQuotedStringLiteral(_l, s, _r) {
		return `'${quoteNewLines(s.sourceString)}'`;
	},
	systemVariableIdentifier(p, k) {
		return p.sourceString + k.sourceString;
	},
	unqualifiedIdentifier(c1, cN, ip) {
		return `_${rewrite.rewriteInPlaceName(c1, cN, ip)}`;
	},
	unusedVariableIdentifier(_underscore) {
		return rewrite.genPackageSym('__SplUnused');
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

const arityOf: ohm.ActionDict<number> = {
	ArgumentsWithoutAnnotations(names, _) {
		return names.children.length;
	},
	NonEmptyParameterList(_l, sq, _r) {
		return sq.asIteration().children.length;
	},
	ParameterList(_l, sq, _r) {
		return sq.asIteration().children.length;
	},

	_iter(...children) {
		return children.map(
			(c) => c.arityOf,
		).reduce(
			(a, b) => a + b,
			0,
		);
	},
};

slSemantics.addAttribute('arityOf', arityOf);

function slFirstLineComment(slText: string): string | null {
	if (slText.startsWith('/*')) {
		const index = slText.indexOf('*/');
		return (index > 0) ? slText.slice(2, index) : null;
	} else {
		return null;
	}
}

// Preserve first line comment for Requires information in .cache
export function rewriteSlToJs(slText: string): string {
	const slCoreText = rewriteSlToCore(slText);
	// console.debug('rewriteSlToJs', slText, slCoreText);
	const jsText = slParse(slCoreText).asJs;
	const slComment = slFirstLineComment(slText);
	if (slComment) {
		return `/* ${slComment} */\n\n` + jsText;
	} else {
		return jsText;
	}
}

export function rewriteSlToJsFor(packageName: string, slText: string): string {
	let jsText: string;
	rewrite.initializeRewriteContext(packageName);
	try {
		jsText = rewriteSlToJs(slText);
		rewrite.initializeRewriteContext('*UnknownPackage*');
		return jsText;
	} catch (err) {
		rewrite.initializeRewriteContext('*UnknownPackage*');
		throw new Error('rewriteSlToJsFor: Rewrite failed: ', { cause: err });
	}
}
