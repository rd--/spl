# ravel

- _ravel(anArray)_

Answer a `List` containing all the atoms in _anArray_,
in the order in which they appear when displayed,
i.e. _row_ order for a matrix.

```
>>> let a = [2 3 4].iota;
>>> (a, a.ravel)
(
	[
		 1  2  3  4;
		 5  6  7  8;
		 9 10 11 12
		:;
		13 14 15 16;
		17 18 19 20;
		21 22 23 24
	],
	[1 .. 24]
)
```

At `Matrix`:

```
>>> [3 3].iota.asMatrix.ravel
[1 2 3 4 5 6 7 8 9]
```

* * *

See also: concatenation, flatten

Guides: Matrix Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Ravel),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/comma)

Categories: Collection
