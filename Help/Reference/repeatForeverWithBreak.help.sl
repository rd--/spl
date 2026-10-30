# repeatForeverWithBreak

- _repeatForeverWithBreak(f/1)_

Evaluate the one-argument block _f_ repeatedly,
passing a no-argument break block to exit:

```
>>> { :break/0 |
>>> 	system
>>> 	.randomBoolean(0.5, [])
>>> 	.ifTrue {
>>> 		break()
>>> 	}
>>> }.repeatForeverWithBreak
nil
```

* * *

See also: Block, repeatForever, whileFalse, whileTrue, withReturn

Guides: Block Functions, Control Functions, Non-local Return

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-loop)
