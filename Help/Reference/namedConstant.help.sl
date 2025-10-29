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

Scatter plot of the decimal digits of the natural logarithm of two,
OEIS [A002162](https://oeis.org/A002162):

~~~spl svg=A
'Ln(2)'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/namedConstant-A.svg)

Scatter plot of the continued fraction of the natural logarithm of two,
OEIS [A016730](https://oeis.org/A016730):

~~~spl svg=B
'Ln(2)'
.namedConstant
.continuedFraction(78)
.scatterPlot
~~~

![](sw/spl/Help/Image/namedConstant-B.svg)

* * *

See also: Decimal

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Constant.html)
_OEIS_
[1](https://oeis.org/A002162)
[2](https://oeis.org/A016730)
