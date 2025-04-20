# delannoySequence

- _delannoySequence(k)_

Square matrix of Delannoy numbers _D(i,j)_ read by antidiagonals.

```
>>> 25.delannoySequence
[
	1  1   1  1  3  1  1  5  5  1
	1  7  13  7  1  1  9 25 25  9
	1  1  11 41 63
]
```

Logarithmic scatter plot of the first few terms:

~~~spl svg=A
99.delannoySequence
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/delannoySequence-A.svg)

* * *

See also: antidiagonalIndicesDo, delannoyNumber

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DelannoyNumber.html),
_OEIS_
[1](https://oeis.org/A008288),
_W_
[1](https://en.wikipedia.org/wiki/Delannoy_number)
