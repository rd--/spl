# Record

- _Record([k₁ v₁; k₂ v₂; …])_

A `Record` is a `Dictionary` type where all the keys are strings.
Answer a `Record` where the keys and values are specified in a two-column matrix.

Construct a `Record` from a two-column matrix:

```
>>> Record(['x' 1; 'y' 2; 'z' 3])
(x: 1, y: 2, z: 3)
```

There is a literal syntax for records.

```
>>> (x: 3.141, y: 23).isRecord
true
```

There is a conversion method,
`asRecord`,
from an `Association` `List`:

```
>>> ['x' -> 3.141, 'y' -> 23].asRecord
(x: 3.141, y: 23)

>>> ['pi' -> 1.pi].asRecord
>>> .isDictionary
true
```

At the ordinary `asRecord` constructor it is an `error` if any key is not a string:

```
>>> {
>>> 	[1.pi -> 'pi'].asRecord
>>> }.ifError { :err | true }
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

* * *

See also: asJson, asRecord, Association, Dictionary, Map

Guides: Dictionary Functions, Record Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Association.html)

Categories: Collection, Type
