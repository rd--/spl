# ekgSequence

- _ekgSequence(n, i=[1 2])_

Answer the first _n_ terms of the Ekg sequence,
initially _i_.

First few terms,
OEIS [A064413](https://oeis.org/A064413):

```
>>> 73.ekgSequence
[
	 1  2  4  6  3  9 12   8 10  5
	15 18 14  7 21 24 16  20 22 11
	33 27 30 25 35 28 26  13 39 36
	32 34 17 51 42 38 19  57 45 40
	44 46 23 69 48 50 52  54 56 49
	63 60 55 65 70 58 29  87 66 62
	31 93 72 64 68 74 37 111 75 78
	76 80 82
]
```

First few terms initially _1,2,3_,
OEIS [A169837](https://oeis.org/A064413),
the sequence merges with the _1,2_ sequence at _n=45_,
as told by
OEIS [A119415](https://oeis.org/A119415):

```
>>> 73.ekgSequence([1 2 3])
[
	 1  2  3  6  4  8 10   5 15  9
	12 14  7 21 18 16 20  22 11 33
	24 26 13 39 27 30 25  35 28 32
	34 17 51 36 38 19 57  42 40 44
	46 23 69 45 48 50 52  54 56 49
	63 60 55 65 70 58 29  87 66 62
	31 93 72 64 68 74 37 111 75 78
	76 80 82
]
```

Record values of Ekg sequence,
OEIS [A064424](https://oeis.org/A064424):

```
>>> 85.ekgSequence.recordValues
[
	  1   2  4    6   9
	 12  15  18  21  24
	 33  35  39  51  57
	 69  70  87  93 111
	123 129
]
```

Step plot of first few terms,
OEIS [A064413](https://oeis.org/A064413):

~~~spl svg=A
37.ekgSequence.stepPlot
~~~

![](sw/spl/Help/Image/ekgSequence-A.svg)

Scatter plot of first few terms,
OEIS [A064413](https://oeis.org/A064413):

~~~spl svg=B
125.ekgSequence.scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-B.svg)

Plot `gcd` of consecutive terms,
OEIS [A073734](https://oeis.org/A073734):

~~~spl svg=C
85.ekgSequence
.adjacentPairsCollect(gcd:/2)
.discretePlot
~~~

![](sw/spl/Help/Image/ekgSequence-C.svg)

Regard the Ekg sequence as giving a permutation of the positive integers,
calculate the inverse permutation,
OEIS [A064664](https://oeis.org/A064664),
or equivalently but for offset the term at which _n_ appears,
OEIS [A064421](https://oeis.org/A064421):

~~~spl svg=D
let e = 500.ekgSequence;
let u = 1:Infinity;
let k = e.minimumExcludedValue(u);
e.ordering.take(k).scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-D.svg)

Sequence starting at three instead of two,
OEIS [A169837](https://oeis.org/A169837):

~~~spl svg=E
85.ekgSequence([3]).scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-E.svg)

Sequence starting at five instead of two,
OEIS [A169837](https://oeis.org/A169837):

~~~spl svg=E
85.ekgSequence([3]).scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-E.svg)

The largest prime factor of the _n_-th term of EKG-sequence,
OEIS [A304733](https://oeis.org/A304733):

~~~spl svg=F
115.ekgSequence
.greatestPrimeFactor
.discretePlot
~~~

![](sw/spl/Help/Image/ekgSequence-F.svg)

* * *

See also: gcd, leastExcludedSequence, yellowstonePermutation

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EKGSequence.html),
_OEIS_
[1](https://oeis.org/A064413)
[2](https://oeis.org/A064664)
