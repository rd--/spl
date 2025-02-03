# Void

`Void` is the name of the uninhabited type.
It identifies the place in the method table where blocks of no arguments are located.

No argument blocks are notated as methods of `Void`.

```
>>> system
>>> .typeLookup('Void')
>>> .methodDictionary
>>> .includesKey('IdentitySet:/0')
true

>>> system
>>> .onlyZeroArityMethodList
>>> .includes('PriorityQueue')
true
```

* * *

See also: nil, Nil

Categories: Object, Type
