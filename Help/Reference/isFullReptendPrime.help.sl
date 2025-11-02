# isFullReptendPrime

- _isFullReptendPrime(n, b=10)_

Predicate to decide if _n_ is a full reptend prime number.

First few terms,
OEIS [A001913](https://oeis.org/A001913):

```
>>> 1:150.select(isFullReptendPrime:/1)
[
	  7  17  19  23  29
	 47  59  61  97 109
	113 131 149
]
```

First few terms where _b=2_,
OEIS [A001122](https://oeis.org/A001122):

```
>>> 1:250.select { :n |
>>> 	n.isFullReptendPrime(2)
>>> }
[
	  3   5  11  13  19
	 29  37  53  59  61
	 67  83 101 107 131
	139 149 163 173 179
	181 197 211 227
]
```

* * *

See also: isPrime, primitiveRootList

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FullReptendPrime.html),
_OEIS_
[1](https://oeis.org/A001913)
[2](https://oeis.org/A001122),
_W_
[1](https://en.wikipedia.org/wiki/Full_reptend_prime)
