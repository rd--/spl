# Logical Operators

Logical and is _&_, logical or is _|_, logical not is _not_.
As in Smalltalk the right hand side of these operators must be delayed.

	true.not & { nil } = false
	true | { nil } = true

* * *

See also _bitAnd_, _bitOr_
