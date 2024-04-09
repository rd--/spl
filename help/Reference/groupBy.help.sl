# groupBy

- _groupBy(aCollection, keyBlock:/1)_

Like in Sql answer the contents of _aCollection_ split into groups for which _keyBlock_ returns the same results.
The answer is a `Map` keyed by the answers of _keyBlock_.

```
>>> [1 .. 5].groupBy(isEven:/1).keys
[false, true]

>>> [1 .. 5].groupBy(isEven:/1)[true]
[2, 4]
```

* * *

See also: reject, select

Categories: Enumerating
