# SuperCollider Perspective

There is no end of line comment syntax,
`//` is the quotient operator.

Block arguments are written as in Smalltalk,
with a colon (`:`) prefix immediately following the opening brace,
and terminated by a vertical bar (`|`),
e.g. `{ :x | x }` in place of `{ |x| x }`.

Initialized temporary variables are written using `let`,
e.g. `let x = 23` in place of `var x = 23`,
and only one name may be defined per `let` statement.

The variable assignment syntax is `:=`,
e.g. `x := 23` in place of `x = 23`.

The following operators are spelled differently:

- equality is `=` in place of `==`
- identity is `==` in place of `===`
- logical and is `&` in place of `&&`
- logical or is `|` in place of `||`

Arity is strict.
Whereas in SuperCollider language _max(-3)_ and _max(-3, 0)_ and _max(-3, 0, 3)_ all answer _0_,
in the simple language only the two argument form is allowed.
There is a unary form of `max` but it is only defined at collections,
and it is defined so that _max([-3, 0, 3])_ answers _3_,
where in SuperCollider language the same expression answers _[-3, 0, 3]_.

There are no keywords or default argument values.
There is however a `Trailing Record Syntax`,
and this allows writing _SinOsc(freq: 440, phase: 0)_,
so long as there is a suitable definition of `SinOsc` at `Record`.

* * *

Further Reading: McCartney (1996, 1998, 2002)
