# Type

A `Type` describes a kind of value.

The `system` dictionary holds a `typeDictionary`.

```
>>> system.typeDictionary.isDictionary
true

>>> system.typeDictionary.includesKey('List')
true

>>> system.typeLookup('List').isType
true

>>> system.typeLookup('List').name
'List'

>>> system.typeLookup('List').methodDictionary.includesKey('shallowCopy:/1')
true

>>> system.typeLookup('List').methodDictionary['shallowCopy:/1'].isMethod
true
```

Type fields are: `category`, `name`, `packageName`.

```
>>> let c = system.typeLookup('Colour');
>>> (c.typeOf, c.isType, c.category, c.name, c.packageName)
('Type', true, 'Graphics', 'Colour', 'Colour')
```

* * *

See also: Method, System, Trait, traitNameList, type

Categories: Type
