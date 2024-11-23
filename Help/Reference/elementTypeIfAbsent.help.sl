# elementTypeIfAbsent

- _elementTypeIfAbsent(aCollection, aBlock:/0)_

Answer the uniform `typeOf` each element of _aCollection_,
else answer _aBlock()_.

```
>>> [1 2/3 4j5 '6' 7n].elementTypeIfAbsent { 'Any' }
'Any'
```

* * *

See also: elementType, elementTypes, typeOf
