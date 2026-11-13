# MemoizationTable

- _MemoizationTable(f/1, d)_

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
>>> let a = Map { :n |
>>> 	(n < 2L).if {
>>> 		n
>>> 	} {
>>> 		a[n - 1L] + a[n - 2L]
>>> 	}
>>> };
>>> a[38L .. 41L]
[39088169 63245986 102334155 165580141]

>>> 38:41.fibonacci
[39088169 63245986 102334155 165580141]
```

Narayana-Zidek-Capell numbers,
OEIS [A002083](https://oeis.org/A002083):

```
>>> let a = Map { :n |
>>> 	(n < 3L).if {
>>> 		1L
>>> 	} {
>>> 		(2L * a[n - 1L])
>>> 		-
>>> 		((n % 2L) * a[n // 2L])
>>> 	}
>>> };
>>> a[1L .. 14L]
[1 1 1 2 3 6 11 22 42 84 165 330 654 1308]
```

Number of Schroeder paths,
OEIS [A002212](https://oeis.org/A002212):

```
>>> let s = Map { :n |
>>> 	(n < 2L).if {
>>> 		1L
>>> 	} {
>>> 		let [i, j] = n - [1L 2L];
>>> 		let a = 3L * (2L * n - 1L) * s[i];
>>> 		let b = 5L * j * s[j];
>>> 		(a - b) // (n + 1L)
>>> 	}
>>> };
>>> s[0L .. 13L]
[
	1 1 3 10 36 137 543 2219 9285 39587
	171369 751236 3328218 14878455
]
```

Redundant binary representation of _n_,
OEIS [A089591](https://oeis.org/A089591):

```
>>> let a = Map { :n |
>>> 	(n <= 1L).if {
>>> 		n
>>> 	} {
>>> 		let m = n // 2L;
>>> 		(n % 2L = 1L).if {
>>> 			10L * a[m] + 1L
>>> 		} {
>>> 			10L * (a[m - 1L] + 1L)
>>> 		}
>>> 	}
>>> };
>>> a[0L .. 17L]
[
	0 1 10 11 20 101 110 111 120 201 210
	1011 1020 1101 1110 1111 1120 1201
]
```

* * *

See also: Dictionary, Map, memoize

Guides: Collection Functions
