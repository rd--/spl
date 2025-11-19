# Comparable

`Comparable` is a `Trait` collecting behaviours for objects that are comparable.

```
>>> system
>>> .traitDictionary['Comparable']
>>> .isTrait
true
```

Types implementing `Comparable`:

```
>>> system
>>> .traitTypes('@Comparable')
>>> .sort
[
	'Association'
	'ByteArray'
	'CalendarDuration'
	'CartesianCoordinates'
	'Character'
	'Complex'
	'Date'
	'DateAndTime'
	'Decimal'
	'DirectedEdge'
	'Duration'
	'Float32Array'
	'Float64Array'
	'Fraction'
	'Heap'
	'LargeInteger'
	'LinkedList'
	'List'
	'ListView'
	'NumericArray'
	'Package'
	'PlanarCoordinates'
	'Quantity'
	'Range'
	'Residue'
	'SmallFloat'
	'SortedList'
	'Span'
	'SparseArray'
	'String'
	'TimeStamp'
	'UndirectedEdge'
]
```

The required method is:

- `compare`

The implemented operators are:

- `<|`: ≺
- `<=|`: ≼
- `|>`: ≻
- `|=>`: ≽

The implemented methods are:

- `precedes`: ≺
- `precedesOrEqualTo`: ≼
- `succeeds`: ≻
- `succeedsOrEqualTo`: ≽

_Rationale_:
The `Magnitude` trait is implemented for numeric types that have a strict ordering.
Any type that implements `Magnitude` can implement `Comparable`.
Types such as `Complex` and `String` and `List` implement `Comparable` but not `Magnitude`.

* * *

See also: Equatable, Magnitude

Guides: Comparison Functions, Sort Functions

Unicode: U+227a ≺ Precedes, U+227c ≼ Precedes Or Equal To, U+227B ≻ Succeeds, U+227D ≽ Succeeds or Equal To
