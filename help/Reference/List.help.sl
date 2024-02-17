# List

List is a sequential collection Type.
Lists may have any length or depth.

- _List(anInteger, anObject)_
- _List(α) ⇒ List(α, nil)_

Create a new List of _anInteger_ places, each initialised to _nil_, or to _anObject_.

```
>>> List(3, 1)
[1, 1, 1]
```

Lists are of variable size, elements can be added at the start, at the end, or in a place given by a relation to existing items.

```
>>> let l = List(1, 2);
>>> l.addLast(3);
>>> l.addFirst(1);
>>> l
[1, 2, 3]
```

List implements the _Iterable_, _Indexable_, _Collection_, _Sequence_, _PrimitiveSequence_ and _Ordered_ traits.

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

Lists implement mathematical functions elementwise:

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

* * *

See also: asList, asCollection, ByteArray, enclose, Float64Array, nest, Type

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/List.html)

Categories: Collection, Type
