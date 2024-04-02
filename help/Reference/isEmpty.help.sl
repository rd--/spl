# isEmpty

- _isEmpty(aCollection)_

Answers whether _aCollection_ contains any elements.

For a finite collection this may be the same as asking if the _size_ is not zero,
however _size_ may require traversing the entire collection,
where _isEmpty_ may only need to examine if there is an initial element.

At `List`:

```
>>> [].isEmpty
true
```

At `Record`:

```
>>> ().isEmpty
true
```

At `String`:

```
>>> ''.isEmpty
true
```

At `Graph` is considered empty if it has no edges:

```
>>> let g = Graph([1 2 3], []);
>>> (g.vertexList, g.isEmpty)
([1 2 3], true)
```

For streams, answers `true` if both the set of past and future sequence values are empty.

* * *

See also: ifEmpty, notEmpty, size

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:null),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EmptyGraphQ.html),
_Smalltalk_
5.7.1.17

Categories: Testing
