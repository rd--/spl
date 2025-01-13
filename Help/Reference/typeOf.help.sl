# typeOf

- _typeOf(anObject)_

Answers the type name of _anObject_.

The names of the primitive types:

```
>>> 3.141.typeOf
'SmallFloat'

>>> true.typeOf
'Boolean'

>>> nil.typeOf
'Nil'

>>> 'x'.typeOf
'String'

>>> [].typeOf
'List'

>>> ().typeOf
'Record'

>>> 23.typeOf.typeOf
'String'

>>> typeOf:/1.typeOf
'Block'
```

The system includes a `typeDictionary` that maps type names to `Type` values.

```
>>> system.typeLookup('String').isType
true

>>> system
>>> .typeLookup('String')
>>> .methodDictionary
>>> .includesKey('includesSubstring:/2')
true
```

* * *

See also: elementTypes, species, typeDefinition, typeDictionary, Type

Categories: Reflection, Types
