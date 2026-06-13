# Temporary Block Syntax

In the case where a temporary variable is `let` bound to a literal block,
the system appends the appropriate arity qualifier to the bound name.

This allows the defined block to be applied using `Apply Syntax`:

```
>>> let f = { :x |
>>> 	x * x * x
>>> };
>>> (f(3), f:/1.isBlock)
(27, true)
```

To refer to the block by name the qualifier must be written:

```
>>> let f = { :x |
>>> 	x * x * x
>>> };
>>> [3 5 7].collect(f:/1)
[27 125 343]

>>> [3 5 7].collect(cube:/1)
[27 125 343]
```

_History_:
Sᴘʟ initially included a compiler switch to allow binding both the qualified and unqualified names.

* * *

Categories: Syntax
