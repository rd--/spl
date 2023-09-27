# | -- logic operator

- _aBoolean | aBlock:/0_
- _p | q_ ⟹ _or(p, q)_

true if _aBoolean_ is true or _aBlock_ evaluates to true, else false.
If _aBoolean_ is true then _aBlock_ is not evaluated.

Where supported _or_ is displayed as ∨.

Note that _|_ is not displayed as ∨ because it is part of the [Block Syntax].

_Note:_
In Smalltalk _|_ and _or:_ have different behaviour,
the former is _evaluating_ and the latter not.
If _|_ were named _verticalBar_ this behaviour could be adopted.
However for the moment _||_ is the name of the non-evaluating form.

* * *

See also: and or &

Unicode: U+2228 ∨ Logical or
