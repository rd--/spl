# ifNotNil

- _ifNotNil(anObject, whenNotNil:/1)_
- _ifNotNil(anObject, whenNotNil:/1, whenNil:/0)_

Conditional evaluation.
If _anObject_ is not `nil` answer the result of _whenNotNil(anObject)_,
else answer _whenNil()_,
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

Categories: Evaluating
