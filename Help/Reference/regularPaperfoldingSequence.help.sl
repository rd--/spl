# regularPaperfoldingSequence

- _regularPaperfoldingSequence(n)_

Answer the first _n_ terms of the regular paperfolding sequence.

First few terms:

```
>>> 32.regularPaperfoldingSequence
[
	1 1 0 1 1 0 0 1 1 1
	0 0 1 0 0 1 1 1 0 1
	1 0 0 0 1 1 0 0 1 0
	0 1
]
```

Relation to Kronecker symbol:

```
>>> 1:32.collect { :n |
>>> 	-1.kroneckerSymbol(n)
>>> } / 2 + 0.5
[
	1 1 0 1 1 0 0 1 1 1
	0 0 1 0 0 1 1 1 0 1
	1 0 0 0 1 1 0 0 1 0
	0 1
]
```

Drawing:

~~~spl svg=A
let i = 300.regularPaperfoldingSequence;
((i - 0.5) * 1.pi).anglePath.Line
~~~

![](sw/spl/Help/Image/regularPaperfoldingSequence-A.svg)

Recurrence plot:

~~~spl png=A
100.regularPaperfoldingSequence
.recurrenceMatrix(1, 1, 'Manhattan', 0.1)
.Bitmap
~~~

![](sw/spl/Help/Image/regularPaperfoldingSequence-B.png)

* * *

See also: kroneckerSymbol

Guides: Curve Functions, Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DragonCurve.html),
_OEIS_
[1](https://oeis.org/A014577)
[2](https://oeis.org/A034947)
[3](https://oeis.org/A343173),
_W_
[1](https://en.wikipedia.org/wiki/Regular_paperfolding_sequence)
