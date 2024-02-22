# Quoted AtIfAbsentPut Syntax -- syntax

Rewrite rule:

- _c::k_ :=? a ⟹ _atIfAbsentPut(c, 'k', a)_

Syntax for the _atIfAbsentPut_ protocol.
Read the value at the key _'k'_ from the collection _c_, if it is absent evaluate _a_,
writing that value to _k_ at _c_, and answering it.
_a_ must be a literal block.

* * *

See also: At Syntax, AtIfAbsent Syntax, Put Syntax, Quoted At Syntax, Quoted AtIfAbsent Syntax
