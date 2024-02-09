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
	'!': 'exclamationMark', // U+0021 ! Exclamation Mark
	'#': 'numberSign', // U+0023 # Number Sign
	'$': 'dollarSign', // U+0024 $ Dollar Sign
	'%': 'percentSign', // U+0025 % Percent Sign
	'&': 'ampersand', // U+0026 & Ampersand
	'*': 'asterisk', // U+002a * Asterisk
	'+': 'plusSign', // U+002b + Plus Sign
	'-': 'hyphenMinus', // U+002d - Hyphen-Minus
	':': 'colon', // U+003a : Colon
	';': 'semicolon', // U+003b ; Semicolon
	'<': 'lessThanSign', // U+003c < Less-Than Sign
	'=': 'equalsSign', // U+003d = Equals Sign
	'>': 'greaterThanSign', // U+003e > Greater-Than Sign
	'.': 'fullStop', // U+002e . Full Stop
	'/': 'solidus', // U+002f / Solidus
	'?': 'questionMark', // U+003f ? Question Mark
	'@': 'commercialAt', // U+0040 @ Commercial At
	'\\': 'reverseSolidus', // U+005c \ Reverse Solidus
	'^': 'circumflexAccent', // U+005e ^ Circumflex Accent
	'|': 'verticalLine', // - U+007c | Vertical Line
	'~': 'tilde', // U+007e ~ Tilde
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
