# foldLeft

- _foldLeft(aSequence, aBlock:/2)_

Reduce from left to right.

```
>>> [1 .. 7].foldLeft(-)
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

>>> [1 2 3 4 5].foldLeft(/)
((((1 / 2) / 3) / 4) / 5)

>>> [1 .. 4].foldLeft(+)
10

>>> {
>>> 	[].foldLeft(+)
>>> }.ifError { true }
true

>>> [1 .. 4].foldLeft(-)
-8

>>> [true false true true]
>>> .foldLeft(&&)
false

>>> [false false true true]
>>> .foldLeft(||)
true
```

* * *

See also: foldRight, reduce

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldl1)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:foldl)

Categories: Enumerating
