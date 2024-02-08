# suffixes

_suffixes(aSequence)_

Answer a List of all of the suffixes of _aSequence_.

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

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:tails),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bslashdot)
