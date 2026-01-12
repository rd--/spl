# atOrMissingAll

- _atOrMissingAll(c, i)_

Answer the value in the collection _c_ of each index in _i_,
or `Missing` if the index is invalid.

```
>>> [1 3 5 7 9]
>>> .atOrMissingAll([-1 5 9])
[
	Missing('NotAvailable', -1),
	9,
	Missing('NotAvailable', 9)
]
```

* * *

See also: atAll, atOrMissing, atOrNilAll, Missing

Guides: Indexing Functions
