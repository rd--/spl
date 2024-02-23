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

_numArgs_ is used to implement _cull_.

* * *

See also: Block Semantics, cull, value

Categories: Accessing
