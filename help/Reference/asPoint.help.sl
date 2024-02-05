# asPoint

_asPoint(aNumber | aPoint)_

In the Number case answer a point with equal x & y.

```
>>> [1, 2].asPoint
Point(1, 2)

>>> (1, 2).asPoint
Point(1, 2)

>>> (x: 1, y: 2).asPoint
Point(1, 2)
```

In the Point case answer _identity_.

```
>>> let p = Point(1, 2);
>>> p == p.asPoint
true
```

* * *

See also: asComplex

Categories: Converting
