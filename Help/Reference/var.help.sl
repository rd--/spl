# var

- _var i, j, ...;_

`var` is a _keyword_ that introduces a set of temporary variable names,
each initialized to `nil`.

Declare a variable _x_:

```
>>> var x;
>>> x
nil
```

Declare three variables:

```
>>> var x, y, z;
>>> (x, y, z)
(nil, nil, nil)
```

A variables is assigned to using `:=`:

```
>>> var x;
>>> x := 3.141;
>>> x
3.141
```

`var` bindings must be placed at the start of a `Block` or program,
immediately following any arguments.

* * *

See also: :=, let, nil

Guides: Assignment Syntax, Block Syntax, Let Syntax, Program Syntax, Var Syntax

Categories: Keyword, Syntax
