# numArgs

- _numArgs(f:/n)_

Answer _n_,
the number of arguments that must be used to evaluate the _n_-ary block _f_.

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

See also: cull, value

Guides: Block Functions, Block Semantics

References:
_Smalltalk_
5.4.1.1

Categories: Accessing
