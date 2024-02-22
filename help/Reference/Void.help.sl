# Void

_Void_ is the name of the uninhabited type.
It identifies the place in the method table where blocks of no arguments are located.

No argument blocks are notated as methods of _Void_.

```
>>> system.typeLookup('Void').methodDictionary.includesKey('Set:/0')
true

>>> system.onlyZeroArityMethodList.includes('PriorityQueue')
true
```

* * *

Categories: Uninhabited, Type
