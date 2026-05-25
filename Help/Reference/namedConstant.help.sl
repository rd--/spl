# namedConstant

- _namedConstant(s)_

Answer a `Decimal` number representing the mathematical or physical constant named at the `String` _s_.

The continued fraction of the natural logarithm of two,
OEIS [A016730](https://oeis.org/A016730):

```
>>> 'Ln(2)'
>>> .namedConstant
>>> .continuedFraction(78)
[
	 0  1  2  3  1  6  3  1  1  2
	 1  1  1  1  3 10  1  1  1  2
	 1  1  1  1  3  2  3  1 13  7
	 4  1  1  1  7  2  4  1  1  2
	 5 14  1 10  1  4  2 18  3  1
	 4  1  6  2  7  3  3  1 13  3
	 1  4  4  1  3  1  1  1  1  2
	17  3  1  2 32  1  1  1
]
```

Continued fraction expansion of _log₁₀(2)_,
OEIS [A028232](https://oeis.org/A028232):

```
>>> 'Log10(2)'.namedConstant
>>> .continuedFraction(87)
[
	0 3  3  9  2 2  4 6 2 1
	1 3  1 18  1 6  1 2 1 1
	4 1 42  6  1 4  2 3 1 2
	6 1  3  4  1 8  1 4 1 2
	2 7  1  4  1 1  3 3 1 3
	1 1  7  6  1 5 10 2 2 1
	8 1  2 16 24 1  6 1 8 1
	1 5  1  1  1 1  1 2 1 1
	3 7  1  1 10 3  2
]
```

The decimal digits of the natural logarithm of two,
OEIS [A002162](https://oeis.org/A002162):

~~~spl svg=A oeis=A002162 constant
'Ln(2)'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](Help/Image/namedConstant-A.svg)

The continued fraction of the natural logarithm of two,
OEIS [A016730](https://oeis.org/A016730):

~~~spl svg=B oeis=A016730
'Ln(2)'
.namedConstant
.continuedFraction(78)
.scatterPlot
~~~

![](Help/Image/namedConstant-B.svg)

* * *

See also: Decimal

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Constant.html)
_OEIS_
[1](https://oeis.org/A002162)
[2](https://oeis.org/A016730)
