import { stringCapitalizeFirstLetter } from '../lib/jssc3/ts/kernel/string.ts'

// : and ; and . aren't allowed in operator names, but they're here so help file lookup can find them.
export const operatorNameCharacters = '+*-/&|@<>=%!\\~?^#$:;.';

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
	'@': 'commercialAt', // p[q] == at(p,q)
	'<': 'lessThan',
	'>': 'greaterThan',
	'=': 'equals',
	'%': 'modulo',
	'!': 'bang',
	'\\': 'backslash',
	'~': 'not',
	'?': 'query',
	'^': 'hat',
	'#': 'hash',
	'$': 'dollar',
	':': 'colon',
	';': 'semicolon',
	'.': 'dot'
};

export function operatorMethodName(operator: string): string {
	const words = [...operator].map((letter) => operatorNameTable[letter]);
	return words.slice(0, 1).concat(words.slice(1).map(stringCapitalizeFirstLetter)).join('');
}
