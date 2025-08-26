# inversiveDistance

- _inversiveDistance(c₁, c₂)_

Answer the inversive distance between circles _c₁_ and _c₂_.

Two disjoint circles:

```
>>> let c1 = Circle([0 0], 1);
>>> let c2 = Circle([3 0], 1);
>>> c1.inversiveDistance(c2)
3.5
```

Tangent and outside each other:

```
>>> let c1 = Circle([0 0], 1);
>>> let c2 = Circle([2 0], 1);
>>> c1.inversiveDistance(c2)
1
```

Intersecting:

```
>>> let c1 = Circle([0 0], 1);
>>> let c2 = Circle([1 0], 1);
>>> c1.inversiveDistance(c2)
-0.5
```

Intersecting at right angles:

```
>>> let c1 = Circle([5 0], 4);
>>> let c2 = Circle([0 0], 3);
>>> c1.inversiveDistance(c2)
0
```

Tangent and one inside the other:

```
>>> let c1 = Circle([0 0], 1);
>>> let c2 = Circle([-0.5 0], 0.5);
>>> c1.inversiveDistance(c2)
-1
```

Interior circle:

```
>>> let c1 = Circle([0 0], 1);
>>> let c2 = Circle([0 0], 0.5);
>>> c1.inversiveDistance(c2)
-1.25
```

* * *

See also: inversiveDistanceDelta

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InversiveDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Inversive_distance)
