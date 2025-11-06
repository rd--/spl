# Literals Syntax

The four primitive immediate types are `Nil`, `Boolean`, `SmallFloat` and `String`.

- _nil_ ⇒ `Nil`
- _true_ ⇒ `Boolean`
- _false_ ⇒ `Boolean`
- _23_ ⇒ `SmallFloat`
- _3.141_ ⇒ `SmallFloat`
- _'xyz'_ ⇒ `String`

The _Block_ syntax is similar to Smalltalk,
with braces replacing brackets,
semicolons replacing full stops,
and _var_ replacing _|_.

- _{ e; ... }_ ⇒ `Block` (with expressions _e_)
- _{ :a ...| e; ... }_ ⇒ `Block` (with arguments _a_)
- _{ :a ...| var t, ...; e; ... }_ ⇒ `Block` (with temporary variables _t_)

There is no literal _List_ syntax (as in Smalltalk) however there is a list expression syntax.

- _[p, q, r]_ ⇒ `List`

There is also a `Dictionary` expression syntax.

- _(x: p, y: q, z: r)_ ⇒ `Record`

* * *

See also: Record Syntax, Integer Syntax, List Syntax, Number Syntax, Range Syntax, String Syntax

Categories: Syntax
