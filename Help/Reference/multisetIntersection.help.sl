# multisetIntersection

- _multisetIntersection([m₁ m₂ …])_

Answer the multiset intersection of _m_.

```
>>> [1 1 2 3; 3 1 1 1 4; 4 1 1 3 3]
>>> .multisetIntersection
[1 1 3].asMultiset
```

If there is no intersection, the result is empty:

```
>>> [1 2 2 3; 4 5 6 6]
>>> .multisetIntersection
[].asMultiset
```

Compare to `setIntersection` and `intersection`:

```
>>> [1 2 1 4 4; 4 1 4 5 4; 3 4 1 4]
>>> .multisetIntersection
[1 4 4].asMultiset

>>> [1 2 1 4 4; 4 1 4 5 4; 3 4 1 4]
>>> .setIntersection
[1 4].asSet

>>> [1 2 1 4 4; 4 1 4 5 4; 3 4 1 4]
>>> .intersection
[1 1 4 4]
```

* * *

See also: intersection, union

Guides: Set Functions
