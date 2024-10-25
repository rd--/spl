# typeDefinition

- _typeDefinition(anObject)_

Answer the `Type` of _anObject_.

```
>>> [1 2 3].typeDefinition.name
'List'

>>> [1 2 3].typeOf
'List'

>>> [1 2 3].typeDefinition.typeOf
'Type'
```

This is not called `type` since that is a very commonly used word and might ordinarily be used to name a slot of a type,
as it is for `Blob`.
The reflective method to answer the `Type` of a value is used only infrequently.

* * *

See also: typeOf, Type

Categories: Reflection
