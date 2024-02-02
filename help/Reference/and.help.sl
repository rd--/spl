# & -- logic operator

- _aBoolean & aBlock:/0_

true if _aBoolean_ is true and _aBlock_ evaluates to true, else false.
If _aBoolean_ is false then _aBlock_ is not evaluated.

Where supported _and_ is displayed as ∧.

	true & { true }
	true.and { true }
	true & { false } = false
	true.and { false } = false

The name of this operator is _and_.

_Note:_
In Smalltalk _&_ and _and:_ have different behaviour,
the former is _evaluating_ and the latter not.
If _&_ were named _ampersand_ this behaviour could be adopted.
However for the moment _&&_ is the name of the non-evaluating form.

* * *

See also: |, &&, andAnd

Unicode: U+2227 ∧ Logical and

References:
_Apl_
[1](https://aplwiki.com/wiki/And)
