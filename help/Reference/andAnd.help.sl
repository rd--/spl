# &&

- _aBoolean && anotherBoolean_

The _non-evaluating_ form of and.
The operand must be a Boolean.

	true && true
	true && false = false
	[false false true true] && [false true false true] = [false false false true]
	[true true true true true].reduce(&&) = true
	[true false false true true].reduce(&&) = false

Combine assertions with &&:

	(2 > 1) && (pi > 3) = true


The name of this operator is _andAnd_.

* * *

See also: &, |, ||, and, or

Categories: Logic, Operator
