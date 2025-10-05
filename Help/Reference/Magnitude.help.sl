# Magnitude

`Magnitude` is a `Trait` defining comparison operators between numeric values.
Types that implement magnitude should also implement `Equatable`,
and should declare themselves `Comparable`.

```
>>> system
>>> .traitTypes('Magnitude')
>>> .includesAll(
>>> 	[
>>> 		'SmallFloat'
>>> 		'LargeInteger'
>>> 		'Residue'
>>> 		'Fraction'
>>> 		'Decimal'
>>> 		'Quantity'
>>> 	]
>>> )
true
```

The required methods are:

- `<`
- `=`: Equatable

The implemented operators include:

- `<`
- `<=`
- `>=`
- `<=>`

The implemented methods include:

- `compare`
- `max`
- `min`

* * *

See also: <=, >, >=, <=>, betweenAnd, boole, clamp, Comparable, min, max

Guides: Comparison Functions

References:
_Smalltalk_
5.6.1,
_Swift_
[1](https://developer.apple.com/documentation/swift/comparable),
_W_
[1](https://en.wikipedia.org/wiki/Magnitude_(mathematics))

Categories: Comparison, Trait
