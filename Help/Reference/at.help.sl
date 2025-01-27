# at

- _at(aCollection, anIndex)_
- _at(c, i, j)_
- _at(c, i, j, k)_

In the binary case,
answer the item associated with _anIndex_ in _aCollection_.

In the ternary case _c_ is a collection, _i_ the primary index, and _j_ a secondary index.
In the quaternary case _k_ is a tertiary index.

If the collection does not support indexing,
or if any index is not valid,
report an _error_.

All sequenceable collections, including `List`, are indexable:

```
>>> ['x', 'y'].at(1)
'x'
```

Invalid indices signal an `error`:

```
>>> { ['x', 'y'].at(3) }.ifError { true }
true
```

With secondary index:

```
>>> [1 2 3; 4 5 6].at(2, 3)
6
```

All dictionaries, including `Record`, are indexable:

```
>>> (x: 1, y: 2).at('x')
1
```

A non-existing key signals an `error`:

```
>>> { (x: 1, y: 2).at('z') }.ifError { true }
true
```

`String` is indexable:

```
>>> 'string'.at(3)
'r'
```

`Set` is not indexable:

```
>>> { [1 2 3].asSet.at(1) }.ifError { true }
true
```

`Bag` is not indexable:

```
>>> { [1 2 3].asBag.at(1) }.ifError { true }
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
>>> 	m[3, 2],
>>> 	m[3][2],
>>> 	m.at(3, 2),
>>> 	m.at(3).at(2)
>>> )
(8, 8, 8, 8)
```

The `Trait` definitions of the extended arity forms are:

- _at(c,i,j)_ = _at(at(c,i),j)_
- _at(c,i,j,k)_ = _at(at(at(c,i),j),k)_
Collections may implement extended arity forms as required.

* * *

See also: atAll, atFold, atIfAbsent, atIfPresent, atIfPresentIfAbsent, atMod, atPath, atPin, atPut, atWrap, Indexable, size

Guides: AtPut Syntax, At Syntax, Quoted At Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Part.html),
_Smalltalk_
5.7.2.2
5.7.8.4

Categories: Accessing
