import { stringCapitalizeFirstLetter } from '../lib/jssc3/ts/kernel/string.ts';

export const operatorCharacters = '!#$%&*+-/<=>?@\\^|~';

/* These characters aren't allowed in operator names. They're here so help file lookup can find them. */
export const nonOperatorPunctuationCharacters = '"\'(),:;.[]_`{}';

export const punctuationCharacters = '!#$%&*+-/<=>?@\\^|~"\'(),:;.[]_`{}';

export function isOperatorCharacter(character: string): boolean {
	return (character.length === 1) && operatorCharacters.includes(character[0]);
}

export function isNonOperatorPunctuationCharacter(character: string): boolean {
	return (character.length === 1) && nonOperatorPunctuationCharacters.includes(character[0]);
}

export function isPunctuationCharacter(character: string): boolean {
	return (character.length === 1) && punctuationCharacters.includes(character[0]);
}

export function isOperator(name: string): boolean {
	for (const character of name) {
		if (!operatorCharacters.includes(character)) {
			return false;
		}
	};
	return true;
}

export function isPunctuationToken(name: string): boolean {
	for (const character of name) {
		if (!punctuationCharacters.includes(character)) {
			return false;
		}
	};
	return true;
}

export const punctuationCharacterNameTable: Record<string, string> = {
	// OPERATOR CHARACTERS
	'!': 'exclamationMark', // U+0021 ! Exclamation Mark
	'#': 'numberSign', // U+0023 # Number Sign
	'$': 'dollarSign', // U+0024 $ Dollar Sign
	'%': 'percentSign', // U+0025 % Percent Sign
	'&': 'ampersand', // U+0026 & Ampersand
	'*': 'asterisk', // U+002a * Asterisk
	'+': 'plusSign', // U+002b + Plus Sign
	'-': 'hyphenMinus', // U+002d - Hyphen-Minus
	'<': 'lessThanSign', // U+003c < Less-Than Sign
	'=': 'equalsSign', // U+003d = Equals Sign
	'>': 'greaterThanSign', // U+003e > Greater-Than Sign
	'/': 'solidus', // U+002f / Solidus
	'?': 'questionMark', // U+003f ? Question Mark
	'@': 'commercialAt', // U+0040 @ Commercial At
	'\\': 'reverseSolidus', // U+005c \ Reverse Solidus
	'^': 'circumflexAccent', // U+005e ^ Circumflex Accent
	'|': 'verticalLine', // - U+007c | Vertical Line
	'~': 'tilde', // U+007e ~ Tilde
	// NON-OPERATOR CHARACTERS
	'"': 'quotationMark', // U+0022 " Quotation Mark
	"'": 'apostrophe', // U+0027 ' Apostrophe
	'(': 'leftParenthesis', // U+0028 ( Left Parenthesis
	')': 'rightParenthesis', // U+0029 ) Right Parenthesis
	',': 'comma', // U+002C , Comma
	':': 'colon', // U+003a : Colon
	';': 'semicolon', // U+003b ; Semicolon
	'.': 'fullStop', // U+002e . Full Stop
	'[': 'leftSquareBracket', // U+005B [ Left Square Bracket
	']': 'rightSquareBracket', // U+005D ] Right Square Bracket
	'_': 'lowLine', // Unicode U+005F _ Low Line
	'`': 'graveAccent', // U+0060 ` Grave Accent
	'{': 'leftCurlyBracket', // U+007B { Left Curly Bracket
	'}': 'rightCurlyBracket', // U+007D } Right Curly Bracket
}

export function punctuationTokenName(operator: string): string {
	const words = [...operator].map((letter) =>
		punctuationCharacterNameTable[letter]
	);
	return words.slice(0, 1).concat(
		words.slice(1).map(stringCapitalizeFirstLetter),
	).join('');
}

export function resolveMethodName(name: string): string {
	return isOperator(name) ? punctuationTokenName(name) : name;
}

export function resolveTokenName(name: string): string {
	return isPunctuationToken(name) ? punctuationTokenName(name) : name;
}
