export const operatorNameCharacters = '+*-/&|@<>=%!\\~?^#$';

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
};
