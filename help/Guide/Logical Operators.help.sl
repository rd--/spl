# Logical Operators

Logical and is _&_, logical or is _|_.
As in Smalltalk the right hand side of these operators must be delayed.

```
>>> true & { false }
false

>>> false | { true }
true
```

Logical not is _not_.

```
>>> true.not
false
```

* * *

See also &, |, bitAnd, bitOr
