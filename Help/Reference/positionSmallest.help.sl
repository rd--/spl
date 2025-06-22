# positionSmallest

- _positionSmallest([x₁ x₂ …])_
- _positionSmallest([x₁ x₂ …], n)_

Answer the positions of the smallest,
or the _n_ smallest,
values in _x_.

Find positions of the smallest value in a list:

```
>>> [100 200 100 200 50 40 110]
>>> .positionSmallest
[6]
```

Get lists of positions for the three smallest values:

```
>>> [100 200 100 200 50 40 110]
>>> .positionSmallest(3)
[6; 5; 1 3]
```

* * *

See also: indicesOf, min, minimalBy, positionLargest, sorted

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PositionSmallest.html)
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.argmin.html)
