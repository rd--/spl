# fromRomanNumeral

- _fromRomanNumeral(s)_

Answer the integer described by the roman numeral string _s_.

Convert a Roman numeral into a decimal integer:

```
>>> 'MMXXIII'.fromRomanNumeral
2023

>>> 'MCMXXXVII'.fromRomanNumeral
1937
```

Convert a list of Roman numerals into respective decimal integers:

```
>>> 'I II III IV V VI VII VIII'
>>> .words
>>> .fromRomanNumeral
[1 2 3 4 5 6 7 8]
```

The numeral 'N' represents the integer zero:

```
>>> 'N'.fromRomanNumeral
0
```

The inverse is `romanNumeral`:

```
>>> 1234.romanNumeral
'MCCXXXIV'

>>> 2025.romanNumeral
'MMXXV'
```

* * *

See also: romanNumeral

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RomanNumerals.html)
[2](https://reference.wolfram.com/language/ref/FromRomanNumeral.html),
_W_
[1](https://en.wikipedia.org/wiki/Roman_numerals)

Categories: Converting
