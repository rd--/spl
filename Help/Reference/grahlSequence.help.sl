# grahlSequence

- _grahlSequence(n)_

Answer the first _n_ terms of the "forest fire" sequence,
the least sequence such that no three equally spaced terms form an arithmetic progression.

First few terms,
OEIS [A229037](https://oeis.org/A229037):

```
>>> 81.grahlSequence
[
	 1  1  2  1  1  2  2  4  4  1
	 1  2  1  1  2  2  4  4  2  4
	 4  5  5  8  5  5  9  1  1  2
	 1  1  2  2  4  4  1  1  2  1
	 1  2  2  4  4  2  4  4  5  5
	 8  5  5  9  9  4  4  5  5 10
	 5  5 10  2 10 13 11 10  8 11
	13 10 12 10 10 12 10 11 14 20
	13
]
```

Show there are no three term arithmetic progressions:

```
>>> 100.grahlSequence
>>> .detectEquispacedTriple { :a :b :c |
>>> 	(2 * b) = (a + c)
>>> }
nil
```

Plot first few terms:

~~~
250.grahlSequence.scatterPlot
~~~

![](sw/spl/Help/Image/grahlSequence-A.svg)

* * *

See also: threeTermArithmeticProgression, stanleySequence

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A229037)
