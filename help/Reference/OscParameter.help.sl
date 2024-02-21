# OscParameter

- _OscParameter(aNumber)_
- _OscParameter(aString)_
- _OscParameter(aByteArray)_
- _OscParameter(typeString, anObject)_

An _Open Sound Control_ parameter consists of a _type_ string and a value.

Type strings can be inferred for numbers, strings and byte arrays.

```
>>> OscParameter(23).asRecord
(type: 'i', value: 23)

>>> OscParameter(3.141).asRecord
(type: 'f', value: 3.141)
```

* * *

Categories: OpenSoundControl
