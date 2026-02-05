# adaptToCollectionAndApply

- _adaptToCollectionAndApply(x, c, f:/2)_

Request that the object _x_ adapt itself to operating with the collection _c_ elementwise,
and then apply the block _f_ with itself as the second parameter.

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
