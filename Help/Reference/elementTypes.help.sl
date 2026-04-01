# elementTypes

- _elementTypes(c)_

Answer a `List` of answers of `typeOf` for each element of the collection _c_.

At a heterogeneous `List`:

```
>>> [1 2/3 4J5 '6' 7L].elementTypes
[
	'SmallFloat'
	'Fraction'
	'Complex'
	'String'
	'LargeInteger'
]
```

At a `Range`:

```
>>> 1:9.elementTypes
['SmallFloat']
```

At a _matrix_:

```
>>> [1 2 3; 4 5 6; 7 8 9].elementTypes
['List']
```

At `NumericArray`:

```
>>> NumericArray([2 3].iota)
>>> .elementTypes
['SmallFloat']
```

* * *

See also: elementType, elementTypeIfAbsent, typeOf

Guides: Reflection Functions

Categories: Reflection, Types
