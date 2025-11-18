# primeDivisors

- _primeDivisors(n)_

Answer the prime divisors of the integer _n_.

```
>>> 2434500.primeDivisors
[2 3 5 541]

>>> 2434500 / 541
4500

>>> (2 ^ 2) * (3 ^ 2) * (5 ^ 3)
4500

>>> 2434500.factorInteger
[2 2; 3 2; 5 3; 541 1]

>>> 2434500.primeFactors
[2 2 3 3 5 5 5 541]

>>> 2:10.collect(primeDivisors:/1)
[2; 3; 2; 5; 2 3; 7; 2; 3; 2 5]
```

Integers where the prime divisors includes only two and five,
OEIS [A003592](https://oeis.org/A003592):

```
>>> 2:100.select { :n |
>>> 	let d = n.primeDivisors;
>>> 	d.includesOnly([2 5])
>>> }
[
	    2  4  5   8
	10 16 20 25  32
	40 50 64 80 100
]
```

* * *

See also: primeExponents, primeFactors

Guides: Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A003592)

Categories: Math
