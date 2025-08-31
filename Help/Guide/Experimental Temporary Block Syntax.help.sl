# Experimental Temporary Block Syntax

In the case where a temporary variable is `let` bound to a literal block,
the system appends the appropriate arity qualifier to the bound name.

This allows the defined block to be applied using `Apply Syntax`:

```
>>> let f = { :x |
>>> 	x * x * x
>>> };
>>> f(3)
27
```

To refer to the block by name the qualified must be written:

```
>>> let f = { :x |
>>> 	x * x * x
>>> };
>>> [3, 5, 7].collect(f:/1)
[27 125 343]
```

_Experimental_:
The system may bind either only the arity strict name,
or additionaly the arity generic name.
There is a compiler switch to select the behaviour.
The switch allows one to elide the rate qualified (:/1).
This notation is not allowed by default.

* * *

Categories: Syntax
