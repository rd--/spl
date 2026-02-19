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

* * *

See also: Dictionary, Map, memoize
