# hofstadterQSequence

- _hofstadterQSequence(n)_

Answer the first _n_ terms of the Hofstadter Q-sequence.

Calculate first few terms:

```
>>> 23.hofstadterQSequence
[
	1 1 2 3 3 4 5 5 6 6
	6 8 8 8 10 9 10 11 11 12
	12 12 12
]
```

Scatter plot of first few terms:

~~~spl svg=A
200.hofstadterQSequence.scatterPlot
~~~

![](sw/spl/Help/Image/hofstadterQSequence-A.svg)

Scatter plot of the terms in _(6000, 6200)_:

~~~spl svg=B
6200.hofstadterQSequence
.last(200)
.scatterPlot
~~~

![](sw/spl/Help/Image/hofstadterQSequence-B.svg)

Plot the obscure sequence OEIS [A086267](https://oeis.org/A086267):

~~~spl svg=C
let k = 106;
let h = (k + 2).hofstadterQSequence;
h.partition(3, 1).collect { :i |
	let [a, b, c] = i;
	let r = (a - (2 * b) + c - 4) / a;
	3 + (a % 6) + r.floor
}.scatterPlot
~~~

![](sw/spl/Help/Image/hofstadterQSequence-C.svg)

* * *

See also: fibonacciSequence, mallowsSequence, memoize

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A005185)

Further Reading: Conolly 1989
