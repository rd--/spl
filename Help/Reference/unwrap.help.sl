# unwrap

- _unwrap(l, period)_

Unwrap the list _l_ by taking the complement of large deltas with respect to the _period_,
replacing items having an absolute difference from their predecessor of more than _period/2_ with their _period_-complementary value.

```
>>> ([0 1 2 7 8] / 4).pi.unwrap(2.pi)
([0 1 2 -1 0] / 4).pi

>>> [0 1 2 7 8].unwrap(8)
[0 1 2 -1 0]

>>> [0 1 2 -1 0].unwrap(4)
[0 1 2 3 4]

>>> [1 2 3 4 5 6 1 2 3].unwrap(6)
[1 2 3 4 5 6 7 8 9]

>>> [2 3 4 5 2 3 4 5].unwrap(4)
[2 3 4 5 6 7 8 9]

>>> (([0, 40 .. 720] % 360) - 180)
>>> .unwrap(360)
[-180, -140 .. 540]
```

* * *

See also: %, differences

References:
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.unwrap.html)
