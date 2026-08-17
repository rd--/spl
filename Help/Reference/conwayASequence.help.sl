# conwayASequence

- _conwayASequence(n)_

Answer the first _n_ terms of the the Conway _a_-sequence.

The recursion equation is _a(n)=a(a(n-1))+a(n-a(n-1))_.

Calculate first few terms of the Conway _a_-sequence,
OEIS [A004001](https://oeis.org/A004001):

```
>>> 23.conwayASequence
[
	 1  1  2  2  3  4  4  4  5  6
	 7  7  8  8  8  8  9 10 11 12
	12 13 14
]
```

Plot the Conway _a_-sequence,
OEIS [A004001](https://oeis.org/A004001):

~~~spl svg=A
100.conwayASequence.scatterPlot
~~~

![](Help/Image/conwayASequence-A.svg)

* * *

See also: hofstadterQSequence, mallowsSequence, pinnDSequence

Guides: Integer Sequence Functions
