# nonEmptyRange

- _nonEmptyRange(i, j, k=1)_

Answer the specified `Range` if it is non-empty,
else signal an `error`.

A non-empty range:

```
>>> nonEmptyRange(1, 9, 1)
Range(1, 9)
```

An error:

```
>>> {
>>> 	nonEmptyRange(9, 1, 1)
>>> }.hasError
true
```

Nested ranges:

```
>>> nonEmptyRange(1, [1 .. 5], 1)
[1:1 1:2 1:3 1:4 1:5]
```

Rationale:
The spelling assumes the word is written _non-empty_,
not _nonempty_.

* * *

See also: Range

Guides: Range Syntax, Range Literal Syntax
