# ifNotEmpty

- _ifNotEmpty(c, f/0, g/0={})_

Conditional evaluation.
If the collection _c_ is not empty,
answer the result of _f()_,
else answer _g()_.
If _g_ is elided answer `nil`.

```
>>> let a = [];
>>> a.ifNotEmpty { a.sqrt }
nil

>>> let a = [1 4 9 16 25];
>>> a.ifNotEmpty { a.sqrt }
[1 2 3 4 5]

>>> let a = [1 2 3];
>>> let b = a.ifNotEmpty {
>>> 	a[2] := -2
>>> };
>>> (a, b)
([1 -2 3], -2)
```

* * *

See also: if, ifEmpty, ifFalse, ifNil, ifNotNil, ifTrue, size

Guides: Collection Functions, Control Functions
