# typeLookup

- _typeLookup(aSystem, aString)_

Answer the named `Type`, if it exists:

```
>>> let t = system.typeLookup('List');
>>> (t.isType, t.methodDictionary.size > 500)
(true, true)
```

else signal an `error`:

```
>>> {
>>> 	system.typeLookup('UnknownType')
>>> }.ifError { true }
true
```

* * *

See also: System, traitLookup, Type

Categories: Reflection
