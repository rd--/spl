# keesSemiHeight

- _keesSemiHeight(aFraction)_

Kees semi-height function.
The maximum of the `numerator` and `denominator` of _aFraction_ with any factors of two deleted.

```
>>> 15/14.keesSemiHeight
15

>>> 15/7.keesSemiHeight
15
```

Threads over lists:

```
>>> [1/1 2/1 3/2 5/4 7/4 6/5 9/7 13/11].collect(keesSemiHeight:/1)
[1 1 3 5 7 5 9 13]

>>> let r = [
>>> 	7/4 7/5  7/6  8/7   5/3   8/5   5/4   6/5 4/3 3/2
>>> 	2/1 9/5 10/9 15/14 28/15 25/26 27/25 25/24
>>> ];
>>> r.collect(keesSemiHeight:/1)
[
	7 7 7  7  5  5  5  5 3 3
	1 9 9 15 15 25 27 25
]
```

* * *

See also: keesSemiHeight, withoutFactorsOfTwo

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Kees_semi-height)

Categories: Tuning

