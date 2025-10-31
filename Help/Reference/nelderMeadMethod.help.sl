# nelderMeadMethod

- _nelderMeadMethod(f:/1, [x₁ x₂ …], o)_

Implement the Nelder-Mead method,
also known as the downhill simplex method or polytope method,
to find a local minimum or maximum of an objective function in a multidimensional space.

Find the local minimum of simple anonymous functions:

```
>>> { :v |
>>> 	let [x] = v;
>>> 	(x ^ 4) - (3 * (x ^ 2)) - x
>>> }.nelderMeadMethod([0])
(fx: -3.51391, x: [1.30084])

>>> { :v |
>>> 	let [x, y] = v;
>>> 	(x - 0.3).square +
>>> 	(2 * y.square) +
>>> 	0.5
>>> }.nelderMeadMethod([1 1])
(fx: 0.5, x: [0.3 0])

>>> { :v |
>>> 	let [x, y] = v;
>>> 	(y.sin * x).square +
>>> 	x.square +
>>> 	y.square
>>> }.nelderMeadMethod([-3.5 3.5])
(fx: 0, x: [0 0])
```

Minimize the Rosenbrock function in two dimensions:

```
>>> rosenbrockFunction(1, 100)
>>> .nelderMeadMethod([-1 1])
(fx: 0, x: [1 1])
```

Minimize the Rosenbrock function in five dimensions:

```
>>> rosenbrockFunction(1, 100)
>>> .nelderMeadMethod(
>>> 	[1.3 0.7 0.8 1.9 1.2]
>>> )
(fx: 0, x: [1 1 1 1 1])
```

Minimize Himmelblau’s function:

```
>>> { :v |
>>> 	let [x, y] = v;
>>> 	0 - himmelblausFunction(x, y)
>>> }.nelderMeadMethod([0 0])
(fx: -181.6165, x: [-0.270845 -0.923039])
```

Minimize the Griewank function:

```
>>> griewankFunction:/1
>>> .nelderMeadMethod([2.5 -1.5])
(fx: 0, x: [0 0])
```

Minimize the Goldstein-Price function:

```
>>> goldsteinPriceFunction:/1
>>> .nelderMeadMethod([0.2 -0.18])
(fx: 3, x: [0 -1])
```

Find local minimum of nonlinear function:

```
>>> { :v |
>>> 	let [x] = v;
>>> 	(-x * x.sin) +
>>> 	(3 * x.cos) +
>>> 	(x / 1000)
>>> }.nelderMeadMethod([-10])
(fx: -8.7905, x: [-8.3030])
```

Find a local minimum, starting the search at _x=2_:

```
>>> { :v |
>>> 	let [x] = v;
>>> 	x * x.cos
>>> }.nelderMeadMethod([2])
(fx: -3.28837, x: [3.42562])
```

With a different starting points, locate a different local minima:

```
>>> { :v |
>>> 	let [x] = v;
>>> 	x * x.cos
>>> }.nelderMeadMethod([10])
(fx: -9.47729, x: [9.52933])
```

Local minimum of a two-variable function:

```
>>> { :v |
>>> 	let [x, y] = v;
>>> 	x.sin * (2 * y).sin
>>> }.nelderMeadMethod([2 2])
(fx: -1, x: [1.5708, 2.3562])
```

* * *

See also: griewankFunction, himmelblausFunction, rosenbrockFunction

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Nelder-MeadMethod.html)
[2](https://reference.wolfram.com/language/ref/FindMinimum.html)
[3](https://reference.wolfram.com/language/ref/NMinimize.html),
_W_
[1](https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method)
