# elementType

- _elementType(c, f/0)_

Answer the uniform `typeOf` each element of the collection _c_,
else the answer of _f_, or `nil` in the unary case.

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

The binary case evaluates the block _f_ if there is no uniform type,
or if the collection is empty:

```
>>> [1 2/3 4J5 '6' 7L]
>>> .elementType { 'Any' }
'Any'
```

At empty list:

```
>>> [].elementType { 'Unknown' }
'Unknown'
```

At one element list:

```
>>> [23].elementType { 'Any' }
'SmallFloat'
```

At `List` of `String`:

```
>>> 'english'
>>> .namedAlphabet
>>> .elementType { 'Any' }
'String'
```

* * *

See also: elementTypeIfAbsent, elementTypes, keyType, typeOf

Guides: Reflection Functions

Categories: Reflection, Types
