# packageMethods

- _packageMethods(s, p)_

At `System`,
answer the `List` of `Method`s defined in the named `Package` _p_.

Find the definitions of `inHertz` in the _Frequency_ package:

```
>>> system.packageMethods(
>>> 	'Frequency'
>>> ).select { :each |
>>> 	each.name = 'inHertz'
>>> }.collect { :each |
>>> 	(each.origin.name, each.arity)
>>> }
[
	('Frequency', 1)
]
```

* * *

See also: Package, packageDictionary, packageTraits, packageTypes

Guides: Reflection Functions
