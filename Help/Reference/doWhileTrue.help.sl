# doWhileTrue

- _doWhileTrue(f:/0, condition:/0)_

Conditional evaluation.
Evaluate the block _f_ once,
then again as long the value of the block _condition_ is `true`.

```
>>> let n = 1;
>>> let l = [];
>>> { n := n + 1 }.doWhileTrue {
>>> 	l.add(n); n <= 3
>>> };
>>> l
[2 3 4]
```

C.f. `whileTrue`:

```
>>> let n = 1;
>>> let l = [];
>>> { n <= 3 }.whileTrue {
>>> 	l.add(n); n := n + 1
>>> };
>>> l
[1 2 3]
```

* * *

See also: doWhileFalse, if, ifFalse, ifNil, ifTrue, whileFalse, whileTrue

Guides: Control Functions, Iteration Functions

Categories: Evaluating
