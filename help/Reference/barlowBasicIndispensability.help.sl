# barlowBasicIndispensability

- _barlowBasicIndispensability(p, n)_

Basic indispensability function for prime number _p_ at index _n_.
_n_ is an integer in the range _(1, p)_ and
the answer is an integer in the range _(0, p - 1)_.
This is Barlow’s upper case Psi (Ψ) function.

The answer at index `one` is always _p - 1_.
The answer at index two is always `zero`.
For odd primes the answer at index _p_ is always _(p - 1) / 2_.
The sequence of all indispensability values for a prime number is a permutation of the integers from `zero` to `one` less than _p_:

```
>>> let f = { :k |
>>> 	1:k.collect { :each |
>>> 		k.barlowBasicIndispensability(each)
>>> 	}
>>> };
>>> [2 3 5 7 11 13 17 19 23].collect(f:/1)
[
	1 0;
	2 0 1;
	4 0 3 1 2;
	6 0 4 2 5 1 3;
	10 0 6 4 9 1 7 3 8 2 5;
	12 0 7 4 10 1 8 5 11 2 9 3 6;
	16 0 9 5 13 2 11 7 15 1 10 6 14 3 12 4 8;
	18 0 10 3 13 7 16 1 11 5 14 8 17 2 12 6 15 4 9;
	22 0 12 7 18 4 16 10 21 1 13 8 19 3 15 9 20 2 14 6 17 5 11
]
```

* * *

See also: barlowIndispensabilities, barlowIndispensability

Further Reading: Barlow 1987
