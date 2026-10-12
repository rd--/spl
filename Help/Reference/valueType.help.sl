# valueType

- _valueType(d)_

Answer the uniform `typeOf` each `value` of the dictionary _d_,
else `nil`.

At `Record`:

```
>>> let a = (x: 1, y: 2, z: 3);
>>> (a.keyType, a.valueType, a.elementType)
('String', 'SmallFloat', 'SmallFloat')

>>> (x: 1, y: 2/3).valueType
nil
```

At `Map`:

```
>>> let a = Map[1 -> 'x', 2 -> 'y', 3 -> 'z'];
>>> (a.keyType, a.valueType, a.elementType)
('SmallFloat', 'String', 'String')

>>> Map[1 -> 2, 3 -> 4/5].valueType
nil
```

At an association list:

```
>>> let a = [1/2 -> 'one half', 1/3 -> 'one third'];
>>> (a.keyType, a.valueType, a.elementType)
('Fraction', 'String', 'Association')

>>> [1 -> 2, 3 -> 4/5].valueType
nil
```

* * *

See also: elementType, keyType, typeOf

Guides: Dictionary Functions, Reflection Functions

Categories: Reflection, Types
