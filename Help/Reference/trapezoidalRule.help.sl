# trapezoidalRule

- _trapezoidalRule(f:/1, [a b], n)_

Implement the trapezoidal rule,
also called the trapezium rule,
a technique for numerical integration of _f_ over the interval _(a,b)_.
The step size _h_ is given by _(b-a)/n_.

Integrate the `square` function over _(1,5)_:

```
>>> square:/1
>>> .trapezoidalRule([1 5], 100)
41.3344

>>> square:/1
>>> .adaptiveSimpsonsMethod([1 5])
41 + 1/3
```

Integrate the `cube` function over _(0,1)_:

```
>>> cube:/1
>>> .trapezoidalRule([0 1], 100)
0.25
```

Integrate the `reciprocal` function over _(1,100)_:

```
>>> reciprocal:/1
>>> .trapezoidalRule([1 100], 5000)
4.6052
```

Integrate the `sin` function over _(0,π)_:

```
>>> sin:/1
>>> .trapezoidalRule([0 1.pi], 100)
2
```

Integrate an exponential function:

```
>>> { :x |
>>> 	5 * x * (-2 * x).exp
>>> }.trapezoidalRule([0.1 1.3], 100)
0.8938
```

Integrate a sampled function using linear interpolation:

```
>>> [1 5.2; 2.5 7.7; 7 9.6; 10 13.2]
>>> .interpolation('Linear')
>>> .trapezoidalRule([1 10], 400)
82.8
```

* * *

See also: adaptiveSimpsonsMethod

Guides: Numerical Methods

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TrapezoidalRule.html)
[2](https://mathworld.wolfram.com/Newton-CotesFormulas.html)
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/trapz.html)
_W_
[1](https://en.wikipedia.org/wiki/Trapezoidal_rule)
[2](https://en.wikipedia.org/wiki/Newton%E2%80%93Cotes_formulas)
[3](https://en.wikipedia.org/wiki/Numerical_integration)
