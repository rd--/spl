# perrinSequence

- _perrinSequence(n)_

Answer the first _n_ elements of the Perrin sequence,
OEIS [A001608](https://oeis.org/A001608):

```
>>> 27.perrinSequence
[
	   3    0    2    3    2
	   5    5    7   10   12
	  17   22   29   39   51
	  68   90  119  158  209
	 277  367  486  644  853
	1130 1497
]

>>> [0 1 1].linearRecurrence([3 0 2], 17)
[3 0 2 3 2 5 5 7 10 12 17 22 29 39 51 68 90]
```

C.f. `perrinFunction`:

```
>>> 0:26.collect(perrinFunction:/1)
[
	   3    0    2    3    2
	   5    5    7   10   12
	  17   22   29   39   51
	  68   90  119  158  209
	 277  367  486  644  853
	1130 1497
]
```

The Perrin sequence,
OEIS [A001608](https://oeis.org/A001608):

~~~spl svg=A
35.perrinSequence.discretePlot
~~~

![](sw/spl/Help/Image/perrinSequence-A.svg)

* * *

See also: padovanSequence, perrinFunction, plasticRatio, vanDerLaanSequence

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PerrinSequence.html),
_OEIS_
[1](https://oeis.org/A001608),
_W_
[1](https://en.wikipedia.org/wiki/Perrin_number)

Categories: Math, Sequence
