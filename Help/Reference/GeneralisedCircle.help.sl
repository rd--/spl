# GeneralisedCircle

- _GeneralisedCircle(c, a+bi, d)_

A `Type` representing a generalised circle with equation _c(x²+y²)+2(ax-by)+d=0_.

If _c≠0_,
represents a circle with radius _√((a²+b²-cd)÷c²)_,
centered at _(-a÷c,b÷c)_:

```
>>> GeneralisedCircle(1, 2J1, 1)
>>> .asCircle
Circle([-2 1], 2)

>>> GeneralisedCircle(1, -3J-4, 16)
>>> .asCircle
Circle([3 -4], 3)
```

If _c=0_,
represents a line with equation _ax-by+½d=0_:

```
>>> GeneralisedCircle(0, 0J1, 0)
>>> .asLine
InfiniteLine([0 0; 1 0])
```

Derive a generalised circle from a `Circle`:

```
>>> Circle([0 0], 1)
>>> .asGeneralisedCircle
GeneralisedCircle(1, 0J0, -1)

>>> GeneralisedCircle(1, 0J0, -1)
>>> .asCircle
Circle([0 0], 1)

>>> Circle([2 1], 1.5)
>>> .asGeneralisedCircle
GeneralisedCircle(1, -2J1, 2.75)

>>> GeneralisedCircle(1, -2J1, 2.75)
>>> .asCircle
Circle([2 1], 1.5)

>>> Circle([3 -4], 3)
>>> .asGeneralisedCircle
GeneralisedCircle(1, -3J-4, 16)

>>> GeneralisedCircle(1, -3J-4, 16)
>>> .asCircle
Circle([3 -4], 3)
```

Derive a generalised circle from an `InfiniteLine`:

```
>>> InfiniteLine([0 0; 1 0])
>>> .asGeneralisedCircle
GeneralisedCircle(0, 0J1, 0)

>>> GeneralisedCircle(0, 0J1, 0)
>>> .asLine
InfiniteLine([0 0; 1 0])

>>> InfiniteLine([0 0; 0 1])
>>> .asGeneralisedCircle
GeneralisedCircle(0, 1J0, 0)

>>> GeneralisedCircle(0, 1J0, 0)
>>> .asLine
InfiniteLine([0 0; 0 1])

>>> InfiniteLine([0 0; 1 1])
>>> .asGeneralisedCircle
GeneralisedCircle(0, 1J1, 0)

>>> GeneralisedCircle(0, 1J1, 0)
>>> .asLine
InfiniteLine([0 0; 1 1])

>>> InfiniteLine([0 1; 1 2])
>>> .asGeneralisedCircle
GeneralisedCircle(0, 1J1, 2)

>>> GeneralisedCircle(0, 1J1, 2)
>>> .asLine
InfiniteLine([0 1; 1 2])

>>> InfiniteLine([0 1; 1 0])
>>> .asGeneralisedCircle
GeneralisedCircle(0, -1J1, 2)

>>> GeneralisedCircle(0, -1J1, 2)
>>> .asLine
InfiniteLine([0 1; 1 0])
```

Plot the implicit equation for a circle:

~~~spl svg=A
let i = (-1 -- 1).subdivide(50);
GeneralisedCircle(1, 0J0, -1)
.implicitEquation
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/GeneralisedCircle-A.svg)

Plot the implicit equation for a line:

~~~spl svg=B
let i = (-3 -- 3).subdivide(15);
GeneralisedCircle(0, -1J1, 2)
.implicitEquation
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/GeneralisedCircle-B.svg)

* * *

See also: Circle, implicitEquation, InfiniteLine

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Generalised_circle)
