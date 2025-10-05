# packageMethods

- _packageMethods(s, p)_

At `System`,
answer the `List` of `Method`s defined in the named `Package` _p_.

Find the definitions of `asHert` in the _Frequency_ package:

```
>>> system.packageMethods(
>>> 	'Frequency'
>>> ).select { :each |
>>> 	each.name = 'asHertz'
>>> }.collect { :each |
>>> 	(each.origin.name, each.arity)
>>> }
[
	('Number', 1),
	('Frequency', 1)
]
```

* * *

See also: Package, packageDictionary, packageTraits, packageTypes

Guides: Reflection Functions
