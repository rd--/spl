# :=

:= is a syntax token, it is not an operator.

:= separates the variable name and the expression in `Assignment Syntax`.

```
>>> var x;
>>> x := 3;
>>> x * x
9
```

The value of an assignment expression is the value being assigned:

```
>>> let x = 0;
>>> (x, 3 + (x := 4), x)
(0, 7, 4)
```

The _:=_ symbol is also part of `AtPut Syntax` and `Quoted AtPut Syntax`.

Where supported `:=` is displayed either as ← or ≔.

* * *

See also: =, Assignment Syntax

References:
_Apl_
[1](https://aplwiki.com/wiki/Assignment),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/eqco)

Unicode: U+2190 ← Leftwards Arrow, U+2254 ≔ Colon Equals

Categories: Assignment, Syntax
