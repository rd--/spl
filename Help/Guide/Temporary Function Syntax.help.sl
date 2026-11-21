# Temporary Function Syntax

In the case where a temporary variable is `let` bound to a literal function,
the system appends the appropriate arity qualifier to the bound name.

This allows the defined function to be applied using `Apply Syntax`:

```
>>> let f = { :x |
>>> 	x * x * x
>>> };
>>> (f(3), f/1.isFunction)
(27, true)
```

To refer to the function by name the qualifier must be written:

```
>>> let f = { :x |
>>> 	x * x * x
>>> };
>>> [3 5 7].collect(f/1)
[27 125 343]

>>> [3 5 7].collect(cube/1)
[27 125 343]
```

_History_:
Sᴘʟ initially included a compiler switch to allow binding both the qualified and unqualified names.

* * *

Guides: Syntax Guides
