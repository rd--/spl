# valueType

- _valueType(d)_

Answer the uniform `typeOf` each value of the dictionary _d_,
else `nil`.

At `Record`:

```
>>> (x: 1, y: 2, z: 3)
>>> .valueType
'SmallFloat'
```

At `Map`:

```
>>> [1: 'x', 2: 'y', 3: 'z']
>>> .valueType
'String'
```

At an association list:

```
>>> [1/2 -> 'one half', 1/3 -> 'one third']
>>> .valueType
'String'
```

* * *

See also: elementType, keyType, typeOf

Guides: Dictionary Functions, Reflection Functions

Categories: Reflection, Types
