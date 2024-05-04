# zeckendorfRepresentation

- _zeckendorfRepresentation(anInteger)_

Answer the Zeckendorf representation of positive _anInteger_.
Zeckendorf’s theorem states that every positive integer can be represented as the sum of distinct Fibonacci numbers,
using no two consecutive numbers,
and such a representation is unique.
The Zeckendorf gives this unique set of indices as a binary string.

```
>>> 0:20.collect(zeckendorfRepresentation:/1)
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

* * *

See also: fibonacci

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ZeckendorfRepresentation.html),
_OEIS_
[1](https://oeis.org/A014417)
