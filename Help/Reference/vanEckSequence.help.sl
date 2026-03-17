# vanEckSequence

- _vanEckSequence(n, i=[0 0])_

Answer the first _n_ terms of the van Eck sequence.

First few terms of the van Eck sequence,
OEIS [A181391](https://oeis.org/A181391):

```
>>> 97.vanEckSequence
[
	 0  0  1  0  2  0  2  2  1  6
	 0  5  0  2  6  5  4  0  5  3
	 0  3  2  9  0  4  9  3  6 14
	 0  6  3  5 15  0  5  3  5  2
	17  0  6 11  0  3  8  0  3  3
	 1 42  0  5 15 20  0  4 32  0
	 3 11 18  0  4  7  0  3  7  3
	 2 31  0  6 31  3  6  3  2  8
	33  0  9 56  0  3  8  7 19  0
	 5 37  0  3  8  8  1
]
```

Positions of zeroes in the van Eck sequence,
OEIS [A171865](https://oeis.org/A171865):

```
>>> 50.vanEckSequence.indicesOf(0)
[1 2 4 6 11 13 18 21 25 31 36 42 45 48]
```

Positions of ones in the van Eck sequence,
OEIS [A171951](https://oeis.org/A171951):

```
>>> 200.vanEckSequence.indicesOf(1)
[3 9 51 97 133 146 160 172 191]
```

First differences of positions of zeroes in the van Eck sequence,
OEIS [A171868](https://oeis.org/A171868):

```
>>> 50.vanEckSequence.indicesOf(0)
>>> .differences
[1 2 2 5 2 5 3 4 6 5 6 3 3]
```

Records positions in first differences of positions of zeroes in the van Eck sequence,
OEIS [A171887](https://oeis.org/A171887):

```
>>> 250.vanEckSequence.indicesOf(0)
>>> .differences.recordPositions
[1 2 4 9 20 50]
```

Records values in first differences of positions of zeroes in the van Eck sequence,
OEIS [A171888](https://oeis.org/A171888):

```
>>> 250.vanEckSequence.indicesOf(0)
>>> .differences.recordValues
[1 2 5 6 9 10]
```

The van Eck sequence,
starting with _1,0_,
OEIS [A171911](https://oeis.org/A171911):

```
>>> 22.vanEckSequence([1 0])
[1 0 0 1 3 0 3 2 0 3 3 1 8 0 5 0 2 9 0 3 9 3]
```

The van Eck sequence,
starting with _2,0_,
OEIS [A171912](https://oeis.org/A171912):

```
>>> 22.vanEckSequence([2 0])
[2 0 0 1 0 2 5 0 3 0 2 5 5 1 10 0 6 0 2 8 0 3]
```

The van Eck sequence,
log scale scatter plot,
OEIS [A181391](https://oeis.org/A181391):

~~~spl svg=A oeis=A181391
250.vanEckSequence
.log
.scatterPlot
~~~

![](Help/Image/vanEckSequence-A.svg)

The van Eck sequence,
discrete plot,
OEIS [A181391](https://oeis.org/A181391):

~~~spl svg=B oeis=A181391
65.vanEckSequence.discretePlot
~~~

![](Help/Image/vanEckSequence-B.svg)

The van Eck sequence,
starting with _1,0_,
discrete plot,
OEIS [A171911](https://oeis.org/A171911):

~~~spl svg=C oeis=A171911
85.vanEckSequence([1 0]).discretePlot
~~~

![](Help/Image/vanEckSequence-C.svg)

The van Eck sequence,
starting with _1,0_,
log scale scatter plot,
OEIS [A171911](https://oeis.org/A171911):

~~~spl svg=D oeis=A171911
250.vanEckSequence([1 0]).log.scatterPlot
~~~

![](Help/Image/vanEckSequence-D.svg)

The van Eck sequence,
starting with _2,0_,
discrete plot,
OEIS [A171912](https://oeis.org/A171912):

~~~spl svg=E oeis=A171912
85.vanEckSequence([2 0]).discretePlot
~~~

![](Help/Image/vanEckSequence-E.svg)

Positions of ones in the van Eck sequence,
OEIS [A171951](https://oeis.org/A171951):

~~~spl svg=F oeis=A171951
1200.vanEckSequence
.indicesOf(1)
.discretePlot
~~~

![](Help/Image/vanEckSequence-F.svg)

Positions of zeroes in the van Eck sequence,
OEIS [A171865](https://oeis.org/A171865):

~~~spl svg=G oeis=A171865
200.vanEckSequence
.indicesOf(0)
.discretePlot
~~~

![](Help/Image/vanEckSequence-G.svg)

First differences of positions of zeroes in the van Eck sequence,
OEIS [A171868](https://oeis.org/A171868):

~~~spl svg=H oeis=A171868
500.vanEckSequence
.indicesOf(0)
.differences
.scatterPlot
~~~

![](Help/Image/vanEckSequence-H.svg)

* * *

See also: findLast

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A181391)
