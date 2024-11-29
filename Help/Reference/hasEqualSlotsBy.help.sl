# hasEqualSlotsBy

- _hasEqualSlotsBy(anObject, anotherObject, aBlock:/2)_

Answer `true` if _aObject_ and _anotherObject_ have the same `type`,
and if each of the slots of _aObject_ equal the corresponding slot of _anotherObject_,
according to _aBlock_.

```
>>> 2/3.hasEqualSlotsBy(2/3, =)
true
```

* * *

See also: =, ==, hasEqualElements, hasEqualSlots, slotList

Categories: Comparing, Reflection
