# packageTypes

- _packageTypes(s, p)_

At `System`,
answer the `List` of `Type`s defined in the named `Package` _p_.

```
>>> let t = system.packageTypes(
>>> 	'Complex'
>>> );
>>> (
>>> 	t.elementType,
>>> 	t.size,
>>> 	t[1].name,
>>> 	t[1].category
>>> )
('Type', 1, 'Complex', 'Number')
```

* * *

See also: Package, packageDictionary, packageMethods, packageTraits, Type

Guides: Reflection Functions
