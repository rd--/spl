# Compare

`Compare` is a `Trait` collecting behaviours for objects that can be compared.

```
>>> system
>>> .traitDictionary['Compare']
>>> .isTrait
true
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

Types implementing `Compare`:

```
>>> system
>>> .traitTypes('@Compare')
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
	'RelativeRange'
	'Residue'
	'SmallFloat'
	'SortedList'
	'SparseArray'
	'String'
	'TimeStamp'
	'UndirectedEdge'
]
```

_Rationale_:
The `Magnitude` trait is implemented for numeric types that have a strict ordering.
Any type that implements `Magnitude` can implement `Compare`.
Types such as `Complex` and `String` and `List` implement `Compare` but not `Magnitude`.

* * *

See also: Equal, Magnitude

Guides: Comparison Functions, Sort Functions

References:
_Haskell_
[1](https://hackage-content.haskell.org/package/base/docs/Data-Ord.html),
_Rust_
[1](https://doc.rust-lang.org/std/cmp/trait.Ord.html)

Unicode: U+227a ≺ Precedes, U+227c ≼ Precedes Or Equal To, U+227B ≻ Succeeds, U+227D ≽ Succeeds or Equal To
