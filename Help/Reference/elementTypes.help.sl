# elementTypes

- _elementTypes(aCollection)_

Answer a `IdentitySet` of answers of `typeOf` for each element of _aCollection_.

At a heterogeneous `List`:

```
>>> [1 2/3 4J5 '6' 7n].elementTypes
[
	'SmallFloat'
	'Fraction'
	'Complex'
	'String'
	'LargeInteger'
].asIdentitySet
```

At a `Range`:

```
>>> 1:9.elementTypes
['SmallFloat'].asIdentitySet
```

At a _matrix_:

```
>>> [1 2 3; 4 5 6; 7 8 9].elementTypes
['List'].asIdentitySet
```

* * *

See also: elementType, elementTypeIfAbsent, typeOf

Categories: Reflection, Types
