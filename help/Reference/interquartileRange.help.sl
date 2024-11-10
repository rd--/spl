# interquartileRange

- _interquartileRange(aCollection)_

Answer the difference between the upper and lower quartiles for the elements in _aCollection_.

Interquartile range for a list of exact numbers:

```
>>> [1 3 4 2 5 6].interquartileRange
3
```

Exact input yields exact output:

```
>>> 1:4.interquartileRange
2
```

At `SmallFloat`:

```
>>> [pi e 2].interquartileRange
(3 / 4 * (-2 + pi))
```

Compute results using other parametrizations:

```
>>> [-1 5 10 4 25 2 1].interquartileRange
15/2

>>> [-1 5 10 4 25 2 1].interquartileRange(0, 0, 1, 0)
9
```

* * *

See also: quartiles

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InterquartileRange.html)
[2](https://reference.wolfram.com/language/ref/InterquartileRange.html)
