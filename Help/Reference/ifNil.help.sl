# ifNil

- _ifNil(x, f:/0, g:/1)_

Conditional evaluation.
If the object _x_ is `nil` answer the result of _f_,
else answer _g(x)_,
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
>>> 1.ifNil { '?'.error } { :x | x + 1 }
2

>>> nil.ifNil { true } { nil }
true
```

* * *

See also: if, ifEmpty, ifFalse, ifNotNil, ifTrue, nil, Nil

Guides: Control Functions

Categories: Evaluating
