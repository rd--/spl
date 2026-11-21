# quotientBy

- _quotientBy(i, j, f/1)_

Integer quotient defined by division with rounding defered to _f_.

```
>>> -8.quotientBy(7, truncate/1)
-1

>>> -8.quotientBy(7, floor/1)
-2
```

`quotient` is `quotientBy` of `truncate`:

```
>>> 8 // 7
1

>>> -8 // 7
-1
```

* * *

See also: //, quotient, remainderBy

Categories: Math, Arithmetic
