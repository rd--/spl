# scanLeft

- _scanLeft([x₁ x₂ …], f/2)_

`scanLeft` is similar to `foldLeft`,
but answers a list of each successive reduced value from the left.
`scan` is an alias for `scanLeft`.

The binary form is an _inclusive_ scan:

```
>>> [1 .. 6].scanLeft(+)
[1 3 6 10 15 21]

>>> [1 2 1 3 1 2].scanLeft(+)
[1 3 4 7 8 10]

>>> [3 1 4 1 5 9 2 6].scanLeft(+)
[3 4 8 9 14 23 25 31]

>>> [3 1 4 1 5 9 2 6].scanLeft(*)
[3 3 12 12 60 540 1080 6480]
```

The ternary form is an _exclusive_ scan:

```
>>> [1 .. 6].scanLeft(+, 0)
[0 1 3 6 10 15]

>>> [3 1 4 1 5 9 2 6].scanLeft(+, 0)
[0 3 4 8 9 14 23 25]

>>> [3 1 4 1 5 9 2 6].scanLeft(*, 1)
[1 3 3 12 12 60 540 1080]
```

Compare the ternary form to `foldList`:

```
>>> [1 .. 6].foldList(0, +)
[0 1 3 6 10 15 21]

>>> [3 1 4 1 5 9 2 6].foldList(0, +)
[0 3 4 8 9 14 23 25 31]
```

At the empty list:

```
>>> [].scanLeft(+)
[]
```

At `Range` with operator `-`:

```
>>> 1:4.scanLeft(-)
[1 -1 -4 -8]

>>> [1, 1 - 2, (1 - 2) - 3, ((1 - 2) - 3) - 4]
[1 -1 -4 -8]
```

At `Range` with operator `swap` of `-`:

```
>>> 1:5.scanLeft(-.swap)
[1 1 2 2 3]
```

At `List` with logic operators `&&` and `||`:

```
>>> [true false true true].scanLeft(&&)
[true false false false]

>>> [false false true true].scanLeft(||)
[false false true true]
```

At `List` with operator `catenate`:

```
>>> ['1' '2' '3' '4'].scanLeft(++)
['1' '12' '123' '1234']
```

* * *

See also: foldList, reduce, scan, scanLeftAssociatingRight, scanRight

Guides: List Functions

References:
_Cpp_
[1](https://en.cppreference.com/cpp/algorithm/inclusive_scan)
[2](https://en.cppreference.com/cpp/algorithm/exclusive_scan),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl1),
_W_
[1](https://en.wikipedia.org/wiki/Prefix_sum)

Categories: Enumerating
