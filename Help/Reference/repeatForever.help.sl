# repeatForever

- _repeatForever(f:/0)_

Evaluate the no-argument block _f_ repeatedly,
ending only if the block explicitly returns (non-locally):

```
>>> { :return:/1 |
>>> 	{
>>> 		system
>>> 		.randomBoolean(0.5, [])
>>> 		.ifTrue {
>>> 			true.return
>>> 		}
>>> 	}.repeatForever
>>> }.valueWithReturn
true
```

* * *

See also: Block, repeatForeverWithBreak, whileFalse, whileTrue

Guides: Block Functions, Control Functions, Non-local Return

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-loop)

Categories: Controlling
