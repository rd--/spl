# typeOf -- reflection

- _typeOf(anObject)_

Answers the type name of _anObject_.

```
3.141.typeOf = 'SmallFloat'
23.typeOf.typeOf = 'String'
typeOf:/1.typeOf = 'Procedure'
```

The system includes a _typeDictionary_ that maps type names to _Type_ values.

```
system.type('String').isType = true
system.type('String').methodDictionary.includesKey('includesSubstring:/2') = true
```

* * *

See also: _species_
