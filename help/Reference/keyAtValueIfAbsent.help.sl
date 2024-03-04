# keyAtValueIfAbsent

- _keyAtValueIfAbsent(aDictionary, value, aBlock:/0)_

Answer the key that is the external name for the argument _value_ in _aDictionary_.
If there is none, evaluate and answer _aBlock_.

```
>>> (x: 1, y: 2, z: 3).keyAtValueIfAbsent(3) { nil }
'z'

>>> (x: 1, y: 2).keyAtValueIfAbsent(3) { nil }
nil
```

* * *

See also: keyAtValue

References:
_Smalltalk_
5.7.2.8

Categories: Accessing
