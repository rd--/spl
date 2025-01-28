# permanent

- _permanent(aMatrix)_

Answer the permanent of a square matrix.

The permanent of a _2×2_ `Integer` matrix:

```
>>> [1 1; 1 1].permanent
2

>>> [2 2; 2 2].permanent
8

>>> [1 2; 3 4].permanent
10

>>> [3 1; 7 -4].permanent
-5

>>> [1 2; 0 2].permanent
2

>>> [4 3; 2 5].permanent
26
```

The permanents of _3×3_ `Integer` matrices:

```
>>> [1 2 3; 4 5 6; 7 8 9]
>>> .permanent
450

>>> [-1 4 -2; -2 -4 3; 6 -5 1]
>>> .permanent
111

>>> [1 2 4; 5 4 5; 9 2 7]
>>> .permanent
382

>>> [-2 -1 2; 2 1 4; -3 3 -1]
>>> .permanent
-2

>>> [1 2 3; 4 1 6; 7 8 1]
>>> .transposed
>>> .permanent
258

>>> [2 9 4; 7 5 3; 6 1 8]
>>> .permanent
900
```

The permanents of _4×4_ `Integer` matrices:

```
>>> [
>>> 	1 1 1 1;
>>> 	2 1 0 0;
>>> 	3 0 1 0;
>>> 	4 0 0 1
>>> ].permanent
10

>>> [
>>> 	1 2 3 4;
>>> 	4 5 6 7;
>>> 	7 8 9 10;
>>> 	10 11 12 13
>>> ].permanent
29556

>>> [
>>> 	1 2 3 1;
>>> 	-1 -1 -1 2;
>>> 	1 3 1 1;
>>> 	-2 -2 0 -1
>>> ].permanent
-10

>>> [
>>> 	7 2 -2 4;
>>> 	4 4 1 7;
>>> 	11 -8 9 10;
>>> 	10 5 12 13
>>> ].permanent
10723
```

The permanent of a _5×5_ `Integer` matrix:

```
>>> ([5 5].iota - 1).permanent
6778800
```

The permanent of a _3×3_ `SmallFloat` matrix:

```
>>> [
>>> 	1.7 7.1 -2.7;
>>> 	2.2 8.7 3.2;
>>> 	3.2 -9.2 1.2
>>> ].permanent
38.6279
```

Permanent of a _3×3_ `Complex` matrix:

```
>>> [
>>> 	1J1 2J0 3J-2;
>>> 	0J0 12.56637J0 0J5;
>>> 	3J0 0J0 6J0
>>> ].permanent
188.49555J30
```

The permanent of a square matrix of all ones is the factorial of the dimension:

```
>>> 1:5.collect { :each |
>>> 	{ :i :j |
>>> 		1
>>> 	}.table(1:each, 1:each).permanent
>>> }
[1 2 6 24 120]
```

An `identityMatrix` always has unit permanent:

```
>>> 1:5.collect { :each |
>>> 	each.identityMatrix.permanent
>>> }
[1 1 1 1 1]
```

The permanent of the transpose of _m_ equals the permanent of _m_:

```
>>> let m = system.randomReal(0, 1, [3 3]);
>>> m.transposed.permanent
m.permanent
```

* * *

See also: determinant, isSquareMatrix, permutations, trace

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Permanent.html)
[2](https://reference.wolfram.com/language/ref/Permanent.html),
_W_
[1](https://en.wikipedia.org/wiki/Permanent_(mathematics))

Categories: Math, Matrix
