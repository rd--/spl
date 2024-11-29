# packageDictionary

- _packageDictionary(aSystem)_

Answer a `Dictionary` holding the `Package`s known to _aSystem_.

```
>>> system.packageDictionary.isDictionary
true

>>> system.packageDictionary.elementType
'Package'
```

`Object` is a package:

```
>>> system.packageDictionary.includesKey('Object')
true
```

Package fields include `category`, `name`, `isLoaded` and `url`:

```
>>> let p = system.packageDictionary['List'];
>>> (p.category, p.name, p.isLoaded, p.url)
(
	'Collection',
	'List',
	true,
	'Collection/List.sl'
)
```

`requires` answers set of packages required by a package.
`dependencies` answers the recursive set of packages required by a package:

```
>>> let p = system.packageDictionary;
>>> let d = p['PackageBrowser'].dependencies;
>>> d.collect(name:/1).includesAllOf(
>>> 	['ColumnBrowser' 'Event' 'SmallKansas']
>>> )
true
```

* * *

See also: methodDictionary, Package, packageMethods, packageTraits, packageTypes, traitDictionary, typeDictionary, system

Categories: Reflection, System
