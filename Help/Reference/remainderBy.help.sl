# remainderBy

- _remainderBy(m, n, f:/1)_

Integer remainder defined by division with rounding defered to the unary block _f_.

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

Guides: Mathematical Functions

Categories: Math, Arithmetic
