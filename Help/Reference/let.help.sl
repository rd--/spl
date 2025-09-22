# let

- _let name = value; ..._

`let` is a keyword that introduces a variable binding.

Let _x_ be equal to seven:

```
>>> let x = 7;
>>> x ^ 2
49
```

Let _x_ be equal to seven and _y_ be equal to three:

```
>>> let x = 7;
>>> let y = 3;
>>> x ^ y
343
```

Let bound values are mutable:

```
>>> let x = 2;
>>> { x > 0 }.whileTrue { x := x.log };
>>> x
-0.36651
```

`let` bindings must be placed in sequence at the start of a `Block` or program,
immediately following any argument names.

`let` bindings may not be interspersed with statements,
however `let` bindings do allow the _unused variable_ syntax:

```
>>> let a = 1;
>>> let b = 2;
>>> let _ = { a < 6 }.whileTrue {
>>> 	a := a + 1
>>> };
>>> let _ = { b < 7 }.whileTrue {
>>> 	b := b + 1
>>> };
>>> let c = 8;
>>> [a b c]
[6 7 8]
```

It is an `error` to refer to a variable before it is declared:

```
>>> {
>>> 	let x = y;
>>> 	let y = 4;
>>> 	x
>>> }.hasError
true
```

* * *

See also: =, var

Guides: Block Syntax, Let Syntax, Program Syntax, Var Syntax

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Block.html)
[2](https://reference.wolfram.com/language/ref/With.html)

Categories: Keyword, Syntax
