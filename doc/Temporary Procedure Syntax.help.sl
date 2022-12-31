# Temporary Procedure Syntax

In the case where a temporary variable is initialised to a literal procedure, the system may bind both the arity strict and arity generic names.

There is a compiler switch to select the behaviour.

In both cases the program:

```
var f = { :x | x * x };
 [3, 5, 7].collect(f:/1) = [9, 25, 49]
```

is correct, the switch allows one to also write:

```
var f = { :x | x * x };
[3, 5, 7].collect(f) = [9, 25, 49]
```

This notation is not allowed by default.
