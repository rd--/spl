# allTrue

- _allTrue(c)_

Answer `true` if all items in the collection _c_ are `true`, else `false`.
This is equal to the unary form of `&&`.

```
>>> ([1 3 5 7 9] < [3 5 7 9 11]).allTrue
true

>>> ([1 3 5 7 9] < [3 5 7 9 11]).&&
true
```

The empty list always answers `true`:

```
>>> [].allTrue
true
```

* * *

See also: allSatisfy, anySatisfy, anyTrue, noneSatisfy

Guides: Boolean Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AllTrue.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#all)

Categories: Testing
