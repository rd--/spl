# Trailing Block Syntax

- _f { p }_
- _f(x, …) { p }_
- _x.f { p } …_
- _x.f(y, …) { p } …_

Trailing block syntax allows any number of concluding _literal block_ arguments to be written outside the parameter list.
This notation is particularly clear for control blocks such as _if_, _while_, _timesRepeat_ &etc.

Rewrite rules:

```
>> 'f { p }'.splSimplify
f({ p })

>> 'f(x) { p }'.splSimplify
f(x, { p })

>> 'x.f { p }'.splSimplify
f(x, { p })

>> 'x.f(y) { p }'.splSimplify
f(x, y, { p })
```

The syntax does not preclude further message sends:

```

>> 'f { p }.g'.splSimplify
g(f({ p }))

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

Guides: Experimental Trailing Record Syntax, Syntax Guides

Categories: Syntax
