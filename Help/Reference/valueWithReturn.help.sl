# valueWithReturn

- _valueWithReturn(f:/1)_

Non-local control flow.
Provides a return block to the block _f_,
which can be used exit directly from _f_,
returning a value.

In the example below if _k_ were between one and nine the answer would be `one`,
but it is not and the answer is negative `one`:

```
>>> let k = 23;
>>> { :f |
>>> 	1.toDo(9) { :i |
>>> 		(i = k).ifTrue {
>>> 			f.value(1)
>>> 		}
>>> 	};
>>> 	-1
>>> }.valueWithReturn
-1
```

By convention the return block is called return:/1.
`repeat` repeats a block until it exits non-locally:

```
>>> let count = 1;
>>> let answer = { :return:/1 |
>>> 	{
>>> 		(count > 99).if {
>>> 			count.return
>>> 		} {
>>> 			count := count + 1
>>> 		}
>>> 	}.repeat
>>> }.valueWithReturn;
>>> answer
100
```

Where supported `valueWithReturn` is displayed as ↓,
and both `return` and `return:/1` are displayed as ↑.

Where supported an editor command inserts the conventional spelling of this construct,
i.e. _spl-insert-non-local-return (C-c C-r)_ in Emacs.

* * *

See also: Block, repeat, value

Guides: Non-local Return

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-block)

Unicode: U+2193 ↓ Downwards Arrow, U+2191 ↑ Upwards Arrow
