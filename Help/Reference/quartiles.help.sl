# quartiles

- _quartiles(aCollection, a, b, c, d)_
- _quartiles(alpha)_ ⟹ _quartiles(alpha, 1 / 2, 0, 0, 1)_

Answer the (1/4, 1/2, 3/4) quantile estimates of the elements in _aCollection_.

Quartiles for a list of exact numbers:

```
>>> [1 3 4 2 5 6].quartiles
[2 3.5 5]
```

Exact input yields exact output:

```
>>> 1:4.quartiles
[3/2 5/2 7/2]
```

Compute results using other parametrizations:

```
>>> [-1 5 10 4 25 2 1].quartiles
[5/4 4 35/4]

>>> [-1 5 10 4 25 2 1].quartiles(0, 0, 1, 0)
[1 4 10]
```

* * *

See also: quantile

Guides: Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Quartile.html)
[2](https://reference.wolfram.com/language/ref/Quartiles.html)

Categories: Statistics
