# romanNumeral

- _romanNumeral(n)_

Answer the roman numeral notation for the integer _n_.

```
>>> 2023.romanNumeral
'MMXXIII'
```

Threads over lists:

```
>>> [
>>> 	296 110 175 145 119
>>> 	332 174 403 188  42
>>> ].romanNumeral
[
	'CCXCVI' 'CX' 'CLXXV'
	'CXLV' 'CXIX' 'CCCXXXII'
	'CLXXIV' 'CDIII' 'CLXXXVIII'
	'XLII'
]
```

Roman numerals are constructed using the letters I, V, X, L, C, D, and M:

```
>>> [
>>> 	1 2 3 4 5
>>> 	10 50 60 100 250
>>> 	500 1000 1500 2600
>>> ].romanNumeral
[
	'I' 'II' 'III' 'IV' 'V'
	'X' 'L' 'LX' 'C' 'CCL'
	'D' 'M' 'MD' 'MMDC'
]
```

The integer zero is represented using the numeral N,
no other Roman numeral contains the letter N:

```
>>> 0.romanNumeral
'N'
```

Signs are included:

```
>>> -7.romanNumeral
'-VII'
```

The inverse is `fromRomanNumeral`:

```
>>> 'MMXXV'.fromRomanNumeral
2025
```

* * *

See also: integerString, fromRomanNumeral

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RomanNumerals.html)
[2](https://reference.wolfram.com/language/ref/RomanNumeral.html),
_W_
[1](https://en.wikipedia.org/wiki/Roman_numerals)

Categories: Converting
