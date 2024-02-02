# Quoted AtIfAbsent Syntax -- syntax

Rewrite rule:

- _c::k_ :? a ⟹ _atIfAbsent(c, 'k', a)_

Syntax for the _atIfAbsent_ protocol.
Read the value at the key _'k'_ from the collection _c_, if it is absent evaluate _a_.
_a_ must be a literal block.

This is a form of _ternary syntax_, the operator _:?_ is also a part of [Quoted AtIfAbsent Syntax].

Where supported the operator _:?_ is displayed as _⍰_.

* * *

See also: [At Syntax], [AtIfAbsent Syntax], [Put Syntax], [Quoted At Syntax]

Unicode: U+2370 ⍰ Apl Functional Symbol Quad Question
