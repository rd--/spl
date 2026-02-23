# kolakoskiSequence

- _kolakoskiSequence(n)_

Answer the first _n_ terms of the Kolakoski sequence,
also called the Oldenburger-Kolakoski sequence.

First few terms,
OEIS [A000002](https://oeis.org/A000002):

```
>>> 108.kolakoskiSequence
[
	1 2 2 1 1 2 1 2 2 1
	2 2 1 1 2 1 1 2 2 1
	2 1 1 2 1 2 2 1 1 2
	1 1 2 1 2 2 1 2 2 1
	1 2 1 2 2 1 2 1 1 2
	1 1 2 2 1 2 2 1 1 2
	1 2 2 1 2 2 1 1 2 1
	1 2 1 2 2 1 2 1 1 2
	2 1 2 2 1 1 2 1 2 2
	1 2 2 1 1 2 1 1 2 2
	1 2 1 1 2 1 2 2
]
```

Plot first few terms,
OEIS [A000002](https://oeis.org/A000002):

~~~spl svg=A
37.kolakoskiSequence
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-A.svg)

Plot first few terms,
offset to be `zero` and `one`:

~~~spl svg=B
(85.kolakoskiSequence - 1)
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-B.svg)

* * *

See also: golombsSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KolakoskiSequence.html),
_OEIS_
[1](https://oeis.org/A000002),
_W_
[1](https://en.wikipedia.org/wiki/Kolakoski_sequence)
