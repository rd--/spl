# isIntersecting

- _isIntersecting(c₁, c₂)_

Answer `true` if the union of the two collections _c₁_ and _c₂_ is not empty, else `false`.

Two lists that do not intersect:

```
>>> [1 2 3].isIntersecting([4 5 6])
false

>>> [4 5 6].isIntersecting([1 2 3])
false
```

Two ranges that do intersect:

```
>>> 1:5.isIntersecting(4:9)
true

>>> 4:9.isIntersecting(1:5)
true
```

* * *

See also: anySatisfy, complement, intersection, isDisjoint, union

Guides: Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IntersectingQ.html)

Categories: Testing
