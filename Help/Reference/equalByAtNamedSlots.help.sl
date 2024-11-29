# equalByAtNamedSlots

- _equalByAtNamedSlots(anObject, anotherObject, slotNameList, aBlock:/2)_

Answer `true` if _anObject_ and _anotherObject_ are equal,
according to _aBlock_,
at each slot in _slotNameList_.

Used to implement `=` and `~` at types where equality depends on some slots but not others.

* * *

See also: =, ~, hasEqualSlotsBy, slotList, slotNameList, slotRead, slotWrite
