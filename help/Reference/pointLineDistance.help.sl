# pointLineDistance

- _pointLineDistance(aLine, aPoint)_

Answer the distance from _aLine_ to _aPoint_.

```
>>> [1 3 -1; 3 6 0].pointLineDistance([-2 4 -3])
171/14.sqrt

>>> [0 5/4 0; 5/2 0 0].pointLineDistance([-3 2 0])
(3 / (2 * 5.sqrt))

>>> [0 3/2 0; 2 0 0].pointLineDistance([0 0 0])
6/5

>>> [6 0 0; 6 6 0].pointLineDistance([1 3 0])
5

>>> [-10 0 0; 0 -5 0].pointLineDistance([3 1 0])
(3 * 5.sqrt)

>>> [2 1 0; 3 6 9].pointLineDistance([3 5 6])
(4922.sqrt / 107)
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Point-LineDistance3-Dimensional.html)
