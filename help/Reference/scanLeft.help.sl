# scanLeft

- _scanLeft(aSequence, aBlock:2)_

_scanLeft_ is similar to _foldLeft_, but answers a list of each successive reduced value from the left.

```
>>> [1 .. 4].scanLeft(+)
[1 3 6 10]

>>> [].scanLeft(+)
[]

>>> 1:4.scanLeft(-)
[1 -1 -4 -8]

>>> [1, 1 - 2, (1 - 2) - 3, ((1 - 2) - 3) - 4]
[1 -1 -4 -8]

>>> 1:5.scanLeft(-.swap)
[1 1 2 2 3]

>>> [true false true true].scanLeft(&&)
[true false false false]

>>> [false false true true].scanLeft(||)
[false false true true]

>>> ['1' '2' '3' '4'].scanLeft(++)
['1' '12' '123' '1234']
```

* * *

See also: reduce, scan, scanLeftAssociatingRight, scanRight

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl1)

Categories: Enumerating
