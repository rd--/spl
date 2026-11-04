# ifNil

- _ifNil(x, f/0, g/0={x})_

Conditional evaluation.
If the object _x_ is `nil` answer the result of _f()_,
else answer _g()_,
or in the binary case _x_.

Binary cases:

```
>>> 1.ifNil { '?'.error }
1

>>> nil.ifNil { true }
true

>>> 1 ? { 2 }
1

>>> nil ? { 2 }
2
```

Ternary cases:

```
>>> let x = 1;
>>> x.ifNil { '?'.error } { x + 1 }
2

>>> let x = 1;
>>> x.ifNil { '?'.error } + 1
2

>>> nil.ifNil { true } { nil }
true

>>> nil.ifNil { true }
true
```

* * *

See also: Nil, ?, if, ifEmpty, ifFalse, ifNaN, ifNotNil, ifTrue, nil

Guides: Control Functions
