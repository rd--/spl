# adaptToNumberAndApply

- _adaptToNumberAndApply(anObject, aNumber, aBlock:/2)_

Request that _anObject_ adapt itself to operating with the number _aNumber_ and then apply _aBlock_ with itself as the second parameter.

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
