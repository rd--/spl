# keyType

- _keyType(d)_

Answer the uniform `typeOf` each key of the dictionary _d_,
else `nil`.

At `Record`:

```
>>> (x: 1, y: 2, z: 3).keyType
'String'
```

At `Map`:

```
>>> [1: 'x', 2: 'y', 3: 'z']
>>> .keyType
'SmallFloat'
```

At an association list:

```
>>> [1/2 -> 'one half', 1/3 -> 'one third']
>>> .keyType
'Fraction'
```

At empty `Record`:

```
>>> ().keyType
'String'
```

At empty `Map`:

```
>>> Map().keyType
nil
```

* * *

See also: elementType, typeOf, valueType

Guides: Dictionary Functions, Reflection Functions

Categories: Reflection, Types
