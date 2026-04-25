# compoundMatrix

- _compoundMatrix(m, k)_

Answer the _k_-th compound matrix of _m_.

The _k=2_ compound matrix of the 3×4 `iota` matrix:

```
>>> 1:12.reshape([3 4])
[
	 1  2  3  4;
	 5  6  7  8;
	 9 10 11 12
]

>>> 1:12.reshape([3 4])
>>> .compoundMatrix(2)
[
	-4  -8  -4 -12  -8  -4;
	-8 -16  -8 -24 -16  -8;
	-4  -8  -4 -12  -8  -4
]
```

The _k=2_ compound matrix of a 3×3 matrix:

```
>>> [
>>> 	1 4 7;
>>> 	3 0 5;
>>> 	-1 9 11
>>> ].compoundMatrix(2)
[
	-12 -16  20;
	 13  18 -19;
	 27  38 -45
]
```

The _k=3_ compound matrix of a 4×4 matrix:

```
>>> [
>>> 	2 3 2 3;
>>> 	1 12 1 2;
>>> 	13 3 3 1;
>>> 	1 2 12 11
>>> ].compoundMatrix(3)
[
	-210   -372    10    72;
	 231    199   -11   131;
	-353   -295   217    91;
	-1783 -1627   185   281
]
```

The _k=3_ compound matrix of a 4×4 matrix:

```
>>> let m = { :i :j |
>>> 	i.square + (i * j) + j.cube
>>> }.table(1:4, 1:4);
>>> m.compoundMatrix(3)
[
	-24  -84  -96  -36;
	-72 -252 -288 -108;
	-72 -252 -288 -108;
	-24  -84  -96  -36
]
```

The _k=3_ and _k=4_ compound matrix of a 4×4 matrix:

```
>>> let m = [
>>> 	0.003   0.72  0.196  0.836;
>>> 	0.671   0.33  0.533  0.105;
>>> 	0.799   0.58  0.777  0.567;
>>> 	0.167   0.77  0.014  0.258
>>> ];
>>> 3:4.collect { :k |
>>> 	m.compoundMatrix(k)
>>> }
[
	-0.04432 -0.10822  0.022374  0.09003;
	 0.14657  0.27386 -0.096646 -0.24213;
	 0.18520  0.35225 -0.120394 -0.29852;
	-0.08058 -0.17490  0.057332  0.15451
	:;
	-0.007726
]
```

An alias for two argument form of `minors`.

* * *

See also: determinant, minors, submatrix, subsets
