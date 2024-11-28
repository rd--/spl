# packageDictionary

- _packageDictionary(aSystem)_

Answer a `Dictionary` holding the packages known to _aSystem_.

```
>>> let d = system.packageDictionary;
>>> (d.isDictionary, d.size > 200)
(true, true)

>>> system.packageDictionary.includesKey('Object')
true

>>> let p = system.packageDictionary['List'];
>>> (p.category, p.name, p.isLoaded, p.url)
(
	'Collection',
	'List',
	true,
	'Collection/List.sl'
)
```

* * *

See also: methodDictionary, Package, packageMethods, packageTraits, packageTypes, traitDictionary, typeDictionary, system

Categories: Reflection, System
