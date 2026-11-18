# valueType

- _valueType(d)_

Answer the uniform `typeName` each `value` of the dictionary _d_,
else `nil`.

At `Record`:

```
>>> let a = (x: 1.0, y: 2.0, z: 3.0);
>>> (a.keyType, a.valueType, a.elementType)
('String', 'Float', 'Float')

>>> (x: 1, y: 2/3).valueType
nil
```

At `Map`:

```
>>> let a = Map[1L -> 'x', 2L -> 'y', 3L -> 'z'];
>>> (a.keyType, a.valueType, a.elementType)
('Integer', 'String', 'String')

>>> Map[1L -> 2.0, 3L -> 4/5].valueType
nil
```

At an association list:

```
>>> let a = [1/2 -> 'one half', 1/3 -> 'one third'];
>>> (a.keyType, a.valueType, a.elementType)
('Fraction', 'String', 'Association')

>>> [1 -> 2L, 3 -> 4/5].valueType
nil
```

* * *

See also: elementType, keyType, typeName

Guides: Dictionary Functions, Reflection Functions
