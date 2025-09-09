# suffixes

- _suffixes([x₁ x₂ …])_

Answer a `List` of all of the suffixes of the sequence _x_.

```
>>> [1 2 3].suffixes
[1 2 3; 2 3; 3]

>>> [3 1 4 1 5 9].suffixes.collect(sum:/1)
[23 20 19 15 14 9]

>>> 1:9.suffixes.collect(sum:/1)
[45 44 42 39 35 30 24 17 9]
```

* * *

See also: prefixes

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:tails),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bslashdot)
