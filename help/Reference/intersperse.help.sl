# intersperse

- _intersperse(aSequence, anObject)_

Answer a `List` that has the elements of _aSequence_ with _anObject_ between each.

```
>>> [3 4 5].intersperse(1)
[3 1 4 1 5]
```

Insert zeroes between successive integers:

```
>>> 1:10.intersperse(0)
[1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10]
```

* * *

See also: intercalate, interleave, transposed

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:intersperse),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Riffle.html)
