# at

- _at(c, i)_

Answer the item associated with index or key _i_ in the collection _c_.

If the collection does not support indexing,
or if the index is not valid,
report an _error_.

All sequenceable collections, including `List`, are indexable:

```
>>> ['x' 'y'].at(1)
'x'
```

Invalid indices signal an `error`:

```
>>> {
>>> 	['x' 'y'].at(3)
>>> }.hasError
true
```

With secondary index:

```
>>> [1 2 3; 4 5 6].at(2).at(3)
6

>>> [1 2 3; 4 5 6].atPath([2 3])
6
```

All dictionaries, including `Record` and `Map`, are indexable.
At `Record`:

```
>>> (x: 1, y: 2).at('x')
1
```

At `Map`:

```
>>> Map['x' -> 1, 'y' -> 2].at('x')
1

>>> Map[1 -> 'x', 2 -> 'y'].at(1)
'x'
```

A non-existing key signals an `error`:

```
>>> {
>>> 	(x: 1, y: 2).at('z')
>>> }.hasError
true
```

`String` is indexable:

```
>>> 'string'.at(3)
'r'
```

`IdentitySet` is not indexable:

```
>>> {
>>> 	[1 2 3].asIdentitySet.at(1)
>>> }.hasError
true
```

`IdentityMultiset` is not indexable:

```
>>> {
>>> 	[1 2 3].asIdentityMultiset.at(1)
>>> }.hasError
true
```

There is `At Sytax` for accessing indexed values.

At `List`:

```
>>> let l = ['x', 'y'];
>>> l[1]
'x'
```

At `Record`:

```
>>> let d = (x: 1, y: 2);
>>> d['x']
1
```

With secondary index:

```
>>> let m = [1 2 3; 4 5 6; 7 8 9];
>>> (
>>> 	m[3][2],
>>> 	m.at(3).at(2),
>>> 	m.atPath([3 2])
>>> )
(8, 8, 8)
```

Collections may implement extended arity forms as required.

It is an error if the index is a collection:

```
>>> {
>>> 	['1' '2' '3'].at([1 2])
>>> }.hasError
true
```

* * *

See also: atAll, atFold, atIfAbsent, atIfPresent, atIfPresentIfAbsent, atMod, atPath, atPin, atPut, atSymmetrical, atWrap, Indexable, size

Guides: AtPut Syntax, At Syntax, Indexing Functions, Property Read Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Part.html)
[2](https://reference.wolfram.com/language/ref/Lookup.html),
_Smalltalk_
5.7.2.2
5.7.8.4

Categories: Accessing
