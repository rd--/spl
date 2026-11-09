# elementTypes

- _elementTypes(c)_

Answer a `List` of answers of `typeName` for each element of the collection _c_.

At a heterogeneous `List`:

```
>>> [1 2/3 4J5 '6' 7L].elementTypes
[
	'Float'
	'Fraction'
	'Complex'
	'String'
	'Integer'
]
```

At a `Range`:

```
>>> 1:9.elementTypes
['Float']
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
['Float']
```

* * *

See also: elementType, elementTypeIfAbsent, typeName

Guides: Collection Functions, Reflection Functions
