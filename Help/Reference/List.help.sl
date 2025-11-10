# List

- _List(n, x=nil)_

`List` is a sequential collection `Type`.
Lists may have any length or depth.

Traits implemented by `List`:

```
>>> system.typeLookup('List')
>>> .traitNameList
[
	'Object'
	'Equatable'
	'Comparable'
	'Json'
	'Iterable'
	'Indexable'
	'Collection'
	'Extensible'
	'Removable'
	'Sequenceable'
	'PrimitiveSequence'
	'Ordered'
]
```

Create a new `List` of _n_ places,
each initialised to the object _x_,
or to `nil` if _x_ is elided.

```
>>> List(3, 1)
[1 1 1]

>>> List(5, 0)
[0 0 0 0 0]

>>> List(7)
[nil nil nil nil nil nil nil]
```

The `#` and `!` operators can also construct these lists:

```
>>> 3 # [1]
[1 1 1]

>>> { 0 } ! 5
[0 0 0 0 0]
```

Lists are of variable `size`.
Elements can be added at the start, at the end, or in a place given by a relation to existing items.

```
>>> let l = List(1, 2);
>>> l.addLast(3);
>>> l.addFirst(1);
>>> l
[1, 2, 3]
```

Squares each number in the list, and add 1 to it:

```
>>> [3, 5, 1] ^ 2 + 1
[10, 26, 2]
```

The differences between corresponding elements in two lists:

```
>>> [6, 7, 8] - [3.5, 4, 2.5]
[ 2.5, 3, 5.5 ]
```

`List` implement mathematical functions elementwise:

```
>>> [2.5, 3, 5.5].exp
[12.1825, 20.0855, 244.692]
```

Lists can be assigned names:

```
>>> let l = [2, 4, 3.1];
>>> l / (l - 1)
[2, 4/3, 1.47619]
```

The empty list is written `[]`:

```
>>> [].isEmpty
true

>>> [].storeString
'[]'
```

A vector is a list of nonlist elements:

```
>>> [1, 2.3, '4'].isVector
true
```

A matrix is a list of vectors of equal length:

```
>>> [[1, 2, 3], [4, 5, 6]].isMatrix
true
```

A rectangular array is represented by nested lists with consistent dimensions:

```
>>> [
>>> 	[[ 1,  2,  3], [ 4,  5,  6]],
>>> 	[[ 7,  8,  9], [10, 11, 12]],
>>> 	[[13, 14, 15], [16, 17, 18]],
>>> 	[[19, 20, 21], [22, 23, 24]]
>>> ].isArray
true
```

Ragged arrays are nested lists that are not rectangular arrays:

```
>>> [[1, 2, 3], [4, 5], [6]].isArray
false

>>> [[1], [2, 3], [4, 5, 6]].isArray
false
```

* * *

See also: #, !, asList, asCollection, ByteArray, enclose, Float64Array, nest, Type

Guides: List Syntax, Vector Syntax

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/List.html),
_Smalltalk_
5.7.14,
_W_
[1](https://en.wikipedia.org/wiki/List)
[2](https://en.wikipedia.org/wiki/List_(abstract_data_type))

Categories: Collection, Type
