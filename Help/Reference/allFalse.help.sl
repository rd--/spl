# allFalse

- _allFalse(aCollection)_

Answer `true` if all items in _aCollection_ are `false`, else `false`.

```
>>> ([1 3 5 7 9] > [3 5 7 9 11]).allFalse
true
```

This is equivalent to `noneSatisfy` of `identity`:

>>> ([1 3 5 7 9] > [3 5 7 9 11])
>>> .noneSatisfy(identity:/1)
true
```

The empty list always answers `true`:

```
>>> [].allFalse
true
```

* * *

See also: allSatisfy, anySatisfy, allTrue, anyFalse, noneSatisfy

Guides: Boolean Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Nor.html),

Categories: Testing
