# ifFalseIfTrue

- _ifFalseIfTrue(alpha, beta, gamma)_ => _if(alpha, gamma, beta)_

Ternary `if` with branches swapped.

```
>>> true.ifFalseIfTrue { 1 } { 2 }
2

>>> false.ifFalseIfTrue { 1 } { 2 }
1
```

* * *

See also: if, ifFalse, ifTrue

References:
_Smalltalk_
5.3.3.6

Categories: Evaluating
