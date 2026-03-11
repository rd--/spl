# baumSweetSequence

- _baumSweetSequence(n)_

Answer the first _n_ terms of the Baum–Sweet sequence,
one if the binary expansion of _n_ contains no block of consecutive zeros of odd length,
else zero.

The Baum–Sweet sequence,
with initial term one,
considering zero to have on zero bit,
OEIS [A086747](https://oeis.org/A086747):

```
>>> 105.baumSweetSequence
[
	1 1 0 1 1 0 0 1 0 1
	0 0 1 0 0 1 1 0 0 1
	0 0 0 0 0 1 0 0 1 0
	0 1 0 1 0 0 1 0 0 1
	0 0 0 0 0 0 0 0 1 0
	0 1 0 0 0 0 0 1 0 0
	1 0 0 1 1 0 0 1 0 0
	0 0 0 1 0 0 1 0 0 1
	0 0 0 0 0 0 0 0 0 0
	0 0 0 0 0 0 0 1 0 0
	1 0 0 1 0
]
```

The sequence can be defined by a substitution system:

```
>>> [
>>> 	[0 0] -> [0 0 0 0],
>>> 	[0 1] -> [1 0 0 1],
>>> 	[1 0] -> [0 1 0 0],
>>> 	[1 1] -> [1 1 0 1]
>>> ].substitutionSystem([1 1], 5)
[
	1 1
	;
	1 1 0 1
	;
	1 1 0 1 1 0 0 1
	;
	1 1 0 1 1 0 0 1 0 1 0 0 1 0 0 1
	;
	1 1 0 1 1 0 0 1 0 1 0 0 1 0 0 1
	1 0 0 1 0 0 0 0 0 1 0 0 1 0 0 1
	;
	1 1 0 1 1 0 0 1 0 1 0 0 1 0 0 1
	1 0 0 1 0 0 0 0 0 1 0 0 1 0 0 1
	0 1 0 0 1 0 0 1 0 0 0 0 0 0 0 0
	1 0 0 1 0 0 0 0 0 1 0 0 1 0 0 1
]
```

Recurrence plot of sequence:

~~~spl png=A
105.baumSweetSequence
.recurrenceMatrix(1, 1, 'Manhattan')
.Bitmap
~~~

![](sw/spl/Help/Image/baumSweetSequence-A.png)

The Baum–Sweet sequence,
OEIS [A086747](https://oeis.org/A086747):

~~~spl svg=B
115.baumSweetSequence.discretePlot
~~~

![](sw/spl/Help/Image/baumSweetSequence-B.svg)

* * *

See also: integerDigits, regularPaperfoldingSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Baum-SweetSequence.html),
_OEIS_
[1](https://oeis.org/A086747),
_W_
[1](https://en.wikipedia.org/wiki/Baum%E2%80%93Sweet_sequence)
