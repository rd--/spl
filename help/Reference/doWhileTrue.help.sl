# doWhileTrue

- _doWhileTrue(aBlock:/0, conditionBlock:/0)_

Conditional evaluation.
Evaluate _aBlock_ once, then again as long the value of _conditionBlock_ is true.

```
>>> let n = 1;
>>> let l = [];
>>> { n := n + 1 }.doWhileTrue { l.add(n); n <= 3 };
>>> l
[2 3 4]
```

Cf. `whileTrue`:

```
>>> let n = 1;
>>> let l = [];
>>> { n <= 3 }.whileTrue { l.add(n); n := n + 1 };
>>> l
[1 2 3]
```

* * *

See also: doWhileFalse, if, ifFalse, ifNil, ifTrue, whileFalse, whileTrue

Categories: Evaluating
