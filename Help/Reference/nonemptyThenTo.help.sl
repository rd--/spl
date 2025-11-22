# nonemptyThenTo

- _nonemptyThenTo(i, j, k)_

A variant of `thenTo` that disallows empty range values.

A nonempty range:

```
>>> 4.nonemptyThenTo(2, -6)
>>> .asList
[4 2 0 -2 -4 -6]
```

Disallowed empty range:

```
>>> {
>>> 	6.nonemptyThenTo(8, 2)
>>> }.hasError
true

>>> 6.thenTo(8, 2).asList
[]
```

* * *

See also: nonemptyRange, thenTo

Guides: Range Syntax, Range Literal Syntax
