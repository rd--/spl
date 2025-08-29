# gaussSeidelMethod

- _gaussSeidelMethod(a, b, x=[0…], ε=1E-9, n=100)_

Implements the Gauss–Seidel method,
also known as the Liebmann method or the method of successive displacement,
to solve a system of linear equations.

_a·x=b_ is a square system of linear equations,
ε is a tolerance for ending the iteration,
_n_ is a maximum iteration count.

Solve a system of two equations:

```
>>> let a = [3 1; 2 6];
>>> let b = [5 9];
>>> a.gaussSeidelMethod(b)
[1.3125 1.0625]

>>> [3 1; 2 6].dot([1.3125 1.0625])
[5 9]
```

Solve a system of two equations:

```
>>> let a = [9 -3; -2 8];
>>> let b = [6 -4];
>>> a.gaussSeidelMethod(b)
[0.545454 -0.363636]

>>> [9 -3; -2 8].dot([0.545454 -0.363636])
[6 -4]
```

Solve a system of two equations:

```
>>> let a = [1 -3; -2 8];
>>> let b = [6 -4];
>>> a.gaussSeidelMethod(b)
[18 4]

>>> [1 -3; -2 8].dot([18 4])
[6 -4]
```

Solve a system of two equations:

```
>>> let a = [16 3; 7 -11];
>>> let b = [11 13];
>>> a.gaussSeidelMethod(b)
[0.81218 -0.66497]

>>> [16 3; 7 -11].dot([0.81218 -0.66497])
[11 13]
```

Solve a system of three equations:

```
>>> let a = [4 1 2; 3 5 1; 1 1 3];
>>> let b = [4 7 3];
>>> a.gaussSeidelMethod(b)
[0.5 1 0.5]

>>> [4 1 2; 3 5 1; 1 1 3].dot([0.5 1 0.5])
[4 7 3]
```

Solve a system of three equations:

```
>>> let m = [11 2 11; 3 100 100; 36 36 122];
>>> let v = [7 8 8];
>>> let x = m.gaussSeidelMethod(v);
>>> m.dot(x) ~ v
true
```

Solve a system of three equations:

```
>>> let a = [45 2 3; -3 104 100; 36 36 122];
>>> let b = [13 103 8];
>>> let x = a.gaussSeidelMethod(b);
>>> (x, a.dot(x) ~ b)
([0.25470 1.40583 -0.42442], true)
```

Solve a system of three equations:

```
>>> let a = [45 2 3; -3 22 2; 5 1 20];
>>> let b = [58 47 67];
>>> let x = a.gaussSeidelMethod(b);
>>> (x, a.dot(x) ~ b)
([1 2 3], true)
```

Solve a system of four equations:

```
>>> let a = [
>>> 	10 -1 2 0;
>>> 	-1 11 -1 3;
>>> 	2 -1 10 -1;
>>> 	0 3 -1 8
>>> ];
>>> let b = [6 25 -11 15];
>>> let x = a.gaussSeidelMethod(b);
>>> (x, a.dot(x) ~ b)
([1 2 -1 1], true)
```

* * *

See also: gaussianElimination

Guides: Numerical Methods

References:
_W_
[1](https://en.wikipedia.org/wiki/Gauss%E2%80%93Seidel_method)
