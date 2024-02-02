# ~ -- comparing

- _p ~ q_ ⟹ _closeTo(p, q)_

Answer true if _p_ is almost equal to (or similar to) _q_, else false.

_Rationale_:
Writing ~ to indicate _similar to_ is a standard mathematical notation,
as is writing ≈ to indicate _approximately_.
However the notation is a little confusing in this context.
In Smalltalk ~= is the operator for _not equal to_, and ~~ is the operator for _not identical to_.
If these operators were written != and !== it may be less confusing.

* * *

See also: =, <~, >~, closeTo, veryCloseTo

Unicode: ≈ U+2248 Almost Equal To

References:
_Apl_
[1](https://aplwiki.com/wiki/Not_Match)
