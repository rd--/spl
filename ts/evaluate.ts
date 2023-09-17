import * as rewrite from './rewrite.ts'

export function evaluateFor(packageName: string, text: string) {
	var errText = function(err, toEval) {
		return `evaluateFor: eval: ${err}: ${packageName}: ${text}: ${toEval}`;
	};
	if(text.trim().length > 0) {
		try {
			rewrite.context.packageName = packageName;
			const toEval = rewrite.rewriteString(text);
			rewrite.context.packageName = '*UnknownPackage*';
			if(toEval.trim().length > 0) {
				try {
					return eval(toEval);
				} catch(err) {
					return console.error(errText(err, toEval));
				}
			}
		} catch (err) {
			return console.error(errText(err, 'rewrite failed'));
		}
	}
	// console.debug('evaluateFor: empty?');
	return null;
}

// Note: "package" is a reserved word, c.f. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar
export class Package {
	category: string;
	name: string;
	requires: string[];
	url: string;
	text: string;
	constructor(category: string, name: string, requires: string[], url: string, text: string) {
		this.category = category;
		this.name = name;
		this.requires = requires;
		this.url = url;
		this.text = text;
	}
}

export function evaluatePackage(pkg: Package) {
	return evaluateFor(pkg.name, pkg.text);
}

export async function evaluatePackageArrayInSequence(pkgArray: Package[]) {
	for(let pkg of pkgArray) {
		await evaluatePackage(pkg);
	}
}

/*
export async function evaluateUrl(url: string) {
	// console.debug(`evaluateUrl: ${url}`);
	await fetch(url, { cache: 'no-cache' }).then(response => response.text()).then(evaluateSourceText);
}
*/
