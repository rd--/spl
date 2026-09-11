# nonEmptyThenTo

- _nonEmptyThenTo(i, j, k)_

A variant of `thenTo` that disallows empty range values.

A non-empty range:

```
>>> 4.nonEmptyThenTo(2, -6)
>>> .asList
[4 2 0 -2 -4 -6]
```

Disallowed empty range:

```
>>> {
>>> 	6.nonEmptyThenTo(8, 2)
>>> }.hasError
true

>>> 6.thenTo(8, 2).asList
[]
```

* * *

See also: nonEmptyRange, thenTo

Guides: Range Syntax, Range Literal Syntax
