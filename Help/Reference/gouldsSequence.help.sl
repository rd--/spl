# gouldsSequence

- _gouldsSequence(k)_

Answer the first _k_ terms of Goulds sequence.
The sequence counts how many odd numbers are in each row of Pascals triangle.

```
>>> 88.gouldsSequence
[
	 1  2  2  4  2  4  4  8  2  4
	 4  8  4  8  8 16  2  4  4  8
	 4  8  8 16  4  8  8 16  8 16
	16 32  2  4  4  8  4  8  8 16
	 4  8  8 16  8 16 16 32  4  8
	 8 16  8 16 16 32  8 16 16 32
	16 32 32 64  2  4  4  8  4  8
	 8 16  4  8  8 16  8 16 16 32
	 4  8  8 16  8 16 16 32
]
```

Log scatter plot of first few terms:

~~~spl svg=A
99.gouldsSequence
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/gouldsSequence-A.svg)

* * *

See also: binomial, gouldsNumber, pascalTriangle

Guides: Integer Sequences

References:
OEIS
[1](https://oeis.org/A001316),
_W_
[1](https://en.wikipedia.org/wiki/Gould%27s_sequence)
