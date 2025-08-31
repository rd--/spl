# Experimental Slot Assignment Syntax

Rewrite rules:

- _p.q := r_ ⟹ _q(p, r)_

Syntax to allow setting an instance variable using assignment syntax.

For type _t_ with an instance variable _v_ the system generates two methods,
_v(t)_ reads the slot,
_v(t, x)_ sets the slot.

This syntax can be used for any arity two method,
however it is a rather confusing notation if the method is not some form of set mechanism:

```
>>> (7.hypotenuse := 3)
hypotenuse(7, 3)
```

_Rationale_:
The current notation makes _p.q(r)_ and _p.q := r_ synonyms.
If there were not slot assignment syntax,
_p.q(r)_ is a concise notation for the operation.
The system may be edited to name the slot mutation methods differently,
in which case this syntax would also be edited.

* * *

Guides: Syntax Guides
