# anyTrue

- _anyTrue(aCollection)_

Answer `true` if any items in _aCollection_ are `true`, else `false`.

```
>>> ([1 3 5 7 9] > [3 5 7 9 1]).anyTrue
true
```

The empty list always answers `false`:

```
>>> [].anyTrue
false
```

* * *

See also: allSatisfy, allTrue, anySatisfy, noneSatisfy

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AnyTrue.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#any)

Categories: Testing
