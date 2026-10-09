# thenTo

- _thenTo(i, j, k)_

Construct a `Range` by counting up or down from the start value _i_,
first to _j_,
then through until stop value _k_.

```
>>> 1.thenTo(3, 9).List
[1 3 5 7 9]

>>> 9.thenTo(7, 1).List
[9 7 5 3 1]

>>> 4.thenTo(2, -6).List
[4 2 0 -2 -4 -6]
```

If _j_ is in the wrong direction to arrive at _k_,
the `Range` is empty:

```
>>> 7.thenTo(9, 3).List
[]

>>> 5.thenTo(3, 9).List
[]
```

* * *

See also: Range, to, toBy, upOrDownTo

Guides: Range Functions, Range Syntax

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:enumFromThenTo)

Categories: Interval, Range, Type
