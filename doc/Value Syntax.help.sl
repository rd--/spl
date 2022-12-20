# Value Syntax

Rewrite rule:

- _f.()_ ≡ _f.value()_
- _f.(x, ...)_ ≡ _f.value(x, ...)_

This is the primitive application syntax.
_f_ must be a _Procedure_ value, and it is applied to the arguments given with the parentheses.

```
{ true }.() = true
{ :x | x * x }.(9) = 81
```
