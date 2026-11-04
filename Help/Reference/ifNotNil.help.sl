# ifNotNil

- _ifNotNil(x, f/0, g/0={nil})_

Conditional evaluation.
If the object _x_ is not `nil` answer the result of _f()_,
else answer _g()_,
or in the binary case `nil`.

```
>>> 23.ifNotNil { 23 }
23

>>> 23.ifNotNil { 23 } { nil }
23

>>> nil.ifNotNil { 23 }
nil

>>> nil.ifNotNil { nil } { 23 }
23
```

* * *

See also: Nil, if, ifEmpty, ifFalse, ifNil, ifTrue, nil

Guides: Control Functions
