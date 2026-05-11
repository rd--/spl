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
>>> let k = 13;
>>> let b = (0 .. 2 * k - 1).collect { :n |
>>> 	let m = n.bernoulliNumber;
>>> 	(n = 1).if { 0 - m } { m }
>>> };
>>> 1:k.collect { :n |
>>> 	b.differences(n)
>>> }.diagonalIrregular.denominator
[
	2 6 15 105 105
	231 15015 2145 36465 969969
	4849845 10140585 10140585
]
```

* * *

See also: diagonal
