# OscParameter

- _OscParameter(aString, anObject)_

An _Open Sound Control_ parameter consists of a _type letter_ and a _value_.
The type letters are:

- _b_: byte array
- _i_: integer (32-bit, signed)
- _f_: float (32-bit)
- _s_: string

```
>>> OscParameter('i', 23).asRecord
(type: 'i', value: 23)

>>> OscParameter('f', 3.141).asRecord
(type: 'f', value: 3.141)
```

There is also a set of standard non-standard type letters:

- _h_: integer (64-bit, signed)
- _d_: float (64-bit)
- _m_: midi message (4-byte)

* * *

See also: asOscParameter, asRecord, OscBundle, OscMessage

References:
_OpenSoundControl_
[1](https://opensoundcontrol.stanford.edu/spec-1_0.html)

Categories: OpenSoundControl
