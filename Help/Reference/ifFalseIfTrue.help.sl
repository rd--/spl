# ifFalseIfTrue

- _ifFalseIfTrue(α, β, γ)_ ⟹ _if(α, γ, β)_

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
