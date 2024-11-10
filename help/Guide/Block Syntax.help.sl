# Block Syntax

The _Block_ syntax follows Smalltalk’s.

Curly brackets (`{` and `}`) replace square brackets (`[` and `]`),
and semicolons (`;`) replace periods (`.`).

The general form is:

> _{ arguments? temporaries? statements? }_

A no argument block that returns a random number between -1 and 1 can be written:

> _{ (-1 -- 1).atRandom }_

Arguments are written with a colon (`:`) prefix directly following the open brace and are terminated by a vertical bar (`|`).

The one argument block to square a number is written:

> _{ :n | n * n }_

The two argument sum of squares block is written:

> _{ :x :y | (x * x) + (y * y) }_

Temporaries are written using a `var` keyword, statements are separated by semi-colons.

A one argument block that returns two random numbers, the second constrained by the first, is written

> _{ :n | var i, j; i := (0 -- n).atRandom; j := (0 -- i).atRandom; [i, j] }_

There is no return operator, the value of a block is the value of the last statement.

_Subtleties:_
If _p.q_ is a block, it must be applied as _(p.q) . (r)_, which is usually written _p.q.value(r)_.
_p.q(r)_ is _q(p, r)_, not _(q(p))(r)_.

* * *

See also: {, }, |, :, ;, var

Guides: Block Semantics, Value Apply Syntax, Var Syntax

Categories: Syntax
