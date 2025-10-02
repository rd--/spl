# ifNotEmpty

- _ifNotEmpty(c, f:/1, g:/0)_

Conditional evaluation.
If the collection _c_ is not empty,
answer the result of _f.cull(c)_,
else answer _g()_.
If _g_ is elided answer `nil`.

```
>>> [].ifNotEmpty(sqrt:/1)
nil

>>> [1 4 9 16 25].ifNotEmpty(sqrt:/1)
[1 2 3 4 5]

>>> let a = [1 2 3];
>>> let b = a.ifNotEmpty { :x |
>>> 	x[2] := -2
>>> };
>>> (a, b)
([1 -2 3], -2)
```

* * *

See also: if, ifFalse, ifNil, ifNotEmpty, ifNotNil, ifTrue, size

Guides: Collection Functions, Control Functions

Categories: Evaluating
