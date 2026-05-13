# List Constructor Syntax

Rewrite rule:

- _T[…]_ ⟹ _T([…])_

Uppercase unary functions may elide application parenthesis when applied to lists, vectors, matrices and volumes.

At `List Syntax`:

```
>>> Set[]
Set([])

>>> Set[1, 2, 3]
Set([1, 2, 3])
```

At `Vector Syntax`:

```
>>> Set[1 2 3]
Set([1 2 3])
```

At `Matrix` syntax:

```
>>> Line[0 0; 1 1]
>>> .vertexCoordinates
[0 0; 1 1]
```

`Map` constructors:

```
>>> Map[1 2; 3 4; 5 6]
>>> .keysAndValues
[1 2; 3 4; 5 6]

>>> Map[1 -> 2, 3 -> 4, 5 -> 6]
>>> .associations
[1 -> 2, 3 -> 4, 5 -> 6]
```

`Dictionary` constructors:

```
>>> Dictionary[1 2; 3 4; 5 6]
>>> .keysAndValues
[1 2; 3 4; 5 6]

>>> Dictionary[1 -> 2, 3 -> 4, 5 -> 6]
>>> .associations
[1 -> 2, 3 -> 4, 5 -> 6]
```

`Multiset` constructors:

```
>>> Multiset[1 1 1 2 2 3]
>>> .asList
[1 1 1 2 2 3]

>>> Multiset[1 -> 3, 2 -> 2, 3 -> 1]
>>> .sortedElements
[1 -> 3, 2 -> 2, 3 -> 1]
```

`ByteArray` constructor:

```
>>> ByteArray[1 2 3 4 5]
>>> .asList
[1 2 3 4 5]
```

_Rationale_:
This syntax supports the idiom of constructor functions taking a singular `List` argument.
It prevents typing _[…].T_ simply to avoid typing _T([…])_.
It avoids a proliferation of literal collection syntaxes,
typing _Set[…]_ is no worse than typing _{|…|}_,
and is much clearer.

* * *

Guides: List Syntax, Syntax Guides, Vector Syntax
