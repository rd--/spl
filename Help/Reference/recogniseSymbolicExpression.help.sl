# recogniseSymbolicExpression

- _recogniseSymbolicExpression(aNumber)_

Answer a `SymbolicExpression` for _aNumber_,
if it is recognised,
else answer _aNumber_.

```
>>> [1.pi, 2.pi].collect { :each |
>>> 	each
>>> 	.recogniseSymbolicExpression
>>> 	.printString
>>> }
[
	'π'
	'(* 2 π)'
]
```

* * *

See also: SymbolicExpression
