# elementTypeIfAbsent

- _elementTypeIfAbsent(aCollection, aBlock:/0)_

Answer the uniform `typeOf` each element of _aCollection_,
else answer _aBlock()_.

```
>>> [1 2/3 4J5 '6' 7L]
>>> .elementTypeIfAbsent { 'Any' }
'Any'
```

* * *

See also: elementType, elementTypes, typeOf
