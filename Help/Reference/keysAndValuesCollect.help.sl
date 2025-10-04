# keysAndValuesCollect

- _keysAndValuesCollect(d, f:/2)_

Collect over the keys and values of the dictionary _d_ usinf the block _f_.
Like `keysAndValuesDo` except that the answers are collected into a new dictionary.

At `Record`:

```
>>> (x: 1, y: 2, z: 3)
>>> .keysAndValuesCollect { :key :value |
>>> 	value -> key
>>> }
(x: 1 -> 'x', y: 2 -> 'y', z: 3 -> 'z')
```

* * *

See also: do, collect, keysAndValuesDo, withIndexCollect

Guides: Dictionary Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/iterators/#Base.Iterators.enumerate)

Categories: Enumerating
