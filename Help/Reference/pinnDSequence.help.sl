# pinnDSequence

- _pinnDSequence(n)_

Answer the first _n_ terms of the the Pinn D-sequence,
a variation of the Hofstadter Q-sequence.

The recursion equation is _D(n)=D(D(n-1))+D(n-1-D(n-2))_.

Calculate first few terms of the Pinn D-sequence,
OEIS [A055748](https://oeis.org/A055748):

```
>>> 23.pinnDSequence
[
	 1  1  2  2  2  3  4  4  4  4
	 5  6  7  8  8  8  8  8  8  9
	10 10 10
]
```

Scatter plot of first few terms of the Pinn D-sequence:

~~~spl png=A oeis=A055748
2500.pinnDSequence.denseScatterPlot
~~~

![](Help/Image/pinnDSequence-A.png)

Plot _2D(n)-n_:

~~~spl png=B
let d = 2500.pinnDSequence;
let n = 1:2500;
(2 * d - n).denseScatterPlot
~~~

![](Help/Image/pinnDSequence-B.png)

Plot _2a(n)-n_,
where _a_ is the closely related Conway _a_-sequence,
OEIS [A004001](https://oeis.org/A004001):

~~~spl png=C
let a = 2500.conwayASequence;
let n = 1:2500;
(2 * a - n).denseScatterPlot
~~~

![](Help/Image/pinnDSequence-C.png)

* * *

See also: conwayASequence, hofstadterQSequence

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A055748)

Further Reading: Pinn 2000
