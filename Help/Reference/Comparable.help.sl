# Comparable

`Comparable` is a `Trait` collecting behaviours for objects that are comparable.

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

Guides: Comparison Functions, Sorting Functions

Unicode: U+227a ≺ Precedes, U+227c ≼ Precedes Or Equal To, U+227B ≻ Succeeds, U+227D ≽ Succeeds or Equal To
