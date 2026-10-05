# Record

- _Record([k₁ v₁; k₂ v₂; …])_

A `Record` is a `Dictionary` type where all the keys are strings.
Answer a `Record` where the keys and values are specified in a two-column matrix.

List of traits implemented by `Record`:

```
>>> system.typeLookup('Record')
>>> .traitNameList
>>> .sort!
[
	'Collection'
	'Copy'
	'Dictionary'
	'Equal'
	'Extensible'
	'Indexable'
	'Iterable'
	'Json'
	'Object'
	'Store'
]
```

Construct a `Record` from a two-column matrix:

```
>>> Record['x' 1; 'y' 2; 'z' 3]
(x: 1, y: 2, z: 3)
```

Construct a `Record` from an association list:

```
>>> Record['x' -> 1, 'y' -> 2, 'z' -> 3]
(x: 1, y: 2, z: 3)

>>> Record['A' -> ['B' 'C']]
(A: ['B' 'C'])
```

There is a literal syntax for records.

```
>>> (x: 3.141, y: 23).isRecord
true

>>> (:).isRecord
true
```

The empty record:

```
>>> Record().isEmpty
true

>>> Record[].isEmpty
true

>>> (:).isEmpty
true
```

It is an `error` if the matrix does not have `String` items in the first column,
or does not have two columns:

```
>>> {
>>> 	Record[1 2; 3 4; 5 6]
>>> }.hasError
true

>>> {
>>> 	Record['x' 1 2; 'y' 3 4; 'z' 5 6]
>>> }.hasError
true
```

At a `Map`:

```
>>> Map['x' -> 1, 'y' -> 2, 'z' -> 3]
>>> .Record
(x: 1, y: 2, z: 3)
```

A `Record` is a dictionary:

```
>>> (pi: 1.pi).isDictionary
true
```

It is an `error` if any key is not a string:

```
>>> {
>>> 	Record['pi' -> 1.pi, 1.pi -> 'pi']
>>> }.hasError
true
```

Records are unordered collections,
and have expected mathematical behavior in relation to scalars:

```
>>> (a: 1, b: 2, c: 3) * 5
(a: 5, b: 10, c: 15)
```

and sequences:

```
>>> (x: 3, y: 5) * [7 9]
(x: [21 27], y: [35 45])
```

Records are unordered:

```
>>> (x: 1, y: 2) = (y: 2, x: 1)
true
```

The sequence of associations as written is, however, retained:

```
>>> (z: 3, x: 1, y: 2).associations
['z' -> 3, 'x' -> 1, 'y' -> 2]
```

and assocations are added at the end:

```
>>> let r = (y: 2);
>>> r.add!('x' -> 1);
>>> r.associations
['y' -> 2, 'x' -> 1]
```

* * *

See also: encodeJson, Association, Dictionary, List, Map

Guides: Dictionary Functions, Record Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Association.html)

Categories: Collection, Type
