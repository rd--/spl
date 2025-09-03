# ifNotNil

- _ifNotNil(x, f:/1, g:/0)_

Conditional evaluation.
If the object _x_ is not `nil` answer the result of _f(x)_,
else answer _g()_,
or in the binary case `nil`.

```
>>> 23.ifNotNil { :x | x }
23

>>> nil.ifNotNil { :x | 23 }
nil

>>> nil.ifNotNil { :x | nil } { 23 }
23
```

* * *

See also: if, ifEmpty, ifFalse, ifNil, ifTrue, nil, Nil

Guides: Control Functions

Categories: Evaluating
