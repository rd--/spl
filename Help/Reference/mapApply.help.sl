# mapApply

- _mapApply(f:/n, c)_

Apply _f_ to each element of the collection _c_.

Compute the angles with respect to the positive _x_ axis for a list of ordered pairs:

```
>>> arcTan:/2.mapApply(
>>> 	[1 1; -1 1; -1 -1; 1 -1]
>>> )
[1/4 3/4 -3/4 -1/4].pi
```

Apply `^` to each factor of _20!_:

```
>>> 20.!.factorInteger
[2 18; 3 8; 5 4; 7 2; 11 1; 13 1; 17 1; 19 1]

>>> ^.mapApply(
>>> 	20.!.factorInteger
>>> )
[262144 6561 625 49 11 13 17 19]
```

* * *

See also: apply, collect, map

Guides: Collection Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MapApply.html)
