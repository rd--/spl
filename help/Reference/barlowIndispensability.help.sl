# barlowIndispensability

- _barlowIndispensability(p, n)_

Indispensability function for sequence of prime numbers _p_ at index _n_.
_n_ is an integer in the range _(1, p.product)_ and
the answer is an integer in the range _(0, p.product - 1)_.
This is Barlow’s lower case psi (ψ) function.


The answer at index `one` is always _p.product - 1_.
The answer at index two is always `zero`.
The sequence of all indispensability values a permutation of the integers from `zero` to `one` less than _p.product_:

```
>>> let f = { :p |
>>> 	(1 .. p.product).collect { :each |
>>>		p.barlowIndispensability(each)
>>> 	}
>>> };
>>> [
>>> 	2; 3; 2 2; 5; 3 2; 2 3;
>>> 	3 2 2; 2 3 2; 2 2 3; 3 5
>>> ].collect(f:/1)
[
	1 0;
	2 0 1;
	3 0 2 1;
	4 0 3 1 2;
	5 0 3 1 4 2;
	5 0 2 4 1 3;
	11 0 6 3 9 1 7 4 10 2 8 5;
	11 0 6 2 8 4 10 1 7 3 9 5;
	11 0 4 8 2 6 10 1 5 9 3 7;
	14 0 9 3 6 12 1 10 4 7 13 2 11 5 8
]
```

* * *

See also: barlowBasicIndispensability, barlowIndispensabilities

Further Reading: Barlow 1987
