# arshonsSequence

- _arshonsSequence(n)_

Answer the _n_-th iteration of Arshon’s sequence,
defined by iterating two alternating morphisms.

The first few iterations:

```
>>> 1:3.collect(arshonsSequence:/1)
[
	1;
	1 2 3;
	1 2 3 1 3 2 3 1 2
]
```

The sixth iteration:

```
>>> 6.arshonsSequence
[
	1 2 3 1 3 2 3 1 2 3 2 1 3 1 2 1 3 2 3 1
	2 3 2 1 2 3 1 2 1 3 2 3 1 3 2 1 3 1 2 3
	2 1 2 3 1 3 2 1 3 1 2 1 3 2 3 1 2 3 2 1
	2 3 1 2 1 3 2 3 1 3 2 1 2 3 1 2 1 3 1 2
	3 1 3 2 1 2 3 2 1 3 2 3 1 2 1 3 1 2 3 2
	1 3 2 3 1 3 2 1 3 1 2 3 2 1 2 3 1 2 1 3
	2 3 1 3 2 1 2 3 1 2 1 3 1 2 3 2 1 3 2 3
	1 3 2 1 3 1 2 3 2 1 2 3 1 3 2 1 3 1 2 1
	3 2 3 1 2 3 2 1 2 3 1 2 1 3 2 3 1 3 2 1
	2 3 1 2 1 3 1 2 3 1 3 2 1 2 3 2 1 3 2 3
	1 2 1 3 1 2 3 2 1 3 2 3 1 3 2 1 2 3 1 2
	1 3 1 2 3 1 3 2 1 2 3 2 1 3 1 2 3 1 3 2
	3 1 2
]
```

Length of sucessive iterations:

```
>>> 1:7.collect { :n |
>>> 	n.arshonsSequence.size
>>> }
[1 3 9 27 81 243 729]

>>> 3 ^ 0:6
[1 3 9 27 81 243 729]
```

Step plot of fifth iteration:

~~~spl svg=A
5.arshonsSequence
.stepPlot
~~~

![](sw/spl/Help/Image/arshonsSequence-A.svg)

* * *

See also: iterate

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A099054)

Further Reading: Arshon 1935
