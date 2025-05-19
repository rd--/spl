# repeat

- _repeat(s, n)_
- _repeat(aBlock:/0)_

At `String`,
answer a string consisting of the string _s_ repeated _n_ times.

A `String` of twenty-three copies of the letter _a_:

```
>>> 'a'.repeat(23)
'aaaaaaaaaaaaaaaaaaaaaaa'
```

Repeat a triplet of characters seven times:

```
>>> 'xyz'.repeat(7)
'xyzxyzxyzxyzxyzxyzxyz'
```

At `Block`,
evaluate _aBlock_ repeatedly, ending only if the block explicitly returns (non-locally).

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

See also: Block, constantArray, findRepeat, stringCatenate, stringJoin, whileFalse, whileTrue

Guides: Non-local Return, String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringRepeat.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-loop)

Categories: Controlling
