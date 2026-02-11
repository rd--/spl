# isStrongProbablePrime

- _isStrongProbablePrime(n, b=2)_

Answer `true` if _n_ is a strong probable prime.

Find false positives up to _k_:

```
>>> let k = 25000;
>>> 3:k:2.select { :n |
>>> 	n.isStrongProbablePrime & {
>>> 		n.isPrime.not
>>> 	}
>>> }
[2047 3277 4033 4681 8321 15841]
```

Find false negatives up to _k_:

```
>>> let k = 25000;
>>> 3:k:2.select { :n |
>>> 	n.isStrongProbablePrime.not & {
>>> 		n.isPrime
>>> 	}
>>> }
[]
```

Time strong probable predicate:

~~~spl timing
let k = 25000;
{
	3:k:2.select(
		isStrongProbablePrime:/1
	).size
}.timing
~~~

Time predicate:

~~~spl timing
let k = 25000;
{
	3:k:2.select(
		isPrime:/1
	).size
}.timing
~~~

* * *

See also: isPrime, millerRabinPrimalityTest

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ProbablePrime.html)
[2](https://mathworld.wolfram.com/PrimalityTest.html),
_W_
[1](https://en.wikipedia.org/wiki/Probable_prime)
