# adaptToCollectionAndApply

- _adaptToCollectionAndApply(anObject, aCollection, aBlock:/2)_

Request that _anObject_ adapt itself to operating with the collection _aCollection_,
and then apply _aBlock_ with itself as the second parameter.

At `SmallFloat`:

```
>>> 0.adaptToCollectionAndApply([1 2 3], -)
[1 2 3]
```

* * *

See also: adaptToNumberAndApply

Guides: AdaptTo Protocol

Categories: Converting
