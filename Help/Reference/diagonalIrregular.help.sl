# diagonalIrregular

- _diagonalIrregular(m)_

Answer the diagonal of the, possibly irregular, matrix _m_.

```
>>> [1; 1 2; 1 2 3; 1 2 3 4]
>>> .diagonalIrregular
[1 2 3 4]
```

The denominators of the subdiagonal in the difference table of the Bernoulli numbers,
OEIS [A190339](https://oeis.org/A190339):

```
>>> let k = 13L;
>>> let b = (0L .. 2L * k - 1L).collect { :n |
>>> 	let m = n.bernoulliNumber;
>>> 	(n = 1L).if { 0L - m } { m }
>>> };
>>> 1L:k.collect { :n |
>>> 	b.differences(n)
>>> }.diagonalIrregular
>>> .denominator
[
	2 6 15 105 105
	231 15015 2145 36465 969969
	4849845 10140585 10140585
]
```

* * *

See also: diagonal

Guides: Matrix Functions
