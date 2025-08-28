# GeneralisedCircle

- _GeneralisedCircle(c, α, d)_

A `Type` representing a generalised circle.

```
>>> GeneralisedCircle(1, 2J1, 1)
>>> .asCircle
Circle([-2 1], 2)

>>> GeneralisedCircle(1, -3J-4, 16)
>>> .asCircle
Circle([3 -4], 3)
```

From `Circle`:

```
>>> Circle([0 0], 1)
>>> .asGeneralisedCircle
GeneralisedCircle(1, 0J0, -1)

>>> GeneralisedCircle(1, 0J0, -1).asCircle
Circle([0 0], 1)

>>> Circle([2 1], 1.5).asGeneralisedCircle
GeneralisedCircle(1, -2J1, 2.75)

>>> GeneralisedCircle(1, -2J1, 2.75).asCircle
Circle([2 1], 1.5)

>>> let a = Circle([3 -4], 3);
>>> let b = a.asGeneralisedCircle;
>>> (b.isCircle, b, b.asCircle)
(true, GeneralisedCircle(1, -3J-4, 16), a)
```

From `InfiniteLine`:

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
GeneralisedCircle(0, 1J1, 0)
.implicitEquation
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/GeneralisedCircle-B.svg)

* * *

See also: Circle

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Generalised_circle)
