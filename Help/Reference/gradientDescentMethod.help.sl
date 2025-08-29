# gradientDescentMethod

- _gradientDescentMethod(f₁, x, α, ε)_

Implement the gradient descent method,
also called the method of steepest descent,
an algorithm for finding the nearest local minimum of a function.

```
>>> let f = { :v |
>>> 	let [x, y] = v;
>>> 	let a = (x - 1) * (x - 1);
>>> 	let b = (-1 * y * y).exp;
>>> 	let c = y * (y + 2);
>>> 	let d = (-2 * x * x).exp;
>>> 	(a * b) + (c * d)
>>> };
>>> let [x, y] = gradientDescentMethod(
>>> 	f:/1, [0.1 -1], 0.1, 6E-7
>>> );
>>> ([x y], f([x y]))
([0.107627 -1.223260], -0.75)
```

* * *

See also: conjugateGradientMethod

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MethodofSteepestDescent.html),
_W_
[1](https://en.wikipedia.org/wiki/Gradient_descent)
