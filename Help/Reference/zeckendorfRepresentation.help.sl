# zeckendorfRepresentation

- _zeckendorfRepresentation(anInteger)_

Answer the Zeckendorf representation of positive _anInteger_.
Zeckendorf’s theorem states that every positive integer can be represented as the sum of distinct Fibonacci numbers,
using no two consecutive numbers,
and such a representation is unique.
The Zeckendorf representation gives this unique set of indices as a binary string.

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
		1 0 1 0 0 1 0 0 0 1
		0 1 0 0 0 1 0 0 1 0
		1 0 1 0 0 0 1 0 1 0
		1 0 0 0 1 0 0 0 0 0
		1 0 1
	],
	43,
	 987654321
)
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

* * *

See also: fibonacci

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ZeckendorfRepresentation.html),
_OEIS_
[1](https://oeis.org/A014417),
_W_
[1](https://en.wikipedia.org/wiki/Zeckendorf%27s_theorem)

Categories: Converting
