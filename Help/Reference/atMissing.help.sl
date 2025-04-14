# atMissing

- _atMissing(c, i)_

Answer the value in the collection _c_ at index _i_,
or `Missing` if the index is invalid.

```
>>> [1 3 5 7 9].atMissing(3)
5

>>> [1 3 5 7 9].atMissing(11)
Missing('NotAvailable', 11)
```

* * *

See also: at, atNil, Missing
