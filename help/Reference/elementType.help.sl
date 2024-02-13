# elementType

_elementType(aCollection)_

Answer the uniform _typeOf_ each element of _aCollection_,
else _nil_.

```
>>> 1:9.elementType
'SmallFloat'

>>> [1 2 3; 4 5 6; 7 8 9].elementType
'List'

>>> [1 2/3 4j5 '6' 7n].elementType
nil
```

* * *

See also: elementTypeIfAbsent, elementTypes, typeOf

Categories: Reflection, Types
