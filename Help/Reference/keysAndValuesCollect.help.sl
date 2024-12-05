# keysAndValuesCollect

- _keysAndValuesCollect(aDictionary, aBlock:/2)_

Like `keysAndValuesDo` except that the answers are collected into a new dictionary.

At `Record`:

```
>>> (x: 1, y: 2, z: 3).keysAndValuesCollect { :each :index |
>>> 	each -> index
>>> }
(x: 1 -> 'x', y: 2 -> 'y', z: 3 -> 'z')
```

* * *

See also: do, collect, keysAndValuesDo, withIndexCollect

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/iterators/#Base.Iterators.enumerate)

Categories: Enumerating
