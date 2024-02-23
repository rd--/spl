# whileFalse

Conditional evaluation.

- _whileFalse(condition:/0, aBlock:/0)_
- _whileFalse(condition:/0)_ ⟹ _whileFalse(condition:/0, { })_

Evaluate the argument, _aBlock_, as long as the value of _condition()_ is _false_.

Ordinarily _self_ and _aBlock_ are literal no-argument blocks written using `Trailing Block Syntax`.

In the second case, simply evaluate _condition_ repeatedly as long as it answers false.

* * *

See also: if, ifEmpty, ifFalse, ifNil, ifNotNil, ifTrue, whileTrue

Categories: Evaluating
