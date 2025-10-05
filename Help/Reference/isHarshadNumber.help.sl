# isHarshadNumber

- _isHarshadNumber(n, b=10)_

Answer `true` if _n_ is a Harshad number.

First few terms,
OEIS [A005349](https://oeis.org/A005349):

```
>>> 1:205.select(isHarshadNumber:/1)
[
	  1   2   3   4   5
	  6   7   8   9  10
	 12  18  20  21  24
	 27  30  36  40  42
	 45  48  50  54  60
	 63  70  72  80  81
	 84  90 100 102 108
	110 111 112 114 117
	120 126 132 133 135
	140 144 150 152 153
	156 162 171 180 190
	192 195 198 200 201
	204
]
```

Harshad chain of twelve places:

```
>>> 2016502858579884466176L
>>> .isHarshadNumber
true

>>> { :n |
>>> 	n / n.integerDigits.sum
>>> }.nestList(
>>> 	2016502858579884466176L,
>>> 	11
>>> )
[
	2016502858579884466176L
	18671322764628559872L
	188599219844732928L
	1905042624694272
	30238771820544
	559977255936
	7777461888
	123451776
	3429216
	127008
	7056
	392
]
```

* * *

See also: divisible, integerDigits, mod, sum

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HarshadNumber.html),
_OEIS_
[1](https://oeis.org/A005349),
_W_
[1](https://en.wikipedia.org/wiki/Harshad_number)
