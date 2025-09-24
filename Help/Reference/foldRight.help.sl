# foldRight

- _foldRight([x₁ x₂ …], f:/2)_

Reduce from right to left.

```
>>> [1 .. 9].foldRight(-)
5

>>> 1 - (2 - (3 - (4 - (5 - (6 - (7 - (8 - 9)))))))
5

>>> [1 2 3 4 5].foldRight(/)
(1 / (2 / (3 / (4 / 5))))

>>> [1 .. 4].foldRight(+)
10

>>> {
>>> 	[].foldRight(+)
>>> }.hasError
true

>>> [1 .. 4].foldRight(-)
-2

>>> [true false true true].foldRight(&&)
false

>>> [false false true true].foldRight(||)
true
```

* * *

See also: foldLeft, reduce

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldr1)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldr)

Categories: Enumerating
