# whileTrue

Conditional evaluation.

- _whileTrue(condition:/0, aBlock:/0)_
- _whileTrue(condition:/0)_ ⟹ _whileTrue(condition:/0, { })_

Evaluate _aBlock()_ as long as the value of _condition()_ is _true_.

Ordinarily _condition_ and _aBlock_ are literal no-argument blocks written using [Trailing Block Syntax].

In the second case, simply evaluate _condition_ repeatedly as long as it answers true.

* * *

See also: if, ifFalse, ifNil, ifTrue, whileFalse

Categories: Evaluating
