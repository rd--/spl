import { stringCapitalizeFirstLetter } from '../lib/jssc3/ts/kernel/string.ts';

/*
The characters ':' and ';' and '.' aren't allowed in operator names.
They're here so help file lookup can find them.
*/
export const operatorCharacters = '+*-/&|@<>=%!\\~?^#$:;.';

export function isOperatorName(name: string): boolean {
	return operatorCharacters.includes(name.charAt(0));
}

export const operatorCharacterNameTable: Record<string, string> = {
	'~': 'tilde',
	'!': 'bang', // exclamationMark exclamationPoint
	'@': 'commercialAt', // atSign p[q] == at(p,q)
	'#': 'hash', // numberSign
	'$': 'dollar', // dollarSign
	'%': 'modulo', // percent
	'^': 'raisedTo', // caret circumflex hat
	'&': 'and', // ampersand
	'*': 'times', // asterisk
	'-': 'minus', // hyphen
	'+': 'plus',
	'=': 'equals',
	'|': 'or', // verticalBar
	'\\': 'backslash',
	':': 'colon',
	';': 'semicolon',
	'.': 'dot', // period fullStop
	'<': 'lessThan',
	'>': 'greaterThan',
	'?': 'query', // questionMark
	'/': 'dividedBy', // slash
};

export function operatorMethodName(operator: string): string {
	const words = [...operator].map((letter) =>
		operatorCharacterNameTable[letter]
	);
	return words.slice(0, 1).concat(
		words.slice(1).map(stringCapitalizeFirstLetter),
	).join('');
}

export function resolveMethodName(name: string): string {
	return isOperatorName(name) ? operatorMethodName(name) : name;
}
