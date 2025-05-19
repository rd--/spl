# atAllMissing

- _atAllMissing(c, i)_

Answer the value in the collection _c_ of each index in _i_,
or `Missing` if the index is invalid.

```
>>> [1 3 5 7 9]
>>> .atAllMissing([-1 5 9])
[
	Missing('NotAvailable', -1),
	9,
	Missing('NotAvailable', 9)
]
```

* * *

See also: atAll, atMissing, Missing
