# foldRight

- _foldRight([x₁ x₂ …], f:/2)_

Reduce from right to left.

At `Range`:

```
>>> 1:7.foldRight(-)
4

>>> 1 - (2 - (3 - (4 - (5 - (6 - 7)))))
4

>>> 1:4.foldRight(-)
-2

>>> 1 - (2 - (3 - 4))
-2
```

At `List`:

```
>>> [1 2 3 4 5].foldRight(/)
1 / (2 / (3 / (4 / 5)))

>>> [1 .. 4].foldRight(+)
10
```

At the empty list:

```
>>> {
>>> 	[].foldRight(+)
>>> }.hasError
true
```

At `List` of `Boolean`:

```
>>> [true false true true].foldRight(&&)
false

>>> [false false true true].foldRight(||)
true
```

* * *

See also: foldLeft, reduce

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldr1)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldr)

Categories: Enumerating
