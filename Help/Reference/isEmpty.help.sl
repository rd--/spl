# isEmpty

- _isEmpty(c)_

Answers whether the collection _c_ contains any elements.

For a finite collection this may be the same as asking if the `size` is equal to zero,
however `size` may require traversing the entire collection,
whereas `isEmpty` may only need to examine if there is an initial element.

At `List`:

```
>>> [].isEmpty
true
```

At `Record`:

```
>>> (:).isEmpty
true
```

At `Map`:

```
>>> [:].isEmpty
true
```

At `Set`:

```
>>> {| |}.isEmpty
true
```

At `String`:

```
>>> ''.isEmpty
true
```

A `Graph` is considered empty if it has no edges:

```
>>> let g = Graph([1 2 3], []);
>>> (g.vertexList, g.isEmpty)
([1 2 3], true)
```

For streams, answers `true` if both the set of past and future sequence values are empty.

* * *

See also: ifEmpty, isNotEmpty, size

Guides: Collection Functions, Graph Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:null),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EmptyGraphQ.html),
_Smalltalk_
5.7.1.17

Categories: Testing
