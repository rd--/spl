# ehrenfeuchtMycielskiSequence

- _ehrenfeuchtMycielskiSequence(n)_

Answer the first _n_ terms of the Ehrenfeucht-Mycielski sequence.

First few terms,
OEIS [A038219](https://oeis.org/A038219):

```
>>> 105.ehrenfeuchtMycielskiSequence
[
	0 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1 0 0 0 0
	1 1 1 1 0 1 1 0 0 1 0 1 0 0 1 0 0 1 1 1
	0 1 0 0 0 1 1 0 0 0 0 0 1 0 1 1 0 1 1 1
	1 1 0 0 1 1 0 0 1 1 1 1 1 1 0 1 0 1 0 1
	1 0 0 0 1 1 1 0 0 1 0 0 0 1 0 1 0 1 0 0
	0 0 0 0 1
]
```

Plot first few terms:

~~~spl svg=A
105.ehrenfeuchtMycielskiSequence
.discretePlot
~~~

![](sw/spl/Help/Image/ehrenfeuchtMycielskiSequence-A.svg)

Plot run lengths,
OEIS [A201881](https://oeis.org/A201881):

~~~spl svg=B
105.ehrenfeuchtMycielskiSequence
.split(=)
.collect(size:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/ehrenfeuchtMycielskiSequence-B.svg)

Indices of zeroes,
OEIS [A253060](https://oeis.org/A253060):

~~~spl svg=C
105.ehrenfeuchtMycielskiSequence
.indicesOf(0)
.discretePlot
~~~

![](sw/spl/Help/Image/ehrenfeuchtMycielskiSequence-C.svg)

Indices of the first occurrences of the _n_-th binary vector,
OEIS [A308173](https://oeis.org/A308173):

~~~spl svg=D
let x = 500.ehrenfeuchtMycielskiSequence;
(1 .. 7).collect { :i |
	let j = 2 ^ i;
	(0 .. j - 1).collect { :k |
		x.indexOfSubstring(
			k.integerDigits(2, i)
		)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/ehrenfeuchtMycielskiSequence-D.svg)

* * *

See also: boole, suffixes

Guides: Integer Sequence Functions, Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A038219)
[2](https://oeis.org/A201881)
[3](https://oeis.org/A253060)
[4](https://oeis.org/A308173),
_W_
[1](https://en.wikipedia.org/wiki/Ehrenfeucht%E2%80%93Mycielski_sequence)
