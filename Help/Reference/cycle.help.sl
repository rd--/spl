# cycle

- _cycle([x₁ x₂ …], n=∞)_

In the unary case,
answer an infinite `Stream` that cycles though the values of _x_.

```
>>> [1 2 3].cycle.next!(12)
[1 2 3 1 2 3 1 2 3 1 2 3]
```

In the binary case answer a `List` of the first _n_ items:

```
>>> [1 2 3].cycle(12)
[1 2 3 1 2 3 1 2 3 1 2 3]
```

At `Stream`,
extend the stream cyclically indefinitely:

```
>>> Stream[1 2 3].cycle.next!(12)
[1 2 3 1 2 3 1 2 3 1 2 3]
```

* * *

See also: List, Stream, duplicate, duplicateEach, repeat, replicate

Guides: List Functions, Stream Functions

References:
_Haskell_
[1](https://hackage-content.haskell.org/package/base/docs/Data-List.html#v:cycle)
