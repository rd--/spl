# Compare

`Compare` is a `Trait` collecting behaviours for objects that can be ordered.
Types that implement `Compare` must also implement `Equal`.

```
>>> system
>>> .traitDictionary['Compare']
>>> .isTrait
true
```

The trait is divided into two closely related parts.

The required method is:

- `less`, `<`

The implemented methods include:

- `compare`, `<=>`
- `greaterEqual`, `>=`
- `greater`, `>`
- `lessEqual`, `<=`
- `max`
- `min`

The required method is:

- `compare`, `<=>`

The implemented methods are:

- `precedes`, `<|`
- `precedesOrEqualTo`, `<=|`
- `succeeds`, `|>`
- `succeedsOrEqualTo`, `|>=`

Types implementing `Compare`:

```
>>> system
>>> .traitTypes('@Compare')
>>> .sort
[
	'Association'
	'Boolean'
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
The `less` and related methods are implemented for numeric types that have a strict ordering.
`Complex` and `String` implement `compare` but not `less`.
`List` implements `less` elementwise, and `compare` lexicograpically.

* * *

See also: <, >, compare, Equal, less

Guides: Comparison Functions, Sort Functions

References:
_Haskell_
[1](https://hackage-content.haskell.org/package/base/docs/Data-Ord.html),
_Rust_
[1](https://doc.rust-lang.org/std/cmp/trait.Ord.html),
_Smalltalk_
5.6.1,
_Swift_
[1](https://developer.apple.com/documentation/swift/comparable),
_W_
[1](https://en.wikipedia.org/wiki/Magnitude_(mathematics))

Unicode:
U+227a ≺ Precedes,
U+227c ≼ Precedes Or Equal To,
U+227B ≻ Succeeds,
U+227D ≽ Succeeds or Equal To
