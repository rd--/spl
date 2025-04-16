# noneTrue

- _noneTrue(aCollection)_

Answer `true` if no items in _aCollection_ are `true`, else `false`.

```
>>> ([1 3 5] > [3 5 7]).noneTrue
true

>>> ([1 3 5 7 9] > [3 5 7 9 1]).noneTrue
true
```

The empty list always answers `true`:

```
>>> [].noneTrue
true
```

* * *

See also: allTrue, anyTrue, noneSatisfy

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NoneTrue.html)

Categories: Testing
