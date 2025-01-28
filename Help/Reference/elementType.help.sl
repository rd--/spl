# elementType

- _elementType(aCollection | aMatrix)_

Answer the uniform `typeOf` each element of _aCollection_,
else `nil`.

At `Range`:

```
>>> 1:9.elementType
'SmallFloat'
```

At `List`:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ].elementType
'List'
```

At `Matrix`:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ].asMatrix.elementType
'SmallFloat'
```

At heterogeneous `List`:

```
>>> [1 2/3 4J5 '6' 7n].elementType
nil
```

At the empty `List`:

```
>>> [].elementType
nil
```

* * *

See also: elementTypeIfAbsent, elementTypes, typeOf

Categories: Reflection, Types
