# Method Syntax

Rewrite rules:

- _x.f_ ⟹ _f(x)_ ⟹ _f:/1 . (x)_
- _x.f(y, ...)_ ⟹ _f(x, y, ...)_ ⟹ _f:/n . (x, y, ...)_

The unary case:

```
>>> 9.sqrt
sqrt(9)
```

The binary case:

```
>>> 3.min(4)
min(3, 4)
```

_Rationale_:
Method syntax can make writing from left to right simpler.
Extending _f(x)_ to _g(f(x), y)_ requires inserting characters to both the left and the right of the existing text.
Extending _f(x)_ to _f(x).g(y)_ requires inserting characters only at the right of the existing text.
Method syntax is particularly useful if the insertion cursor is already at the end of the existing text.

_Note:_
`Dictionary Syntax` allows _()_ to be the empty dictionary,
_().f_ means _f(())_.

* * *

See also: Apply Syntax

Categories: Syntax
