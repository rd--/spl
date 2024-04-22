# additivePersistence

- _additivePersistence(x, b)_

The number of additions required to obtain the `digitalRoot` of _x_ in base _b_.

```
>>> 9876.additivePersistence(10)
2

>>> 3110.additivePersistence(12)
2
```

The additive persistences of the first few positive integers:

```
>>> 1:20.collect { :n | n.additivePersistence(10) }
[0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 2 1]
```

* * *

See also: digitalRoot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AdditivePersistence.html),
_OEIS_
[1](https://oeis.org/A031286)
