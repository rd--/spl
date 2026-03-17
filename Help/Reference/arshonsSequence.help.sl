# arshonsSequence

- _arshonsSequence(n)_

Answer the _n_-th iteration of Arshon’s sequence,
defined by iterating two alternating morphisms.

The first few iterations of Arshon’s sequence,
OEIS [A099054](https://oeis.org/A099054):

```
>>> 1:3.collect(arshonsSequence:/1)
[
	1;
	1 2 3;
	1 2 3 1 3 2 3 1 2
]
```

The sixth iteration of Arshon’s sequence,
OEIS [A099054](https://oeis.org/A099054):

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

Length of sucessive iterations,
OEIS [A000244](https://oeis.org/A000244):

```
>>> 1:7.collect { :n |
>>> 	n.arshonsSequence.size
>>> }
[1 3 9 27 81 243 729]

>>> 3 ^ 0:6
[1 3 9 27 81 243 729]
```

The fourth iteration of Arshon’s sequence starting with two,
OEIS [A100336](https://oeis.org/A100336):

```
>>> 4.arshonsSequence([2])
[
	2 3 1 2 1 3 1 2 3 1 3 2 1 2 3 2 1 3 1 2
	3 1 3 2 3 1 2
]
```

The fourth iteration of Arshon’s sequence starting with three,
OEIS [A100337](https://oeis.org/A100337):

```
>>> 4.arshonsSequence([3])
[
	3 1 2 3 2 1 2 3 1 2 1 3 2 3 1 3 2 1 2 3
	1 2 1 3 1 2 3
]
```

Step plot of fifth iteration of Arshon’s sequence,
OEIS [A099054](https://oeis.org/A099054):

~~~spl svg=A oeis=A099054
5.arshonsSequence
.stepPlot
~~~

![](Help/Image/arshonsSequence-A.svg)

Sixth iteration of Arshon’s sequence,
offset to to over alphabet _-1,0,1_,
OEIS [A099054](https://oeis.org/A099054):

~~~spl svg=B oeis=A099054 variant
(6.arshonsSequence - 2)
.discretePlot
~~~

![](Help/Image/arshonsSequence-B.svg)

Step plot of fifth iteration of Arshon’s sequence starting with two,
OEIS [A100336](https://oeis.org/A100336):

~~~spl svg=C oeis=A100336
5.arshonsSequence([2])
.stepPlot
~~~

![](Help/Image/arshonsSequence-C.svg)

Step plot of fifth iteration of Arshon’s sequence starting with three,
OEIS [A100337](https://oeis.org/A100337):

~~~spl svg=D oeis=A100337
5.arshonsSequence([3])
.stepPlot
~~~

![](Help/Image/arshonsSequence-D.svg)

* * *

See also: iterate

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A099054)

Further Reading: Arshon 1935
