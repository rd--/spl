# namedConstant

- _namedConstant(s)_

Answer a `Decimal` number representing the mathematical or physical constant named at the `String` _s_.

The tetranacci constant,
OEIS [A086088](https://oeis.org/A086088):

```
>>> let n = 'TetranacciConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(1.927562, 101)

>> 'TetranacciConstant'
>> .namedConstant
1.927561975482925304261905861736
62216869855425516338472714664703
80096660622978155591498182534618
9065325D
```

* * *

See also: Decimal, tetranacciConstant

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TetranacciConstant.html),
_OEIS_
[1](https://oeis.org/A086088)
