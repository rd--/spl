# elementType

- _elementType(c)_

Answer the uniform `typeOf` each element of the collection _c_,
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

At `NumericArray`:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ].asNumericArray.elementType
'SmallFloat'
```

At a heterogeneous `List`:

```
>>> [1 2/3 4J5 '6' 7L].elementType
nil
```

At the empty `List`:

```
>>> [].elementType
nil
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).elementType
'SmallFloat'
```

* * *

See also: elementTypeIfAbsent, elementTypes, keyType, typeOf

Guides: Reflection Functions

Categories: Reflection, Types
