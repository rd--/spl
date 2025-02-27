# adaptToCollectionAndApply

- _adaptToCollectionAndApply(anObject, aCollection, aBlock:/2)_

Request that _anObject_ adapt itself to operating with _aCollection_ elementwise,
and then apply _aBlock_ with itself as the second parameter.

At `SmallFloat`, adapting to `List`:

```
>>> 4.adaptToCollectionAndApply(
>>> 	[1 2 3],
>>> 	-
>>> )
[-3 -2 -1]
```

At `List`, adapting to `Range`:

```
>>> [4].adaptToCollectionAndApply(
>>> 	1:3,
>>> 	-
>>> )
[-3 -2 -1]
```

At `Range`, adapting to `List`:

```
>>> 4:4.adaptToCollectionAndApply(
>>> 	[1 2 3],
>>> 	-
>>> )
[-3 -2 -1]
```

In the sequence case the adaptation is courtesy `withCollect`:

```
>>> [1 2 3].withCollect(4:4, -)
[-3 -2 -1]

>>> 1:3.withCollect([4], -)
[-3 -2 -1]
```

* * *

See also: adaptToNumberAndApply, Elementwise, withCollect

Guides: AdaptTo Protocol

Categories: Converting
