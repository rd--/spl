# Method Syntax

Rewrite rules:

- _x.f_ ⇒ _f(x)_
- _x.f(y, ...)_ ⇒ _f(x, y, ...)_

_Rationale_:
Method syntax makes writing from left to right simpler.
Extending _f(x)_ to _g(f(x))_ requires inserting three characters, two at the left of the existing text, and one at the right.
Extending _f(x)_ to _f(x).g_ requires inserting two characters, both at the right of the existing text.
The method syntax is particularly useful if the insertion cursor is already at the end of the existing text.
