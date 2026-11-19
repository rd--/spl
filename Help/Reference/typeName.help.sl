# typeName

- _typeName(x)_

Answers the type name of the object _x_,
the answer is a `String` value.

At `Float`:

```
>>> 3.141.typeName
'Float'
```

At `Boolean`:

```
>>> true.typeName
'Boolean'

>>> false.typeName
'Boolean'
```

At `Nil`:

```
>>> nil.typeName
'Nil'
```

At `String`:

```
>>> 'x'.typeName
'String'
```

At `List`:

```
>>> [].typeName
'List'
```

At `Record`:

```
>>> (:).typeName
'Record'
```

At `Map`:

```
>>> Map().typeName
'Map'
```

At `Block`:

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

See also: Type, elementTypes, species, typeDefinition, typeDictionary

Guides: Reflection Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TypeOf.html)
