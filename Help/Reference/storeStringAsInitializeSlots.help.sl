# storeStringAsInitializeSlots

- _storeStringAsInitializeSlots(anObject)_

Answer a `String` that can be used as `storeString`,
if _anObject_ can be created by a method with the name of the type,
that accepts initial values for each slot in sequence.

```
>>> 2/3.storeStringAsInitializeSlots
'Fraction(2L, 3L)'
```

* * *

See also: slotValueList, storeString

Categories: Reflection
