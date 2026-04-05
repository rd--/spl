# isPerfectDifferenceSet

- _isPerfectDifferenceSet([n₁ n₂ …], m)_

Answer `true` if the set _n_ is a perfect difference set modulo _m_.
A set of positive integers is a perfect difference set if every nonzero integer has an unique representation as the difference of two elements.

_1,2,4_ is a is perfect difference set modulo seven:

```
>>> [1 2 4].isPerfectDifferenceSet(7)
true

>>> [0 1 3].isPerfectDifferenceSet(7)
true
```

_1,2,5,7_ is a is perfect difference set modulo thirteen:

```
>>> [1 2 5 7].isPerfectDifferenceSet(13)
true

>>> [0 1 4 6].isPerfectDifferenceSet(13)
true
```

_0,1,4,14,16_ is a is perfect difference set modulo twenty-one:

```
>>> [0 1 4 14 16].isPerfectDifferenceSet(21)
true
```

* * *

See also: %, mod, optimalGolombRulers, tuples

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PerfectDifferenceSet.html),
_W_
[1](https://en.wikipedia.org/wiki/Projective_plane)
