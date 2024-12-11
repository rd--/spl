# leastSquares

- _leastSquares(m, b)_

Answer a value _x_ that solves the linear least-squares problem for the matrix equation _m.x = b_.

Solve a simple least-squares problem:

```
>>> let m = [1 1 ; 1 2; 1 3];
>>> let b = [7 7 8];
>>> leastSquares(m, b)
[19/3 1/2]
```

Find the least squares for a real-valued matrix:

```
>>> let m = [
>>> 	3.2 2.2 1.2;
>>> 	2.1 7.1 8.5;
>>> 	9.5 6.7 3.7
>>> ];
>>> let b = [7 8 9];
>>> leastSquares(m, b)
[73.9499 -174.3795 128.3294]
```

Least squares of a 3×2 matrix:

```
>>> let m = [1 2; 3 -4; 1 -1];
>>> let b = [0 -2 1];
>>> leastSquares(m, b)
[-14/55 1/5]
```

Least squares of a 5×3 matrix:

```
>>> let m = [
>>> 	4 3 3;
>>> 	2 2 1;
>>> 	7 6 8;
>>> 	4 0 4;
>>> 	6 3 5
>>> ];
>>> let b = [4 2 8 2 1];
>>> leastSquares(m, b)
[-192/253 1385/1518 32/33]
```

Least squares of a 5×1 column-matrix:

```
>>> leastSquares(
>>> 	[2; 1; 3; 4; 5],
>>> 	[1 2 3 4 5]
>>> )
[0.98181]
```

Least squares of a 3×2 integer matrix with integer answer:

```
>>> let m = [1 1; 2 1; 1 2];
>>> let b = [3 4 5];
>>> leastSquares(m, b)
[1 2]
```

Solve for data set giving average heights and weights:

```
>>> let h = [
>>> 	1.47 1.50 1.52 1.55 1.57
>>> 	1.60 1.63 1.65 1.68 1.70
>>> 	1.73 1.75 1.78 1.80 1.83
>>> ];
>>> let w = [
>>> 	52.21 53.12 54.48 55.84 57.20
>>> 	58.57 59.93 61.29 63.11 64.47
>>> 	66.28 68.10 69.92 72.19 74.46
>>> ];
>>> let m = h.collect { :each |
>>> 	each ^ [0 1 2]
>>> };
>>> let b = w;
>>> leastSquares(m, b)
[128.8128 -143.1620 61.9603]
```

* * *

See also: dot, inverse, qrDecomposition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LeastSquares.html),
_W_
[1](https://en.wikipedia.org/wiki/Ordinary_least_squares)
