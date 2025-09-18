# rotateLeft

- _rotateLeft([x₁ x₂ …], n=1)_

Rotate te sequence _x_ by _n_ places to the left,
i.e. _n_ elements from the start are moved to the end.
The rotation is not in place, a new sequence is answered.

```
>>> [1 2 3 4 5 6 7].rotateLeft(3)
[4 5 6 7 1 2 3]

>>> [1 2 3 4 5 6 7].rotateLeft(8)
[2 3 4 5 6 7 1]

>>> [1 2 3 4 5 6 7].rotateLeft(-4)
[4 5 6 7 1 2 3]
```

Rotate two positions to the left:

```
>>> 1:5.rotateLeft(2)
[3 4 5 1 2]
```

Rotate one position to the left:

```
>>> 1:5.rotateLeft(1)
[2 3 4 5 1]
```

Successively rotate a list left:

```
>>> rotateLeft:/1.nestList([1 2 3 4 5], 4)
[
	1 2 3 4 5;
	2 3 4 5 1;
	3 4 5 1 2;
	4 5 1 2 3;
	5 1 2 3 4
]
```

Rotate successive rows of a matrix by their row number:

```
>>> let u = [1 2 3 4];
>>> let m = u ! 5;
>>> m.withIndexCollect(rotateLeft:/2)
[
	2 3 4 1;
	3 4 1 2;
	4 1 2 3;
	1 2 3 4;
	2 3 4 1
]
```

Rotate matrix rows:

```
>>> 0:9.reshape([5 2]).rotateLeft(2)
[
	4 5;
	6 7;
	8 9;
	0 1;
	2 3
]
```

The unary form rotates by one place:

```
>>> [1 2 3 4 5 6 7].rotateLeft
[2 3 4 5 6 7 1]
```

There is also an in-place variant:

```
>>> let x = [1 2 3 4 5];
>>> x.rotateLeftInPlace;
>>> x
[2 3 4 5 1]
```

At `String`:

```
>>> 'abcdefg'.rotateLeft(3)
'defgabc'

>>> 'abcdefg'.rotateLeft(-3)
'efgabcd'
```

* * *

See also: atWrap, rotateRight

References:
_Apl_
[1](https://aplwiki.com/wiki/Rotate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bardot#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RotateLeft.html)

Categories: Ordering
