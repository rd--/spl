# typeName

- _typeName(x)_

Answers the type name of the object _x_,
the answer is a `String` value.

The names of the primitive atomic types:

```
>>> 3.141.typeName
'SmallFloat'

>>> true.typeName
'Boolean'

>>> nil.typeName
'Nil'

>>> 'x'.typeName
'String'
```

The names of the primitive collection types:

```
>>> [].typeName
'List'

>>> (:).typeName
'Record'

>>> Map().typeName
'Map'
```

The primitive behaviour type:

```
>>> typeName/1.typeName
'Block'
```

The type specifier is a string value:

```
>>> 23.typeName.typeName
'String'
```

The system includes a `typeDictionary` that maps type names to `Type` values.

```
>>> system.typeLookup('String').isType
true

>>> system
>>> .typeLookup('String')
>>> .methodDictionary
>>> .includesKey('includesSubstring/2')
true
```

* * *

See also: elementTypes, species, typeDefinition, typeDictionary, Type

Guides: Reflection Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TypeOf.html)

Categories: Reflection, Types
