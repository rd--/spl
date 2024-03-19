# thenTo

- _thenTo(start, then, stop)_

Construct a `Range` by counting up or down from _start_ to _then_ through until _stop_.

```
>>> 1.thenTo(3, 9).asList
[1 3 5 7 9]

>>> 9.thenTo(7, 1).asList
[9 7 5 3 1]

>>> 4.thenTo(2, -6).asList
[4 2 0 -2 -4 -6]
```

If _then_ is in the wrong direction to arrive at _stop_, the `Range` is empty:

```
>>> 6.thenTo(8, 2).asList
[]
```

* * *

See also: Range, Range Syntax, to, toBy, upOrDownTo

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:enumFromThenTo)

Categories: Interval, Range, Type
