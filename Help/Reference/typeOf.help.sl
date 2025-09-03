# typeOf

- _typeOf(x)_

Answers the type name of the object _x_,
the answer is a `String` value.

The names of the primitive atomic types:

```
>>> 3.141.typeOf
'SmallFloat'

>>> true.typeOf
'Boolean'

>>> nil.typeOf
'Nil'

>>> 'x'.typeOf
'String'
```

The names of the primitive collection types:

```
>>> [].typeOf
'List'

>>> (:).typeOf
'Record'

>>> [:].typeOf
'Map'
```

The primitive behaviour type:

```
>>> typeOf:/1.typeOf
'Block'
```

The type specifier is a string value:

```
>>> 23.typeOf.typeOf
'String'
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

Guides: Reflection Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TypeOf.html)

Categories: Reflection, Types
