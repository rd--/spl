# OscParameter

- _OscParameter(typeString, anObject)_

An _Open Sound Control_ parameter consists of a _typeLetter_ and a _value_.
The type letters are:

- _b_: byte array
- _i_: integer
- _f_: float (32-bit)
- _s_: string

```
>>> OscParameter('i', 23).asRecord
(type: 'i', value: 23)

>>> OscParameter('f', 3.141).asRecord
(type: 'f', value: 3.141)
```

* * *

See also: asOscParameter, OscBundle, OscMessage

Categories: OpenSoundControl
