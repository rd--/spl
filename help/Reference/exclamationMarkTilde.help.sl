# !~

- _p !~ q_ ⟹ p.isCloseTo(q).not

Answer true if _p_ is not almost equal to (or not similar to) _q_, else false.

_Rationale_:
Writing ~ to indicate _similar to_ is a standard mathematical notation.
However it is a little confusing in this context.
In Smalltalk ~= is the operator for _not equal to_, and ~~ is the operator for _not identical to_.
If these operators were written != and !== then !~ could indicate _not similar to_.

* * *

See also: =, <~, >~, isCloseTo, isVeryCloseTo

Unicode: ≉ U+2249 Not Almost Equal To, ≁ U+2241 Not Tilde

References:
_Apl_
[1](https://aplwiki.com/wiki/Not_Match)

Categories: Comparing
