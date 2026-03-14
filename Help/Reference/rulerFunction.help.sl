# rulerFunction

- _rulerFunction(n)_

Answer the exponent of the largest power of two which divides the number _2n_.

The ruler function,
OEIS [A001511](https://oeis.org/A001511):

```
>>> 1:23.collect(rulerFunction:/1)
[
	1 2 1 3 1 2 1 4 1 2
	1 3 1 2 1 5 1 2 1 3
	1 2 1
]
```

The ruler function,
OEIS [A001511](https://oeis.org/A001511):

~~~spl svg=A oeis=A001511
1:47.collect(rulerFunction:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/rulerFunction-A.svg)

First differences of the ruler function,
OEIS [A094267](https://oeis.org/A094267):

~~~spl svg=B oeis=A094267 signed
1:85.collect(rulerFunction:/1)
.differences
.discretePlot
~~~

![](sw/spl/Help/Image/rulerFunction-B.svg)

Every term of the ruler function repeated,
equal to absolute value of first differences,
OEIS [A050603](https://oeis.org/A050603):

~~~spl svg=C oeis=A050603
1:85.collect(rulerFunction:/1)
.differences
.abs
.discretePlot
~~~

![](sw/spl/Help/Image/rulerFunction-C.svg)

* * *

See also: integerExponent

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RulerFunction.html),
_OEIS_
[1](https://oeis.org/A001511),
_W_
[1](https://en.wikipedia.org/wiki/Ruler_function)
