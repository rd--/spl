# SuperCollider Perspective

There is no end of line comment syntax.
`//` is the quotient operator, not an open comment syntax.

Block arguments are written with a colon (`:`) prefix,
immediately following the opening brace,
and are terminated by a vertical bar (`|`),
e.g. `{ :x | x }` in place of `{ |x| x }`.

Initialized temporary variables are written using `let`,
e.g. `let x = 23` in place of `var x = 23`,
and only one name may be defined per `let` statement.

The variable assignment syntax is `:=`,
e.g. `x := 23` in place of `x = 23`.

The following operators are spelled differently:

- equality is `=` in place of `==`
- identity is `==` in place of `===`
- inequality is `~=` in place of `!=`
- logical and is `&` in place of `&&`
- logical or is `|` in place of `||`

* * *

Further Reading: McCartney (1996, 1998, 2002)
