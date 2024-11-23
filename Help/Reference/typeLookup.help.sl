# typeLookup

- _typeLookup(aSystem, aString)_

Answer the named `Type`, if it exists, else signal an error.

```
>>> let listType = system.typeLookup('List');
>>> (listType.isType, listType.methodDictionary.size > 500)
(true, true)

>>> { system.typeLookup('UnknownType') }.ifError { true }
true
```

* * *

See also: System, traitLookup, Type

Categories: Reflection
