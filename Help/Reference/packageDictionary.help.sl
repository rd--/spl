# packageDictionary

- _packageDictionary(s)_

Ay `System`,
answer a `Dictionary` holding the `Package`s known to the system.

```
>>> system.packageDictionary
>>> .isDictionary
true

>>> system.packageDictionary
>>> .elementType
'Package'
```

`Object` is a package:

```
>>> system.packageDictionary
>>> .includesKey('Object')
true
```

Package fields include `category`, `name`, `isLoaded` and `url`:

```
>>> let d = system.packageDictionary;
>>> let p = d.at('List');
>>> (
>>> 	p.category,
>>> 	p.name,
>>> 	p.isLoaded,
>>> 	p.url
>>> )
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
>>> let d = system.packageDictionary;
>>> d.at('PackageBrowser')
>>> .dependencies
>>> .collect(name:/1)
>>> .includesAll(
>>> 	[
>>> 		'ColumnBrowser'
>>> 		'Event'
>>> 		'SmallKansas'
>>> 	]
>>> )
true
```

* * *

See also: methodDictionary, Package, packageMethods, packageTraits, packageTypes, traitDictionary, typeDictionary, system

Guides: Reflection Functions

Categories: Reflection, System
