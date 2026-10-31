# Compare

`Compare` is a trait collecting behaviours for objects that can be ordered.
Types that implement `Compare` must also implement `Equal`.

The trait is divided into two closely related parts.

The first part concerns values that can be strictly ordered on a real number line.
The required method is:

- `less`, `<`

The implemented methods include:

- `greaterEqual`, `>=`
- `greater`, `>`
- `lessEqual`, `<=`
- `max`
- `min`
- `strictCompare`, `<=>`

These methods apply strictly to scalar values,
and thread elementwise over collections:

```
>>> [1 3 5] < [2 3 4]
[true false false]
```

The first part concerns types such as `Complex` and `String` that cannot be strictly ordered,
but for which a coherent comparison function can be defined.
The required method is:

- `compare`

The implemented methods are:

- `compareOn`
- `precedes`, `<|`
- `precedesOrEqual`, `<=|`
- `succeeds`, `|>`
- `succeedsOrEqual`, `|>=`

The `compare` method is derived from `less`, if `less` is defined.

`Compare` is a `Trait`:

```
>>> system
>>> .traitDictionary['@Compare']
>>> .isTrait
true
```

Types implementing `Compare`:

```
>>> system
>>> .traitTypes('@Compare')
>>> .sort!
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
	'Interval'
	'LargeInteger'
	'LinkedList'
	'List'
	'ListView'
	'Nil'
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

See also: Equal, <, >, compare, less

Guides: Comparison Functions, Sort Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-Ord.html),
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
