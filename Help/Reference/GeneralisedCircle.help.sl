# GeneralisedCircle

- _GeneralisedCircle(c, a+bi, d)_

A `Type` representing a generalised circle with equation _c(x²+y²)+2(ax-by)+d=0_.

If _c≠0_,
represents a circle with radius _√((a²+b²-cd)÷c²)_,
centered at _(-a÷c,b÷c)_:

```
>>> GeneralisedCircle(1.0, 2J1, 1.0)
>>> .Circle
Circle([-2 1], 2)

>>> GeneralisedCircle(1.0, -3J-4, 16.0)
>>> .Circle
Circle([3 -4], 3)
```

If _c=0_,
represents a line with equation _ax-by+½d=0_:

```
>>> GeneralisedCircle(0.0, 0J1, 0.0)
>>> .InfiniteLine
InfiniteLine[0 0; 1 0]
```

Derive a generalised circle from a `Circle`:

```
>>> Circle([0 0], 1)
>>> .GeneralisedCircle
GeneralisedCircle(1.0, 0J0, -1.0)

>>> GeneralisedCircle(1.0, 0J0, -1.0)
>>> .Circle
Circle([0 0], 1)

>>> Circle([2 1], 1.5)
>>> .GeneralisedCircle
GeneralisedCircle(1.0, -2J1, 2.75)

>>> GeneralisedCircle(1.0, -2J1, 2.75)
>>> .Circle
Circle([2 1], 1.5)

>>> Circle([3 -4], 3)
>>> .GeneralisedCircle
GeneralisedCircle(1.0, -3J-4, 16)

>>> GeneralisedCircle(1.0, -3J-4, 16)
>>> .Circle
Circle([3 -4], 3)
```

Derive a generalised circle from an `InfiniteLine`:

```
>>> InfiniteLine[0 0; 1 0]
>>> .GeneralisedCircle
GeneralisedCircle(0.0, 0J1, 0.0)

>>> GeneralisedCircle(0.0, 0J1, 0.0)
>>> .InfiniteLine
InfiniteLine[0 0; 1 0]

>>> InfiniteLine[0 0; 0 1]
>>> .GeneralisedCircle
GeneralisedCircle(0.0, 1J0, 0.0)

>>> GeneralisedCircle(0.0, 1J0, 0.0)
>>> .InfiniteLine
InfiniteLine[0 0; 0 1]

>>> InfiniteLine[0 0; 1 1]
>>> .GeneralisedCircle
GeneralisedCircle(0, 1J1, 0)

>>> GeneralisedCircle(0.0, 1J1, 0.0)
>>> .InfiniteLine
InfiniteLine[0 0; 1 1]

>>> InfiniteLine[0 1; 1 2]
>>> .GeneralisedCircle
GeneralisedCircle(0.0, 1J1, 2.0)

>>> GeneralisedCircle(0.0, 1J1, 2.0)
>>> .InfiniteLine
InfiniteLine[0 1; 1 2]

>>> InfiniteLine[0 1; 1 0]
>>> .GeneralisedCircle
GeneralisedCircle(0.0, -1J1, 2.0)

>>> GeneralisedCircle(0.0, -1J1, 2.0)
>>> .InfiniteLine
InfiniteLine[0 1; 1 0]
```

Plot the implicit equation for a circle:

~~~spl svg=A
let i = (-1.0 -- 1.0).subdivide(50);
GeneralisedCircle(1.0, 0J0, -1.0)
.implicitEquation
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/GeneralisedCircle-A.svg)

Plot the implicit equation for a line:

~~~spl svg=B
let i = (-3.0 -- 3.0).subdivide(15);
GeneralisedCircle(0.0, -1J1, 2.0)
.implicitEquation
.contourPlot(i, i, [0.0])
~~~

![](Help/Image/GeneralisedCircle-B.svg)

* * *

See also: Circle, InfiniteLine, implicitEquation

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Generalised_circle)
