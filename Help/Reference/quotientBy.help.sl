# quotientBy

- _quotientBy(aNumber, anotherNumber, aBlock:/1)_

Integer quotient defined by division with rounding defered to _aBlock_.

```
>>> -8.quotientBy(7, truncated:/1)
-1

>>> -8.quotientBy(7, floor:/1)
-2
```

`quotient` is `quotientBy` of `truncated`:

```
>>> 8 // 7
1

>>> -8 // 7
-1
```

* * *

See also: //, quotient, remainderBy

Categories: Math, Arithmetic
