# intercalate

- _intercalate(aSequence, anotherSequence)_

Answer a `List` that has the elements of _aSequence_ with the elements of _anotherSequence_ between each.

```
>>> [3 4 5].intercalate([1 2])
[3 1 2 4 1 2 5]
```

With only one element intercalted:

```
>>> [3 4 5].intercalate([-1])
[3 -1 4 -1 5]
```

At one element list:

```
>>> [0].intercalate([-1])
[0]
```

At empty list:

```
>>> [].intercalate([-1])
[]
```

* * *

See also: intersperse, interleave, riffle, transpose

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:intercalate)

Categories: Rearranging
