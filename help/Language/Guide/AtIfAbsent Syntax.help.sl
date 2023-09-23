# AtIfAbsent Syntax -- syntax

Rewrite rule:

- _c[k] :? a_ ⟹ _atIfAbsent(c, k, a)_

Syntax for the _atIfAbsent_ protocol.
Read the value at the index _k_ of the collection _c_, if it is absent evaluate _a_.
_a_ must be a literal block.

Where supported _:?_ is displayed as ⤝.

* * *

See also: [At Synax], [AtAll Syntax], [AtPut Syntax], [Quoted At Syntax]

Unicode: U+291D ⤝ Leftwards arrow to black diamond
