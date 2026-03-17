# hofstadterQSequence

- _hofstadterQSequence(n)_

Answer the first _n_ terms of the Hofstadter Q-sequence.

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

The obscure sequence
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

* * *

See also: fibonacciSequence, mallowsSequence, memoize

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A005185)

Further Reading: Conolly 1989
