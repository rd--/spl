# Quoted At Syntax -- syntax

Rewrite rule:

- _c::k_ ⟹ _c['k']_ ⟹ _at(c, 'k')_

Syntax for the _at_ protocol.
_c::k_ reads the values at the key _'k'_ from the collection _c_.

This syntax is a counterpart to the [Dictionary Syntax].

	| d = (x: 1, y: 2); | d::x < d::y

Where supported _::_ is displayed as _·_.

* * *

See also: [At Syntax], colonColon, [Put Syntax], [Quoted Indexable Syntax]

Unicode: U+00B7 · Middle Dot
