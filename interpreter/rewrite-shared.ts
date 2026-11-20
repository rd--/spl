// Shared context and functions for spl->core, core->js and core->ast rewriters

export const rewriteContext = {
	packageName: '*UnknownPackage*',
	packageSymCounter: 0,
	// key = sl core text (post-rewrite), value = sl text (pre-rewrite)
	methodBodyInitialSourceTable: new Map<string, string>(),
};

export function initializeRewriteContext(name: string): void {
	rewriteContext.packageName = name;
	rewriteContext.packageSymCounter = 0;
	rewriteContext.methodBodyInitialSourceTable.clear();
}

export function genPackageSym(prefix: string): string {
	rewriteContext.packageSymCounter += 1;
	const sym = `${prefix}${rewriteContext.packageSymCounter}`;
	return sym;
}

export function genVarSym(): string {
	return genPackageSym('__SplVar');
}

export function deleteUnderscores(text: string): string {
	return text.replaceAll('_', '');
}

export function deleteLeadingZeroes(s: string): string {
	return s.replace(/^0+(?!\.|$)/, '');
}

export function rewriteInPlaceName(c1: any, cN: any, ip: any): string {
	const ipStr = ip.sourceString;
	const preInPlace = c1.sourceString + cN.sourceString;
	if (ipStr === '!') {
		return preInPlace + 'InPlace';
	} else {
		return preInPlace;
	}
}

export function procList(
	nodeArray: any[],
	fn: (x: any) => string,
	sep: string,
): string {
	return nodeArray.map(fn).join(sep);
}

export function commaList(nodeArray: any[], fn: (x: any) => string): string {
	return procList(nodeArray, fn, ', ');
}

export function commaListJs(nodeArray: any[]): string {
	return commaList(nodeArray, (e) => e.asJs);
}

export function commaListSl(nodeArray: any[]): string {
	return commaList(nodeArray, (e) => e.asSl);
}

export function dropFirstLetter(x: string): string {
	return x.substring(1);
}

export function dropLastLetter(x: string): string {
	return x.substring(0, x.length - 1);
}

export function simplifyIntegerDigits(x: string): string {
	return deleteLeadingZeroes(
		deleteUnderscores(x),
	);
}
