# designMatrix

- _designMatrix(m, f:/1)_

Answer a design matrix for the matrix _m_ applying the unary block _f_ to the list of predictors.

Design matrix for a linear model:

```
>>> [1 0; 2 0; 3 0; 4 0; 5 0]
>>> .designMatrix { :x | x }
[1 1; 1 2; 1 3; 1 4; 1 5]
```

Add a quadratic term:

```
>>> [1 0; 2 0; 3 0; 4 0; 5 0]
>>> .designMatrix { :x | x ^ [1 2] }
[1 1 1; 1 2 4; 1 3 9; 1 4 16; 1 5 25]
```

Design matrix with two predictor variables:

```
>>> [3 6 0; 10 4 0; 2 2 0; 10 7 0; 7 5 0]
>>> .designMatrix { :x | x }
[1 3 6; 1 10 4; 1 2 2; 1 10 7; 1 7 5]
```

Include a product term:

```
>>> [
>>> 	3 6 0; 10 4 0; 2 2 0; 10 7 0; 7 5 0;
>>> 	1 0 0; 5 1 0; 5 9 0; 0 4 0; 10 9 0
>>> ].designMatrix { :u |
>>> 	let [x, y] = u;
>>> 	[x, y, x * y]
>>> }
[
	1  3  6 18;
	1 10  4 40;
	1  2  2  4;
	1 10  7 70;
	1  7  5 35;
	1  1  0  0;
	1  5  1  5;
	1  5  9 45;
	1  0  4  0;
	1 10  9 90
]
```

Use any numeric functions of the predictors:

```
>>> [1 0; 2 0; 3 0; 4 0; 5 0]
>>> .designMatrix { :u |
>>> 	let [x] = u;
>>> 	[x.sin, x.sqrt]
>>> }
[
	1  0.841471 1;
	1  0.909297 1.414214;
	1  0.141120 1.732051;
	1 -0.756802 2;
	1 -0.958924 2.236068
]
```

* * *

See also: leastSquares

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DesignMatrix.html)
_W_
[1](https://en.wikipedia.org/wiki/Design_matrix)
