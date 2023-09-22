# AtIfAbsentPut Syntax -- syntax

Rewrite rule:

- _c[k] :=? a_ ⟹ _atIfAbsentPut(c, k, a)_

Syntax for the _atIfAbsentPut_ protocol.
Read the value at the index _k_ of the collection _c_, if it is absent evaluate _a_,
writing that value to _k_ at _c_, and answering it.
_a_ must be a literal block.

* * *

See also: [At Synax], [AtAll Syntax], [AtIfAbsent Syntax], [AtPut Syntax], [Quoted At Syntax]
