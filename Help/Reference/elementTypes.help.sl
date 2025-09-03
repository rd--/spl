# elementTypes

- _elementTypes(c)_

Answer an `IdentitySet` of answers of `typeOf` for each element of the collection _c_.

At a heterogeneous `List`:

```
>>> [1 2/3 4J5 '6' 7L].elementTypes
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

At `NumericArray`:

```
>>> NumericArray([2 3].iota)
>>> .elementTypes
['SmallFloat'].asIdentitySet
```

* * *

See also: elementType, elementTypeIfAbsent, typeOf

Guides: Reflection Functions

Categories: Reflection, Types
