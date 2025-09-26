# adaptToNumberAndApply

- _adaptToNumberAndApply(x, n, f:/2)_

Request that the object _x_ adapt itself to operating with the number _n_,
and then apply the binary block _f_ with itself as the second parameter.

At `List`:

```
>>> [1 2 3].adaptToNumberAndApply(0, -)
[-1 -2 -3]
```

At `Complex`:

```
>>> 1J1.adaptToNumberAndApply(2, ^)
1.5385J1.2780
```

* * *

See also: adaptToCollectionAndApply

Guides: AdaptTo Protocol

Categories: Converting
