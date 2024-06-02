# conjugateGradientMethod

- _conjugateGradientMethod(a, b, x, epsilon, n)_

Use the conjugate gradient method to solve a linear system of two equations:

```
>>> let a = [4 1; 1 3];
>>> let b = [1 2];
>>> let x = [2 1];
>>> a.conjugateGradientMethod(b, x, 1E-15, 9)
[1/11 7/11]
```

Use the conjugate gradient method to solve a linear system of three equations:

```
>>> let a = [2 -1 0; -1 3 -1; 0 -1 2];
>>> let b = [1 8 -5];
>>> let x = [0 0 0];
>>> a.conjugateGradientMethod(b, x, 1E-15, 9)
[2 3 -1]
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConjugateGradientMethod.html),
_W_
[1](https://en.wikipedia.org/wiki/Conjugate_gradient_method)
