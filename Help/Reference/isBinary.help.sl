# isBinary

- _isBinary(x)_

Predicate to test if a value implements the `Binary` trait.

```
>>> 23.isBinary
true

>>> 3.141.isBinary
false

>>> 3/4.isBinary
false
```

At `SmallFloat` only 31-bit integer values answer `true`:

```
>>> 2166136261.isBinary
false

>>> 2166136261L.isBinary
true
```

At `Tree` answers if the tree is a binary tree:

```
>>> { :x | [x x] }
>>> .iterate(nil, 4)
>>> .expressionTree(nil)
>>> .isBinary
true
```

At `Stream` tells if the underlying collection is a `ByteArray`:

```
>>> List(100).asWriteStream
>>> .isBinary
false

>>> ByteArray(100).asWriteStream
>>> .isBinary
true
```

* * *

See also: Binary, Tree

Guides: Stream Functions, Tree Functions

Categories: Testing
