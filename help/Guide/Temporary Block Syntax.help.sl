# Temporary Block Syntax

In the case where a temporary variable is initialised to a literal block,
the system may bind both the arity strict and arity generic names.

There is a compiler switch to select the behaviour.

In both cases the program:

```
>>> let f = { :x | x * x };
>>> [3, 5, 7].collect(f:/1)
[9, 25, 49]
```

is correct.

The switch allows one to elide the rate qualified (:/1).

This notation is not allowed by default.

* * *

Categories: Syntax
