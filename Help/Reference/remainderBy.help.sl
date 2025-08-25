# remainderBy

- _remainderBy(aNumber, anotherNumber, aBlock:/1)_

Integer remainder defined by division with rounding defered to _aBlock_.

```
>>> -8.remainderBy(7, truncate:/1)
-1

>>> -8.remainderBy(7, floor:/1)
6
```

`remainder` is `remainderBy` of `truncate` (rounds toward `zero`).

```
>>> 8 \\ 7
1

>>> -8 \\ 7
-1
```

_Rationale_:
J implements remainder as using the `floor` form.
Julia implements remainder with an optional parameter to set the rounding mode.

* * *

See also: \\, quotientBy, remainder

Categories: Math, Arithmetic
