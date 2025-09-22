# typeLookup

- _typeLookup(system, t)_

At `system`,
answer the named `Type` _t_, if it exists:

```
>>> let t = system.typeLookup('List');
>>> (
>>> 	t.isType,
>>> 	t.methodDictionary.size > 1200
>>> )
(true, true)
```

else signal an `error`:

```
>>> {
>>> 	system.typeLookup('Unknown')
>>> }.hasError
true
```

* * *

See also: System, traitLookup, Type

Guides: Reflection Functions

Categories: Reflection
