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

Start counting again and again,
OEIS [A002260](https://oeis.org/A002260)
and [A004736](https://oeis.org/A004736):

```
>>> 1:7.collect(iota:/1)
[
	1;
	1 2;
	1 2 3;
	1 2 3 4;
	1 2 3 4 5;
	1 2 3 4 5 6;
	1 2 3 4 5 6 7
]

>>> 1:7.collect { :i |
>>> 	i.iota(i, -1)
>>> }
[
	1;
	2 1;
	3 2 1;
	4 3 2 1;
	5 4 3 2 1;
	6 5 4 3 2 1;
	7 6 5 4 3 2 1
]
```

Where supported `iota` is displayed as ⍳.

* * *

See also: rank, reshape, shape

Guides: Array Functions, Matrix Functions, List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Index_Generator),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/idot),
_OEIS_
[1](https://oeis.org/A002260)
[2](https://oeis.org/A004736)

Unicode: U+2373 ⍳ APL Functional Symbol Iota
