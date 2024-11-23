# whileFalse

- _whileFalse(condition:/0, aBlock:/0)_
- _whileFalse(condition:/0)_ ⟹ _whileFalse(condition:/0, { })_

Conditional evaluation.
Evaluate _aBlock()_ as long as the value of _condition()_ is `false`.

Ordinarily _condition_ and _aBlock_ are literal no-argument blocks written using `Trailing Block Syntax`.

In the unary case, simply evaluate _condition_ repeatedly as long as it answers `false`.

* * *

See also: if, ifEmpty, ifFalse, ifNil, ifNotNil, ifTrue, whileTrue

References:
_Smalltalk_
5.4.2.3
5.4.2.4

Categories: Evaluating
