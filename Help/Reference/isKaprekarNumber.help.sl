# isKaprekarNumber

- _isKaprekarNumber(n, b=10, p=2)_

Answer `true` if the integer _n_ is a Kaprekar number,
at base _b_ and power (or exponent) _p_ .

```
>>> 9.isKaprekarNumber
true

>>> (9.square, 8 + 1)
(81, 9)

>>> 45.isKaprekarNumber
true

>>> (45.square, 20 + 25)
(2025, 45)
```

The first few Kaprekar numbers:

```
>>> 1:2500.select(isKaprekarNumber:/1)
[1 9 45 55 99 297 703 999 2223]
```

Specifying base and power:

```
>>> 2r11.isKaprekarNumber(2, 2)
true

>>> 8r34.isKaprekarNumber(8, 2)
true

>>> 8128.isKaprekarNumber(2, 1)
true
```

* * *

See also: fromDigits, integerDigits, integerLength

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KaprekarNumber.html),
_OEIS_
[1](https://oeis.org/A006886),
_W_
[1](https://en.wikipedia.org/wiki/Kaprekar_number)
