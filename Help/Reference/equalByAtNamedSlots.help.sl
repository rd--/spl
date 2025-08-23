# equalByAtNamedSlots

- _equalByAtNamedSlots(o₁, o₂, [n₁ n₂ …], f:/2)_

Answer `true` if the objects _o₁_ and _o₂_ are equal,
according to the block _f_,
at each slot in the slot name list _n_.

Used to implement `=` and `~` at types where equality depends on some slots but not others.

* * *

See also: =, ~, hasEqualSlotsBy, slotList, slotNameList, slotRead, slotWrite

Guides: Reflection Functions
