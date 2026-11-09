# Type

A `Type` describes a kind of value.

The `system` dictionary holds a `typeDictionary`:

```
>>> system.typeDictionary.elementType
'Type'
```

`typeLookup` looks up a type by name:

```
>>> system.typeLookup('List').name
'List'
```

A `Type` holds a `methodDictionary`:

```
>>> let t = system.typeLookup('List');
>>> let m = t.methodDictionary;
>>> (
>>> 	m.includesKey('interleave/1'),
>>> 	m['interleave/1'].isMethod
>>> )
(true, true)
```

`Type` implements `category`, `name` and `packageName`:

```
>>> let t = system.typeLookup(
>>> 	'RgbColour'
>>> );
>>> (t.category, t.name, t.packageName)
('*Uncategorized*', 'RgbColour', 'Colour')
```

* * *

See also: Method, System, Trait, traitNameList, typeDefinition, typeLookup, typeName

Guides: Reflection Functions

Categories: Type
