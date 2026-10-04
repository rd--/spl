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
>>> 2 ^ 31 - 1
2_147_483_647

>>> (2 ^ 31 - 1).isBinary
true

>>> -2 ^ 31
-2_147_483_648

>>> (-2 ^ 31).isBinary
true
```

At `LargeInteger`:

```
>>> 2_166_136_261.isBinary
false

>>> 2_166_136_261L.isBinary
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
>>> WriteStream(
>>> 	List(100)
>>> ).isBinary
false

>>> WriteStream(
>>> 	ByteArray(100)
>>> ).isBinary
true
```

* * *

See also: Binary, Tree

Guides: Stream Functions, Tree Functions

Categories: Testing
