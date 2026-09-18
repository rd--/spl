# naturalCompare

- _naturalCompare(s₁, s₂)_

Compare two strings using natural sort order.
Embedded numbers are sorted numericallly.

```
>>> naturalCompare('1', '10')
-1

>>> naturalCompare('23.x', '2.x')
1
```

Sort a list:

```
>>> '11 9 1 3 12 5 2 0 17 23'
>>> .words
>>> .sortComparing(naturalCompare/2)
>>> .unwords
'0 1 2 3 5 9 11 12 17 23'
```

* * *

See also: compare, localeCompare, naturalSort, sortComparing

Guides: Sorting Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Natural_sort_order)
