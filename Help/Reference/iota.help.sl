# iota

- _iota(shape, start=1, step=1)_

Index generator.
In the scalar case answer a `List` of indices:

```
>>> 5.iota
[1 2 3 4 5]

>>> 2 ^ 6.iota
[2 4 8 16 32 64]
```

In the vector case answer an array of indices with the indicated shape:

```
>>> [2 3].iota
[1 2 3; 4 5 6]

>>> 6.iota.reshape([2 3])
[1 2 3; 4 5 6]

>>> [3 2].iota
[1 2; 3 4; 5 6]

>>> 6.iota.reshape([3 2])
[1 2; 3 4; 5 6]
```

The ternary case specifies the _start_ and _step_ values:

```
>>> 5.iota(3, 4)
[3 7 11 15 19]

>>> [3 3].iota(3, 4)
[
	 3  7 11;
	15 19 23;
	27 31 35
]
```

Where supported `iota` is displayed as ⍳.

* * *

See also: reshape, rank, shape

References:
_Apl_
[1](https://aplwiki.com/wiki/Index_Generator),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/idot)

Unicode: U+2373 ⍳ APL Functional Symbol Iota
