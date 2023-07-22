# Procedure Syntax -- syntax

The _Procedure_ syntax follows the Smalltalk _Block_ syntax, with braces (`{` and `}`) replacing brackets (`[` and `]`), and semi-colons (`;`) replacing periods (`.`).

The general form is _{ arguments? temporaries? statements? }_.

A no argument procedure that returns a random number between -1 and 1 is written _{ random(-1, 1) }_.

Arguments are written with a colon (`:`) prefix directly following the open brace and are terminated by a vertical bar (`|`).

The one argument procedure to square a number is written _{ :n | n * n }_.

The two argument sum of squares procedure is written _{ :x :y | (x * x) + (y * y) }_.

Temporaries are written between vertical bars, statements are separated by semi-colons.

A one argument procedure that returns two random numbers, the second constrained by the first, is written _{ :n | | i j | i := random(0, n); j := random(0, i); [i, j] }_.

There is no return operator, the value of a procedure is the value of the last statement.

There are two re-writing syntax forms for procedures, [Initialised Temporaries Syntax] and [Variable Keyword Syntax].

_Subtleties:_
If _p.q_ is a procedure, it must be applied as _(p.q) . (r)_, which is usually written p.q.value(r).
_p.q(r)_ is _q(p, r)_, not _(q(p))(r)_.

* * *

See also: [Procedure Semantics]
