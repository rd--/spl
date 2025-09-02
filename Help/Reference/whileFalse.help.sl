# whileFalse

- _whileFalse(condition:/0, f:/0)_

Conditional evaluation.
Evaluate the block _f_ as long as the value of the block _condition_ is `false`.

Ordinarily _condition_ and _f_ are literal no-argument blocks written using `Trailing Block Syntax`.

A counter:

```
>>> let l = [];
>>> let i = 1;
>>> { i >= 9 }.whileFalse {
>>> 	l.add(i);
>>> 	i := i + 1
>>> };
>>> (l, i)
([1 .. 8], 9)
```

In the unary case, simply evaluate _condition_ repeatedly as long as it answers `false`:

```
>>> let l = [];
>>> let i = 1;
>>> {
>>> 	l.add(i);
>>> 	i := i + 1 ;
>>> 	i >= 9
>>> }.whileFalse;
>>> (l, i)
([1 .. 8], 9)
```

* * *

See also: if, ifEmpty, ifFalse, ifNil, ifNotNil, ifTrue, whileTrue

Guides: Control Functions, Iteration Functions

References:
_Smalltalk_
5.4.2.3
5.4.2.4

Categories: Evaluating
