# Trailing Block Syntax

Rewrite rules:

- _f { p } ..._ ⟹ _f({ p }, ...)_
- _f(x, ...) { p } ..._ ⟹ _f(x, ..., { p }, ...)_
- _x.f { p } ..._ ⟹ _f(x, { p }, ...)_
- _x.f(y, ...) { p } ..._ ⟹ _f(x, y, ..., { p }, ...)_

Trailing block syntax allows any number of concluding _literal block_ arguments to be written outside the parameter list.
This notation is particularly clear for control blocks such as _if_, _while_, _timesRepeat_ &etc.

The syntax does not preclude further message sends:

```
>>> 1:9.collect { :x | x * x }.last
81

>>> 1:9.collect { :x |
>>> 	x * x
>>> }.collect { :x |
>>> 	x * x
>>> }.last
6561
```

* * *

See also: Block

Guides: Syntax Guides, Trailing Dictionary Syntax

Categories: Syntax
