import { stringCapitalizeFirstLetter } from '../lib/jssc3/ts/kernel/string.ts'

export const operatorNameCharacters = '+*-/&|@<>=%!\\~?^#$:';

export function isOperatorName(name: string): boolean {
	return operatorNameCharacters.includes(name.charAt(0));
}

export const operatorNameTable: Record<string,string> = {
	'+': 'plus',
	'*': 'times',
	'-': 'minus',
	'/': 'dividedBy',
	'&': 'and',
	'|': 'or',
	'@': 'at',
	'<': 'lessThan',
	'>': 'greaterThan',
	'=': 'equals',
	'%': 'percent',
	'!': 'bang',
	'\\': 'backslash',
	'~': 'tilde',
	'?': 'query',
	'^': 'hat',
	'#': 'hash',
	'$': 'dollar',
	':': 'colon'
};

export function operatorMethodName(operator: string): string {
	const words = [...operator].map((letter) => operatorNameTable[letter]);
	return words.slice(0, 1).concat(words.slice(1).map(stringCapitalizeFirstLetter)).join('');
}
