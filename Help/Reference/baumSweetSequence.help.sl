# baumSweetSequence

- _baumSweetSequence(n)_

Answer the first _n_ terms of the Baum–Sweet sequence.

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

~~~spl svg=A
105.baumSweetSequence
.recurrenceMatrix(1, 1, 'Manhattan')
.matrixPlot
~~~

![](sw/spl/Help/Image/baumSweetSequence-A.svg)

* * *

See also: integerDigits, regularPaperfoldingSequence

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Baum-SweetSequence.html),
_OEIS_
[1](https://oeis.org/A086747),
_W_
[1](https://en.wikipedia.org/wiki/Baum%E2%80%93Sweet_sequence)
