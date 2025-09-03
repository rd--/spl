# elementTypeIfAbsent

- _elementTypeIfAbsent(c, f:/0)_

Answer the uniform `typeOf` each element of the collection _c_,
else answer the value of the block _f_.

```
>>> [1 2/3 4J5 '6' 7L]
>>> .elementTypeIfAbsent { 'Any' }
'Any'
```

At empty list:

```
>>> [].elementTypeIfAbsent { 'Unknown' }
'Unknown'
```

At one element list:

```
>>> [23].elementTypeIfAbsent { 'Any' }
'SmallFloat'
```

At `List` of `String`:

```
>>> 'english'
>>> .alphabet
>>> .elementTypeIfAbsent { 'Any' }
'String'
```

* * *

See also: elementType, elementTypes, typeOf

Guides: Reflection Functions
