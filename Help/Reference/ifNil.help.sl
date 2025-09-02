# ifNil

- _ifNil(anObject, whenNil:/0)_
- _ifNil(anObject, whenNil:/0, whenNotNil:/1)_

Conditional evaluation.
If _anObject_ is `nil` answer the result of _whenNil_,
else answer _whenNotNil(anObject)_,
or in the binary case _anObject_.

Binary cases:

```
>>> 1.ifNil { '?'.error }
1

>>> nil.ifNil { true }
true
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
