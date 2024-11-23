# let

Let is a keyword that introduces a variable binding.

Let bindings are of the form

> _let namePattern = valueExpression; ..._

Let bindings must be placed in sequence at the start of a `Block` or program,
immediately following any argument names.

Let bindings may not be interspersed with statements,
however let bindings do allow the _unused variable_ syntax:

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

See also: Block Syntax, Let Syntax, Program Syntax, Var Syntax, var

Categories: Keyword, Syntax
