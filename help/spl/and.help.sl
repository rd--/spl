# & -- logic operator

- _aBoolean & aProcedure:/0_
- _and(aBoolean, aProcedure:/0)_

true if _aBoolean_ is true and _aProcedure_ evaluates to true, else false.
If _aBoolean_ is false then _aProcedure_ is not evaluated.

Where supported _and_ is displayed as ∧.

	true & { true }
	true.and { true }
	true & { false } = false
	true.and { false } = false

_Note:_
In Smalltalk _&_ and _and_ have different behaviour,
the former is _evaluating_ and the latter not.
If _&_ were named _ampersand_ this behaviour could be adopted.

* * *

See also: |

Unicode: U+2227 ∧ Logical and
