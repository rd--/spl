# closeTo -- comparing

- _closeTo(aNumber, anotherNumber)_
- _p ~ q_ ⟹ _closeTo(p, q)_

Answer true is _aNumber_ is close to _anotherNumber_, else false.
This takes magnitude into account, so that a million is close to a million and one, but one is not close to two.

	1000000 ~ 1000001 & { 1 !~ 2 }

_Rationale_:
The use of ~ as the operator to indicate _similar to_ is a standard mathematical notation.
However it is a little confusing in this context because in Smalltalk ~= is the binary operator for _not equal to_,
and ~~ is the binary operator for _not identical to_.

* * *

See also: =, <~, >~, veryCloseTo
