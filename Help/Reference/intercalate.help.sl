# intercalate

- _intercalate([x₁ x₂ …], [y₁ y₂ …])_

Answer a `List` that has the elements of the sequence _x_ with the elements of another sequence _y_ between each.

```
>>> [3 4 5].intercalate([1 2])
[3 1 2 4 1 2 5]
```

With only one element intercalated:

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

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:intercalate)

Categories: Rearranging
