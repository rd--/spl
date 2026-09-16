# Store

`Store` is a `Trait` for objects that can be stored.

```
>>> system
>>> .traitDictionary['Store']
>>> .isTrait
true
```

Requires:

- `storeString`

Implements:

- `printString`

There is a default reflective implementation of `storeString`:

- `storeStringAsInitializeSlots`

Many types implement `Store`:

```
>>> let m = system.typeDictionary.size;
>>> let n = system.traitTypes('@Store').size;
>>> n / m > 2/5
true
```

* * *

See also: Object

Guides: Printing Functions
