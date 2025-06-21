# warpingCorrespondence

- _warpingCorrespondence(x, y, w=∞, f:/2)_

Answer the time warping similarity path between sequences _x_ and _y_,
using window _w_ and distance function _f_.

```
>>> let x = [1 2 3 4 5 9];
>>> let y = [11 9 8 9 12 14];
>>> x.warpingCorrespondence(y)
[
	1 2 3 4 5 6 6 6;
	1 2 3 3 3 4 5 6
]

>>> let x = [
>>> 	0 0 1 1 1 2 2 3 3 4
>>> 	4 5 6
>>> ];
>>> let y = [
>>> 	1 2 3 3 3 3 4 4 4 4
>>> 	5 5 5 5 6 6 7
>>> ];
>>> x.warpingCorrespondence(y)
[
	1 2 3 4 5 6 7 8 8 8
	9 10 10 10 11 12 12 12 12 13
	13 13;
	1 1 1 1 1 2 2 3 4 5
	6 7 8 9 10 11 12 13 14 15
	16 17
]
```

Find the time warping correspondence between two sequences of vectors:

```
>>> let x = [11 12; 13 14; 15 16];
>>> let y = [12 13; 14 15];
>>> x.warpingCorrespondence(y)
[
	1 2 3;
	1 1 2
]
```

The two sequences need not have the same length:

```
>>> let x = [1 2 3 4 5];
>>> let y = [1 2 3];
>>> x.warpingCorrespondence(y)
[
	1 2 3 4 5;
	1 2 3 3 3
]
```

The warping path of two equal sequences goes along a diagonal line:

```
>>> let x = [1 .. 10];
>>> let y = [1 .. 10];
>>> x.warpingCorrespondence(y)
[
	1 2 3 4 5 6 7 8 9 10;
	1 2 3 4 5 6 7 8 9 10
]
```

* * *

See also: warpingDistance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WarpingCorrespondence.html)
