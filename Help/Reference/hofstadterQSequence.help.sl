# hofstadterQSequence

- _hofstadterQSequence(n)_

Answer the first _n_ terms of the Hofstadter Q-sequence.

The recursion equation is _Q(n)=Q(n-Q(n-1))+Q(n-Q(n-2))_.

Calculate first few terms of the Hofstadter Q-sequence,
OEIS [A005185](https://oeis.org/A005185):

```
>>> 23.hofstadterQSequence
[
	1 1 2 3 3 4 5 5 6 6
	6 8 8 8 10 9 10 11 11 12
	12 12 12
]
```

The Hofstadter Q-sequence,
scatter plot of first few terms,
OEIS [A005185](https://oeis.org/A005185):

~~~spl svg=A oeis=A005185
200.hofstadterQSequence.scatterPlot
~~~

![](Help/Image/hofstadterQSequence-A.svg)

The Hofstadter Q-sequence,
scatter plot of the terms in _(6000, 6200)_,
OEIS [A005185](https://oeis.org/A005185):

~~~spl svg=B oeis=A005185
6200.hofstadterQSequence
.last(200)
.scatterPlot
~~~

![](Help/Image/hofstadterQSequence-B.svg)

An obscure sequence derived from the Hofstadter Q-sequence,
OEIS [A086267](https://oeis.org/A086267):

~~~spl svg=C oeis=A086267
let k = 106;
let h = (k + 2).hofstadterQSequence;
h.partition(3, 1).collect { :i |
	let [a, b, c] = i;
	let r = (a - (2 * b) + c - 4) / a;
	3 + (a % 6) + r.floor
}.scatterPlot
~~~

![](Help/Image/hofstadterQSequence-C.svg)

Plot a longer segment of the sequence:

~~~spl png=D oeis=A005185
2500.hofstadterQSequence.denseScatterPlot
~~~

![](Help/Image/hofstadterQSequence-D.png)

Plot _2Q(n)-n_:

~~~spl png=E
let q = 2500.hofstadterQSequence;
let n = 1:2500;
(2 * q - n).denseScatterPlot
~~~

![](Help/Image/hofstadterQSequence-E.png)

* * *

See also: fibonacciSequence, mallowsSequence, memoize, pinnDSequence

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A005185)

Further Reading: Conolly 1989
