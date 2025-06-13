# Superellipse

- _Superellipse(c, a, b, n)_

A `Type` representing a superellipse, also known as a Lamé curve.
_c_ is the center,
_a_, _b_ and _n_ are parameters that allow for various shapes between a rectangle and an ellipse.

```
>>> Superellipse([0 0], 1, 1, 1).area
2

>>> Superellipse([0 0], 1, 1, 4).area
3.70815
```

Implements `at` and `atAll` to evaluate `superellipseFunction`:

~~~spl svg=A
let theta = (0 -- 2.pi).subdivide(100);
Superellipse([0 0], 1, 1, 0.5)
.atAll(theta)
.Line
.asLineDrawing
~~~

![](sw/spl/Help/Image/Superellipse-A.svg)

* * *

See also: Circle, Ellipse, superellipseFunction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Superellipse.html),
_W_
[1](https://en.wikipedia.org/wiki/Superellipse)
