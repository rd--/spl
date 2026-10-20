# What is a Type?

A `Type` is the abstract description a set of values.
Each value in Sᴘʟ is an _instance_ of a type.

`typeName` answers the name of the type of a value:

```
>>> 3.141.typeName
'SmallFloat'
```

`typeDefinition` answers the `Type` of a value:

```
>>> let t = 3.141.typeDefinition;
>>> (t.isType, t.typeName, t.name)
(true, 'Type', 'SmallFloat')
```

* * *

See also: Type, typeDefinition, typeName

Guides: Primitive Types, Reflection Functions, What is a Trait
