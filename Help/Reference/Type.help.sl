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
>>> 	m.includesKey('asList:/1'),
>>> 	m['asList:/1'].isMethod
>>> )
(true, true)
```

`Type` implements `category`, `name` and `packageName`:

```
>>> let c = system.typeLookup('RgbColour');
>>> (c.category, c.name, c.packageName)
('Graphics', 'RgbColour', 'Colour')
```

* * *

See also: Method, System, Trait, traitNameList, typeDefinition, typeLookup, typeOf

Guides: Reflection Functions

Categories: Type
