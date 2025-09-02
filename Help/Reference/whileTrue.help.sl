# whileTrue

- _whileTrue(condition:/0, f:/0)_

Conditional evaluation.
Evaluate the block _f_ as long as the value of the block _condition_ is `true`.

Ordinarily _condition_ and _f_ are literal no-argument blocks written using `Trailing Block Syntax`.

Calculate an initial subsequence of the Fibonacci series,
the sum of two elements defines the next:

```
>>> let answer = [];
>>> let a = 0;
>>> let b = 1;
>>> { b < 1000 }.whileTrue {
>>> 	answer.add(b);
>>> 	[a, b] := [b, a + b]
>>> };
>>> answer
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987
]
```

In the unary case, simply evaluate _condition_ repeatedly as long as it answers `true`.

* * *

See also: doWhileTrue, if, ifFalse, ifNil, ifTrue, whileFalse

Guides: Control Functions, Iteration Functions

References:
_Smalltalk_
5.4.2.5
5.4.2.6

Categories: Evaluating
