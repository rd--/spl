# noneTrue

- _noneTrue(aCollection)_

Answer `true` if no items in _aCollection_ are `true`, else `false`.
This is another name for `allFalse`.

```
>>> ([1 3 5] > [3 5 7]).noneTrue
true

>>> ([1 3 5 7 9] < [3 5 7 9 1]).noneTrue
false
```

The empty list always answers `true`:

```
>>> [].noneTrue
true
```

* * *

See also: allFalse, allTrue, anyTrue, noneSatisfy

Guides: Boolean Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NoneTrue.html)

Categories: Testing
