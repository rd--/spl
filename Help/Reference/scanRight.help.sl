# scanRight

- _scanRight([x₁ x₂ …], f:2)_

`scanRight` is the right-to-left dual of `scanLeft`.
Note that the order of parameters on the accumulating function are reversed compared to `scanLeft`.

```
>>> [1 .. 4].scanRight(+)
[10 9 7 4]

>>> [].scanRight(+)
[]

>>> [1 .. 4].scanRight(-)
[-2 3 -1 4]

>>> [1 - (2 - (3 - 4)), 2 - (3 - 4), 3 - 4, 4]
[-2 3 -1 4]

>>> 1:5.scanRight(-.swap)
[-5 -4 -2 1 5]

>>> [true false true true].scanRight(&&)
[false false true true]

>>> [true true false false].scanRight(||)
[true true false false]

>>> ['1' '2' '3' '4'].scanRight(++)
['1234' '234' '34' '4']
```

* * *

See also: reduce, scan

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanr1)

Categories: Enumerating
