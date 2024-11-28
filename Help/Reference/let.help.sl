# let

- _let name = value; ..._

`let` is a keyword that introduces a variable binding.

`let` bindings must be placed in sequence at the start of a `Block` or program,
immediately following any argument names.

`let` bindings may not be interspersed with statements,
however `let` bindings do allow the _unused variable_ syntax:

```
>>> let a = 1;
>>> let b = 2;
>>> let _ = { a < 6 }.whileTrue { a := a + 1 };
>>> let _ = { b < 7 }.whileTrue { b := b + 1 };
>>> let c = 8;
>>> [a b c]
[6 7 8]
```

* * *

See also: =, var

Guides: Block Syntax, Let Syntax, Program Syntax, Var Syntax

Categories: Keyword, Syntax
