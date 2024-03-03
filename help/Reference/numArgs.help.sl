# numArgs

- _numArgs(aBlock)_

Answer the number of arguments that must be used to evaluate _aBlock_.

```
>>> { }.numArgs
0

>>> { :x | x }.numArgs
1

>>> collect:/2.numArgs
2
```

`numArgs` is used to implement `cull`.

* * *

See also: Block Semantics, cull, value

References:
_Smalltalk_
5.4.2.1

Categories: Accessing
