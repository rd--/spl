# packageDictionary

- _packageDictionary(s)_

At `System`,
answer a `Dictionary` holding the `Package`s known to the system.

```
>>> let d = system.packageDictionary;
>>> (
>>> 	d.isDictionary,
>>> 	d.elementType,
>>> 	d.size.round(25)
>>> )
(true, 'Package', 450)
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

`requires` answers the set of packages required by a package.
`dependencies` answers the recursive set of packages required by a package:

```
>>> let d = system.packageDictionary;
>>> d.at('PackageBrowser')
>>> .dependencies
>>> .collect(name/1)
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

See also: Package, methodDictionary, packageMethods, packageTraits, packageTypes, system, traitDictionary, typeDictionary

Guides: Reflection Functions

Categories: Reflection, System
