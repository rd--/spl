# cycle

- _cycle([x₁ x₂ …], n=∞)_

In the unary case,
answer an infinite `Stream` that cycles though the values of _x_.

```
>>> [1 2 3].cycle.next(12)
[1 2 3 1 2 3 1 2 3 1 2 3]
```

In the binary case,
answer a `List` of the sequence _x_ repeated _n_ times:

```
>>> [1 2 3].cycle(4)
[1 2 3 1 2 3 1 2 3 1 2 3]
```

Note relation to `recycle` for vectors:


```
>>> [1 2 3].cycle(3)
[1 2 3 1 2 3 1 2 3 1 2 3]

>>> [1 2 3].recycle([9])
[1 2 3 1 2 3 1 2 3 1 2 3]
```

At `Stream`,
extend the stream cyclically indefinitely:

```
>>> Stream[1 2 3].cycle.next(12)
[1 2 3 1 2 3 1 2 3 1 2 3]
```

* * *

See also: List, Stream, duplicate, duplicateEach, recycle, repeat, replicate

Guides: List Functions, Stream Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:cycle)
