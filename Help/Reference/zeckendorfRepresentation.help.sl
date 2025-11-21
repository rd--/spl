# zeckendorfRepresentation

- _zeckendorfRepresentation(n)_

Answer the Zeckendorf representation of the positive integer _n_.
Zeckendorf’s theorem states that every positive integer can be represented as the sum of distinct Fibonacci numbers,
using no two consecutive numbers,
and that such a representation is unique.
The Zeckendorf representation gives this unique set of indices as a binary string.

First few terms,
OEIS [A014417](https://oeis.org/A014417):

```
>>> 0:20.collect(
>>> 	zeckendorfRepresentation:/1
>>> )
[
	          0;
	          1;
	        1 0;
	      1 0 0;
	      1 0 1;
	    1 0 0 0;
	    1 0 0 1;
	    1 0 1 0;
	  1 0 0 0 0;
	  1 0 0 0 1;
	  1 0 0 1 0;
	  1 0 1 0 0;
	  1 0 1 0 1;
	1 0 0 0 0 0;
	1 0 0 0 0 1;
	1 0 0 0 1 0;
	1 0 0 1 0 0;
	1 0 0 1 0 1;
	1 0 1 0 0 0;
	1 0 1 0 0 1;
	1 0 1 0 1 0
]
```

Verify the answers shown above:

```
>>> 0:20.collect { :n |
>>> 	let i = n.zeckendorfRepresentation;
>>> 	let k = i.size;
>>> 	let q = (2 .. k + 1).fibonacci;
>>> 	(q * i.reverse).sum
>>> }
[0 .. 20]
```

Of a not very small integer:

```
>>> let n = 987654321;
>>> let i = n.zeckendorfRepresentation;
>>> let k = i.size;
>>> let q = (2 .. k + 1).fibonacci;
>>> (i, i.size, (q * i.reverse).sum)
(
	[
		1 0 1 0 0 0 0 0 1 0
		0 0 1 0 1 0 1 0 0 0
		1 0 1 0 1 0 0 1 0 0
		0 1 0 1 0 0 0 1 0 0
		1 0 1
	],
	43,
	987654321
)
```

Number of terms in the Zeckendorf representation of _n_,
OEIS [A007895](https://oeis.org/A007895):

```
>>> 0:104.collect { :n |
>>> 	n.zeckendorfRepresentation
>>> 	.occurrencesOf(1)
>>> }
[
	0 1 1 1 2 1 2 2 1 2 2 2 3 1 2 2 2 3 2 3
	3 1 2 2 2 3 2 3 3 2 3 3 3 4 1 2 2 2 3 2
	3 3 2 3 3 3 4 2 3 3 3 4 3 4 4 1 2 2 2 3
	2 3 3 2 3 3 3 4 2 3 3 3 4 3 4 4 2 3 3 3
	4 3 4 4 3 4 4 4 5 1 2 2 2 3 2 3 3 2 3 3
	3 4 2 3 3
]
```

Discrete plot of a representation with 115 places:

~~~spl svg=A
9E23.zeckendorfRepresentation
.discretePlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-A.svg)

Counts of above plot,
indicating the proportions of zeros and ones:

```
>>> 9E23.zeckendorfRepresentation
>>> .counts
[0 -> 85, 1 -> 30]
```

Plot first few terms of
OEIS [A007895](https://oeis.org/A007895):

~~~spl svg=B
0:125.collect { :n |
	n.zeckendorfRepresentation
	.occurrencesOf(1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/zeckendorfRepresentation-B.svg)

* * *

See also: fibonacci

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ZeckendorfRepresentation.html),
_OEIS_
[1](https://oeis.org/A014417)
[2](https://oeis.org/A007895),
_W_
[1](https://en.wikipedia.org/wiki/Zeckendorf%27s_theorem)

Categories: Converting
