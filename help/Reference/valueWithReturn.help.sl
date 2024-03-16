# valueWithReturn

- _valueWithReturn(aBlock:/1)_

Non-local control flow.
Provides a return block to _aBlock_, which can be used exit directly from _aBlock_, returning a value.
By convention the return block is called return.

```
>>> let count = 1;
>>> let answer = valueWithReturn { :return:/1 |
>>> 	{
>>> 		(count > 99).if {
>>> 			count.return
>>> 		} {
>>> 			count := count + 1
>>> 		}
>>> 	}.repeat
>>> };
>>> answer
100
```

Where supported `valueWithReturn` is displayed as ↓,
and both `return` and `return:/1` are displayed as ↑.

Where supported an editor command inserts the conventional spelling of this construct,
i.e. _spl-insert-non-local-return (C-c C-r)_ in Emacs.

* * *

See also: Non-local Return, repeat

Unicode: U+2193 ↓ Downwards Arrow, U+2191 ↑ Upwards Arrow
