# isDisjoint

- _isDisjoint(c₁, c₂)_

Answer `true` if the intersection of the two collections _c₁_ and _c₂_ is empty, else `false`.

Two lists that do not intersect:

```
>>> [1 2 3].isDisjoint([4 5 6])
true
```

Two ranges that do intersect:

```
>>> 1:5.isDisjoint(4:9)
false
```

* * *

See also: isIntersecting, noneSatisfy, intersection

Guides: Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DisjointSets.html)
[2](https://reference.wolfram.com/language/ref/DisjointQ.html)

Categories: Testing
