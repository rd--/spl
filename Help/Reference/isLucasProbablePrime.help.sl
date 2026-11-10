# isLucasProbablePrime

- _isLucasProbablePrime(n)_

Answer `true` if _n_ is a _Lucas_-probable prime.

Find false positives and false negatives up to _k_,
OEIS [A217120](https://oeis.org/A217120):

```
>>> let k = 2000;
>>> let a = [];
>>> let b = [];
>>> 3:k:2.do { :n |
>>> 	let p = n.isLucasProbablePrime;
>>> 	let q = n.isPrime;
>>> 	(p && q.not).ifTrue { a.add!(n) };
>>> 	(p.not && q).ifTrue { b.add!(n) }
>>> };
>>> (a, b)
([323 377 1159 1829], [])
```

Check Lucas probable primes false positives:

```
>>> let a = [
>>> 	  323   377  1159  1829  3827
>>> 	 5459  5777  9071  9179 10877
>>> 	11419 11663 13919 14839 16109
>>> 	16211 18407 18971 19043 22499
>>> 	23407 24569
>>> ];
>>> let b = a.allTrue(isLucasProbablePrime/1);
>>> let c = a.allFalse(isPrime/1);
>>> (b, c)
(true, true)
```

* * *

See also: isPrime, isStrongProbablePrime

Guides: Prime Number Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Lucas_pseudoprime)
