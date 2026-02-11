# isLucasProbablePrime

- _isLucasProbablePrime(n)_

Answer `true` if _n_ is a _Lucas_-probable prime.

Find false positives up to _k_,
OEIS [A217120](https://oeis.org/A217120):

```
>>> let k = 25000;
>>> 3:k:2.select { :n |
>>> 	n.isLucasProbablePrime & {
>>> 		n.isPrime.not
>>> 	}
>>> }
[
	  323   377  1159  1829  3827
	 5459  5777  9071  9179 10877
	11419 11663 13919 14839 16109
	16211 18407 18971 19043 22499
	23407 24569
]
```

Find false negatives up to _k_:

```
>>> let k = 25000;
>>> 3:k:2.select { :n |
>>> 	n.isLucasProbablePrime.not & {
>>> 		n.isPrime
>>> 	}
>>> }
[]
```

* * *

See also: isPrime, isStrongProbablePrime

Guides: Prime Number Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Lucas_pseudoprime)
