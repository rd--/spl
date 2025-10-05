# Var Syntax

The `var` keyword introduces a set of variable bindings,
each initialized to `nil`.

It is a part of `Block Syntax` and `Program Syntax`.

```
>>> var x, y;
>>> x := 1;
>>> y := x + 2;
>>> (x, y)
(1, 3)
```

Defining functions using `let` bindings to a literal block binds the arity qualified name:

```
>>> let f = { :x |
>>> 	x * 2 + 1
>>> };
>>> f:/1 . (11)
23
```

This is distinct from binding a literal block to an existing identifier defined using `var`:

```
>>> var f;
>>> f := { :x |
>>> 	x * 2 + 1
>>> };
>>> f . (11)
23
```

* * *

See also: nil, var

Guides: Block Syntax, Let Syntax, Program Syntax

Categories: Syntax
