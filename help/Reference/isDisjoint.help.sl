# isDisjoint

- _isDisjoint(aCollection, anotherCollection)_

Answer `true` if the intersection of two collections is empty, else `false`.

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

See also: intersection

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DisjointSets.html)
[2](https://reference.wolfram.com/language/ref/DisjointQ.html)

Categories: Testing
