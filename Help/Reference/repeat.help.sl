# repeat

- _repeat(aBlock:/0)_

Evaluate _aBlock_ repeatedly, ending only if the block explicitly returns (non-locally).

```
>>> { :return:/1 |
>>> 	{
>>> 		system
>>> 		.randomBoolean(0.5, [])
>>> 		.ifTrue {
>>> 			true.return
>>> 		}
>>> 	}.repeat
>>> }.valueWithReturn
true
```

* * *

See also: Block, whileFalse, whileTrue

Guides: Non-local Return

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-loop)

Categories: Controlling
