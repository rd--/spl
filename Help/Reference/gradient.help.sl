# gradient

- _gradient([x₁ x₂ …], h)_

Answer the the one-dimensional numerical gradient of vector a list given the spacing _h_.
The answer has the same number of places as the initial list.

Calculate the gradient of a monotonically increasing vector:

```
>>> [1 .. 10].gradient(1)
[1 1 1 1 1 1 1 1 1 1]
```

Use the gradient at a particular point to linearly approximate the function value at a nearby point,
and compare it to the actual value:

```
>>> let x = [-1, -0.75 .. 0.5];
>>> let n = x.size;
>>> let y = x.sin;
>>> let g = y.gradient(0.25);
>>> let e = y[n] + (g[n] * (0.5005 - 0.5));
>>> (e, 0.5005.sin)
(0.4799, 0.4799)
```

* * *

See also: differences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Gradient.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/gradient.html)
