# gaussianElimination

- _gaussianElimination(aMatrix, aVector)_

Gaussian elimination is a method for solving matrix equations of the form _Ax=b_.

Solve for 3×3 matrix and 3 vector:

```
>>> let m = [1 3 1; 1 1 -1; 3 11 5];
>>> let v = [9 1 35];
>>> m.gaussianElimination(v)
[-3 4 0]

>>> let m = [2 1 -1; -3 -1 2; -2 1 2];
>>> let v = [8 -11 -3];
>>> m.gaussianElimination(v)
[2 3 -1]

>>> let m = [11 2 11; 3 100 100; 36 36 122];
>>> let v = [7 8 8];
>>> let x = m.gaussianElimination(v);
>>> m.dot(x) ~ v
true
```

Solve for 6×6 matrix and 6 vector:

```
>>> let m = [
>>> 	1 0    0     0     0      0;
>>> 	1 0.63 0.39  0.25  0.16   0.10;
>>> 	1 1.26 1.58  1.98  2.49   3.13;
>>> 	1 1.88 3.55  6.70 12.62  23.80;
>>> 	1 2.51 6.32 15.88 39.90 100.28;
>>> 	1 3.14 9.87 31.01 97.41 306.02
>>> ];
>>> let v = [-0.01 0.61 0.91 0.99 0.60 0.02];
>>> m.gaussianElimination(v)
[
	-0.01000  1.60279 -1.61320
	 1.24549 -0.49099  0.06576
]
```

* * *

See also: gaussSeidelMethod, inverse, rowReduce

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GaussianElimination.html),
_W_
[1](https://en.wikipedia.org/wiki/Gaussian_elimination)
