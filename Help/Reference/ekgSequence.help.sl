# ekgSequence

- _ekgSequence(n)_

Answer the first _n_ terms of the Ekg sequence.

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

Step plot of first few terms:

~~~spl svg=A
37.ekgSequence.stepPlot
~~~

![](sw/spl/Help/Image/ekgSequence-A.svg)

Scatter plot of first few terms:

~~~spl svg=B
125.ekgSequence.scatterPlot
~~~

![](sw/spl/Help/Image/ekgSequence-B.svg)

* * *

See also: gcd, yellowstonePermutation

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EKGSequence.html),
_OEIS_
[1](https://oeis.org/A064413)
[2](https://oeis.org/A064664)
