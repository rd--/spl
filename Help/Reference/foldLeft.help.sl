# foldLeft

- _foldLeft([x₁ x₂ …], f:/2)_

Reduce from left to right.

At `Range`:

```
>>> 1:7.foldLeft(-)
-26

>>> (
>>> 	(
>>> 		(
>>> 			(
>>> 				(
>>> 					1 - 2
>>> 				) - 3
>>> 			) - 4
>>> 		) - 5
>>> 	) - 6
>>> ) - 7
-26


>>> 1:4.foldLeft(-)
((1 - 2) - 3) - 4
```

At `List`:

```
>>> [1 2 3 4 5].foldLeft(/)
(((1 / 2) / 3) / 4) / 5

>>> [1 .. 4].foldLeft(+)
10
```

At the empty list:

```
>>> {
>>> 	[].foldLeft(+)
>>> }.hasError
true
```

At list of boolean:

```
>>> [true false true true]
>>> .foldLeft(&&)
false

>>> [false false true true]
>>> .foldLeft(||)
true
```

* * *

See also: foldRight, reduce

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldl1)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldl)

Categories: Enumerating
