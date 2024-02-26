# scan

- _scan(aSequence, aBlock:2)_

Similar to `reduce` but answer a sequence of successive reduced values.
Just as `reduce` is an alias for `foldLeft`, `scan` is an alias for `scanLeft`.

```
>>> [].scan(+)
[]

>>> [1].scan(+)
[1]

>>> 1:5.scan(+)
[1 3 6 10 15]

>>> 1:5.reduce(+)
15
```

* * *

See also: foldLeft, foldRight, reduce, scanLeft, scanRight

References:
_Apl_
[1](https://aplwiki.com/wiki/Scan),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl1)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=reduce)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FoldList.html)

Categories: Enumerating
