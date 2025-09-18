# Comparable

`Comparable` is a `Trait` collecting behaviours for objects that are comparable.

The required method is:

- `compare`

The implemented methods are:

- `precedes`
- `precedesOrEqualTo`
- `succeeds`
- `succeedsOrEqualTo`

The implemented operators are:

- `<|`: precedes
- `<=|`: precedes or equal to
- `|>`: succeeds
- `|=>`: succeeds or equal to

_Rationale_:
The `Magnitude` trait is implemented for numeric types that have a strict ordering.
Any type that implements `Magnitude` can implement `Comparable`.
Types such as `Complex` and `String` and `List` implement `Comparable` but not `Magnitude`.

* * *

See also: Magnitude

Guides: Comparison Functions, Sorting Functions
