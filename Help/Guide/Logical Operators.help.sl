# Logical Operators

Logical and is `&`, logical or is `|`.
As in Smalltalk these operators implement non-evaluating conjunction,
the right hand side must be delayed.

```
>>> true & { false }
false

>>> false | { true }
true
```

The `&&` and `||` operators implement evaluating conjunction:

```
>>> true && false
false

>>> false || true
true
```

Logical not is _not_.

```
>>> true.not
false
```

* * *

See also: &, &&, |, ||, anySatisfy, allSatisfy, bitAnd, bitOr, not

Guides: Bitwise Functions, Boolean Functions, Comparison Functions

Categories: Logic
