# keyType

- _keyType(d)_

Answer the uniform `typeName` each key of the dictionary _d_,
else `nil`.

At `Record`:

```
>>> (x: 1, y: 2, z: 3).keyType
'String'
```

At `Map`:

```
>>> Map[1.0 -> 'x', 2.0 -> 'y', 3.0 -> 'z']
>>> .keyType
'Float'
```

A map that has keys of both `Float` and `Integer` has no key type:

```
>>> Map[1.0 -> 'x', 2L -> 'y'].keyType
nil
```

At an association list:

```
>>> [1/2 -> 'one half', 1/3 -> 'one third']
>>> .keyType
'Fraction'
```

At empty `Record`:

```
>>> Record().keyType
'String'
```

At empty `Map`:

```
>>> Map().keyType
nil
```

* * *

See also: elementType, typeName, valueType

Guides: Dictionary Functions, Reflection Functions
