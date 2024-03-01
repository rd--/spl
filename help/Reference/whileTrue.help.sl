# whileTrue

- _whileTrue(condition:/0, aBlock:/0)_
- _whileTrue(condition:/0)_ ⟹ _whileTrue(condition:/0, { })_

Conditional evaluation.
Evaluate _aBlock()_ as long as the value of _condition()_ is `true`.

Ordinarily _condition_ and _aBlock_ are literal no-argument blocks written using `Trailing Block Syntax`.

In the unary case, simply evaluate _condition_ repeatedly as long as it answers `true`.

* * *

See also: if, ifFalse, ifNil, ifTrue, whileFalse

Categories: Evaluating
