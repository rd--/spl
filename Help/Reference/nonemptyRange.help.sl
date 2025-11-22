# nonemptyRange

- _nonemptyRange(i, j, k)_

Answer the specified `Range` if it is non-empty,
else signal an `error`.

A non-empty range:

```
>>> nonemptyRange(1, 9, 1)
Range([1 9 1])
```

An error:

```
>>> {
>>> 	nonemptyRange(9, 1, 1)
>>> }.hasError
true
```

* * *

See also: Range

Guides: Range Syntax, Range Literal Syntax
