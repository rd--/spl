# GeneralisedCircle

- _GeneralisedCircle(c, α, d)_

A `Type` representing a generalised circle.

```
>>> let a = GeneralisedCircle(1, 2J1, 1);
>>> (a.isCircle, a.asCircle)
(true, Circle([-2 1], 2))

>>> GeneralisedCircle(1, -3J-4, 16)
>>> .asCircle
Circle([3 -4], 3)
```

From `Circle`:

```
>>> let a = Circle([3 -4], 3);
>>> let b = a.asGeneralisedCircle;
>>> (b.isCircle, b, b.asCircle)
(true, GeneralisedCircle(1, -3J-4, 16), a)
```

From `InfiniteLine`:

```
>>> let a = InfiniteLine([0 0], [1 1]);
>>> let b = a.asGeneralisedCircle;
>>> (b.isLine, b, b.asLine)
(true, GeneralisedCircle(0, -1J1, 0), a)
```

* * *

See also: Circle

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Generalised_circle)
