# gouldsNumber

- _gouldsNumber(k)_

Answer the _k_-th term of Goulds sequence.

```
>>> 31.gouldsNumber
32

>>> 31L.gouldsNumber
32L
```

Plot first few terms:

~~~spl svg=A
0:64.functionPlot(
	gouldsNumber:/1
)
~~~

![](sw/spl/Help/Image/gouldsNumber-A.svg)

* * *

See also: gouldsSequence, hammingWeight

Guides: Integer Sequence Functions

References:
OEIS
[1](https://oeis.org/A001316),
_W_
[1](https://en.wikipedia.org/wiki/Gould%27s_sequence)
