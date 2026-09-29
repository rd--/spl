# Experimental Slot Assignment Syntax

Rewrite rules:

- _p.q := r_ ⟹ _q(p, r)_

Syntax to allow setting an instance variable using assignment syntax.

For type _t_ with an instance variable _v_,
if the system generates the two methods:

- _v(t)_: read the slot
- _v!(t, x)_: set the slot

Then `Dot Assignment Syntax` could be used for any arity two method with an _InPlace_ suffix,
however it is a rather confusing notation if the method is not some form of set mechanism:

~~~spl experimental
([1 2 3].add := 4)
add!([1 2 3], 3)
~~~

_Rationale_:
The current notation makes _p.q(r)_ and _p.q := r_ synonyms.
If there were not slot assignment syntax,
_p.q(r)_ is a concise notation for the operation.
The system may be edited to name the slot mutation methods differently,
in which case this syntax would also be edited.

* * *

Guides: Syntax Guides
