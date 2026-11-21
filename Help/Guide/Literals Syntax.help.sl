# Literals Syntax

The four primitive immediate types are `Nil`, `Boolean`, `Float` and `String`.

- _nil_ ⇒ `Nil`
- _true_ ⇒ `Boolean`
- _false_ ⇒ `Boolean`
- _23_ ⇒ `Float`
- _3.141_ ⇒ `Float`
- _'xyz'_ ⇒ `String`

The `Function Syntax` is similar to Smalltalk,
with braces replacing brackets,
semicolons replacing full stops,
and _var_ replacing _|_.

- _{ e; ... }_ ⇒ `Function` (with expressions _e_)
- _{ :a ...| e; ... }_ ⇒ `Function` (with arguments _a_)
- _{ :a ...| var t, ...; e; ... }_ ⇒ `Function` (with temporary variables _t_)

There is no literal _List_ syntax (as in Smalltalk) however there is a list expression syntax.

- _[p, q, r]_ ⇒ `List`

There is also a `Dictionary` expression syntax.

- _(x: p, y: q, z: r)_ ⇒ `Record`

* * *

Guides: Integer Syntax, List Syntax, Number Syntax, Range Literal Syntax, Range Syntax, Record Syntax, String Syntax
