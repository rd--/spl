# leastSquares

- _leastSquares(m, b)_

Answer a value _x_ that solves the linear least-squares problem for the matrix equation _m.x=b_.

Solve a simple least-squares problem:

```
>>> let m = [1 1; 1 2; 1 3];
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

Use least squares to fit data _{w,p}_ using a model _a+b*log(w)=p_,
and predict _p_ for _w_ of 100:

```
>>> let m = [
>>> 	44 92; 61 99; 81 104;
>>> 	113 111; 131 113
>>> ];
>>> let d = m.designMatrix(log:/1);
>>> let [_, y] = m.transpose;
>>> d.leastSquares(y)
[18.924 19.385]

>>> 18.924 + (19.385 * 100.log)
108.195
```

Use least squares to predict a Kepler orbit:

```
>>> let r = [3 2.3 1.65 1.25 1.01];
>>> let theta = [0.89 1.2 1.43 1.78 2.15];
>>> let d = [r theta r].transpose.designMatrix { :u |
>>> 	let [r, theta] = u;
>>> 	[r * theta.cos]
>>> };
>>> d.leastSquares(r)
[1.4857 0.8322]
```

Use least squares to fit data _{x,y}_ using a quadratic polynomial:

```
>>> let x = [0 .. 10];
>>> let y = [
>>> 	1 6 17 34 57
>>> 	86 121 162 209 262
>>> 	321
>>> ];
>>> let m = [x, y].transpose;
>>> let d = m.designMatrix { :x |
>>> 	x ^ [0 1 2]
>>> };
>>> d.leastSquares(y)
[1 2 3 0]
```

* * *

See also: dot, inverse, pseudoInverse, qrDecomposition, singularValueDecomposition

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LeastSquares.html),
_W_
[1](https://en.wikipedia.org/wiki/Least_squares)
[2](https://en.wikipedia.org/wiki/Ordinary_least_squares)
