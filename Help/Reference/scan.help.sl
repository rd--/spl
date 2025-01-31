# scan

- _scan(aSequence, aBlock:2)_

Similar to `reduce` but answer a sequence of successive reduced values.
Just as `reduce` is an alias for `foldLeft`, `scan` is an alias for `scanLeft`.

At empty `List`:

```
>>> [].scan(+)
[]
```

At unary `List`:

```
>>> [1].scan(+)
[1]
```

Prefix sums, c.f. `accumulate`:

```
>>> 1:5.scan(+)
[1 3 6 10 15]

>>> 1:5.accumulate
[1 3 6 10 15]
```

`scan` is equivalent to `foldList` with the initial value being the first item and the process beginning at the second:

```
>>> 3:7.scan(*)
[3 12 60 360 2520]

>>> 4:7.foldList(3, *)
[3 12 60 360 2520]
```

The last entry of a `scan` is the answer to `reduce`:

```
>>> 1:5.scan(+).last
1:5.reduce(+)

>>> 1:5.scan(*).last
1 * 2 * 3 * 4 * 5
```

* * *

See also: accumulate, foldLeft, foldList, foldRight, reduce, scanLeft, scanRight

References:
_Apl_
[1](https://aplwiki.com/wiki/Scan),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl1)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=reduce),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FoldList.html)

Categories: Enumerating
