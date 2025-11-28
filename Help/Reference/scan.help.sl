# scan

- _scan([x₁ x₂ …], f:2)_

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

>>> 1:5.scan(*)
[1 2 6 24 120]

>>> 1:5.scan(*).last
1 * 2 * 3 * 4 * 5
```

Compute the cummulative product:

```
>>> 1:9.scan(*)
[1 2 6 24 120 720 5040 40320 362880]
```

Compute running minimum or maximum:

```
>>> [3 4 6 2 1 9 0 7 5 8].scan(min:/2)
[3 3 3 2 1 1 0 0 0 0]

>>> [3 4 6 2 1 9 0 7 5 8].scan(max:/2)
[3 4 6 6 6 9 9 9 9 9]

>>> [3 2 1 2 1 0 4 3 2].scan(min:/2)
[3 2 1 1 1 0 0 0 0]

>>> [3 2 1 2 1 0 4 3 2].scan(max:/2)
[3 3 3 3 3 3 4 4 4]
```

* * *

See also: accumulate, foldLeft, foldList, foldRight, reduce, scanLeft, scanRight

Guides: List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Scan),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl1)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=reduce),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FoldList.html),
_Python_
[1](https://docs.python.org/3/library/itertools.html#itertools.accumulate)
[2](https://numpy.org/doc/stable/reference/generated/numpy.ufunc.accumulate.html)

Categories: Enumerating
