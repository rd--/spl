# oddPart

- _oddPart(n)_

Answer the odd part of the integer _n_,
the highest odd divisor of _n_.

The first few terms,
OEIS [A000265](https://oeis.org/A000265):

```
>>> 1:20.collect(oddPart:/1)
[
	 1  1  3  1  5  3  7  1  9  5
	11  3 13  7 15  1 17  9 19  5
]
```

Plot:

~~~spl svg=A
1:150.collect(oddPart:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/oddPart-A.svg)

* * *

See also: evenPart, integerExponent

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OddPart.html),
_OEIS_
[1](https://oeis.org/A000265)

