# asList

- _asList(x)_

At a `Collection`,
answer a `List` whose elements are the elements of _x_.

If the collection is a `List`, answer it directly.

```
>>> let a = [1 2 3 4 5];
>>> let b = a.asList;
>>> (b, b == a)
([1 2 3 4 5], true)
```

At `Tuple`:

```
>>> (1, 2, 3).asList
[1 2 3]
```

At `Record`,
answer a list of the values:

```
>>> (x: 1, y: 2, z: 3).asList
[1 2 3]

>>> (x: 1, y: 2, z: 3).values
[1 2 3]

>>> (x: 1, y: 2, z: 3).associations
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

At `Multiset`:

```
>>> [1 2 2 3 3 3 4 4 4 4]
>>> .asMultiset
>>> .asList
[1 2 2 3 3 3 4 4 4 4]
```

At `NumericArray` answers the `normal` `List` array:

```
>>> NumericArray([1 2; 3 4; 5 6]).asList
[1 2; 3 4; 5 6]

>>> NumericArray([1 2; 3 4; 5 6]).normal
[1 2; 3 4; 5 6]
```

This should not be defined for scalar values, see `asCollection`.

* * *

See also: copy, List, asCollection

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DateList.html),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/xco#dyadic),
_Smalltalk_
5.7.1.3

Categories: Converting
