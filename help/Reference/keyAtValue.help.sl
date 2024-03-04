# keyAtValue

- _keyAtValue(aDictionary, value)_

Answer the key that is the external name for the argument _value_ in _aDictionary_.
If there is none, signal an `error`.
This is the `Dictionary` form of the `indexOf` method at `Indexable`.

```
>>> (x: 1, y: 2, z: 3).keyAtValue(3)
'z'

>>> { (x: 1, y: 2).keyAtValue(3) }.ifError { true }
true
```

* * *

See also: keyAtValueIfAbsent, indexOf

References:
_Smalltalk_
5.7.2.8

Categories: Accessing
