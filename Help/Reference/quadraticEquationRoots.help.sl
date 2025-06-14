# quadraticEquationRoots

- _quadraticEquationRoots(a, b, c)_

Answer the roots of the quadratic equation _ax²+bx+c=0_.

One real root:

```
>>> quadraticEquationRoots(3, 4, 4 / 3)
[-2/3 -2/3]

>>> quadraticEquationRoots(1, -2, 1)
[1 1]

>>> quadraticEquationRoots(1, 2, 1)
[-1 -1]
```

Two distinct real roots:

```
>>> quadraticEquationRoots(3, 2, -1)
[1/3 -1]

>>> quadraticEquationRoots(1, 22, -1323)
[27 -49]

>>> quadraticEquationRoots(1, -10, 1)
[9.89898 0.10102]

>>> quadraticEquationRoots(3, -2, -4)
[1.53518 -0.86852]
```

Two imaginary roots:

```
>>> quadraticEquationRoots(1, 0, 1)
[0J1 0J-1]
```

Two distinct complex roots:

```
>>> quadraticEquationRoots(1, -1E6, 1)
[1E6 1E-6]

>>> quadraticEquationRoots(1, -1E10, 1)
[1E10 1E-10]

>>> quadraticEquationRoots(1, 1, 1)
[-0.5000J0.86603 -0.50000J-0.86603]

>>> quadraticEquationRoots(3, 2, 1)
[-0.33333J0.47140 -0.33333J-0.47140]
```

With _a_ not equal to one:

```
>>> quadraticEquationRoots(6, -23, 20)
[2.5 4/3]
```

* * *

See also: UnivariatePolynomial

