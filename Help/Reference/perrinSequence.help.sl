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

* * *

See also: padovanSequence, perrinFunction, plasticRatio

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PerrinSequence.html),
_OEIS_
[1](https://oeis.org/A001608),
_W_
[1](https://en.wikipedia.org/wiki/Perrin_number)

Categories: Math, Sequence
