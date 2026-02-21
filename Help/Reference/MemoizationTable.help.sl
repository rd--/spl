# MemoizationTable

- _MemoizationTable(f:/1, d)_

`MemoizationTable` is a `Type` implementing a memoization table.
Entries are specified by the block _f_,
calculated values are stored at the dictionary _d_.

The `Block` methods `Dictionary` and `Map` construct memoization tables.

The table implements `at`, `atAll` and `atAllPath`,
answering either the cached answer to a previous request,
or caching and then answering the result of a new calculation.

Memoized Fibonacci numbers,
OEIS [A000045](https://oeis.org/A000045):

```
>>> let a = Dictionary { :n |
>>> 	(n < 2).if {
>>> 		n
>>> 	} {
>>> 		a[n - 1] + a[n - 2]
>>> 	}
>>> };
>>> a[38:41]
[39088169 63245986 102334155 165580141]

>>> 38:41.fibonacci
[39088169 63245986 102334155 165580141]
```

Narayana-Zidek-Capell numbers,
OEIS [A002083](https://oeis.org/A002083):

```
>>> let a = Map { :n |
>>> 	(n < 3).if {
>>> 		1
>>> 	} {
>>> 		(2 * a[n - 1])
>>> 		-
>>> 		((n % 2) * a[n // 2])
>>> 	}
>>> };
>>> a[1:14]
[1 1 1 2 3 6 11 22 42 84 165 330 654 1308]
```

Number of Schroeder paths,
OEIS [A002212](https://oeis.org/A002212):

```
>>> let s = Map { :n |
>>> 	(n < 2).if {
>>> 		1
>>> 	} {
>>> 		let [i, j] = n - [1 2];
>>> 		let a = 3 * (2 * n - 1) * s[i];
>>> 		let b = 5 * j * s[j];
>>> 		(a - b) / (n + 1)
>>> 	}
>>> };
>>> s[0:13]
[
	1 1 3 10 36 137 543 2219 9285 39587
	171369 751236 3328218 14878455
]
```

Redundant binary representation of _n_,
OEIS [A089591](https://oeis.org/A089591):

```
>>> let a = Map { :n |
>>> 	(n <= 1).if {
>>> 		n
>>> 	} {
>>> 		let m = n // 2;
>>> 		(n % 2 = 1).if {
>>> 			10 * a[m] + 1
>>> 		} {
>>> 			10 * (a[m - 1] + 1)
>>> 		}
>>> 	}
>>> };
>>> a[0:17]
[
	0 1 10 11 20 101 110 111 120 201 210
	1011 1020 1101 1110 1111 1120 1201
]
```

* * *

See also: Dictionary, Map, memoize
