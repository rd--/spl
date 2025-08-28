# InfiniteLine

- _InfiniteLine([x₁ y₁ …; x₂ y₂ …])_
- _InfiniteLine([x y …], [u v …])_
- _InfiniteLine(a, b, c)_

A `Type` to represent and infinite straight line,
defined either as passing through the two points _x₁,y₁…_ and _x₂,y₂…_
or as passing through the point _x,y…_ in the direction _u,v…_,
or by the implicit equation _ax+by+c=0_.

Infinite lines given two points:

```
>>> InfiniteLine([0 0; 1 1])
>>> .slopeInterceptForm
[1 0]

>>> InfiniteLine([2 0; 0 3])
>>> .slopeInterceptForm
[-1.5 3]
```

Infinite lines given a point and a vector:

```
>>> InfiniteLine([0 0], [1 1])
>>> .slopeInterceptForm
[1 0]

>>> InfiniteLine([1 2], [1 2/3])
>>> .slopeInterceptForm
[2/3 4/3]
```

Infinite lines given coefficients _a,b,c_:

```
>>> InfiniteLine(4, -2, -2)
>>> .slopeInterceptForm
[2 -1]

>>> InfiniteLine(-2, -3, 11)
>>> .slopeInterceptForm
[-2/3 11/3]

>>> InfiniteLine(2, -3, 4)
>>> .slopeInterceptForm
[2/3 4/3]

>>> InfiniteLine(1, -1, 0)
>>> .slopeInterceptForm
[1 0]

>>> InfiniteLine(1, -1, 1)
>>> .slopeInterceptForm
[1 1]
```

Derive the `UnivariatePolynomial` of a line:

```
>>> InfiniteLine([2 0; 1 2]).polynomial
UnivariatePolynomial([4 -2])
```

Plot using implicit equation:

~~~spl svg=A
let i = (-1 -- 1).subdivide(15);
InfiniteLine([0 0], [2/3 1])
.implicitEquation
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/InfiniteLine-A.svg)

* * *

See also: HalfLine, Line

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InfiniteLine.html),
_W_
[1](https://en.wikipedia.org/wiki/Line_(geometry))

Categories: Geometry
