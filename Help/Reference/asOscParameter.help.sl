# asOscParameter

- _asOscParameter(x, t)_

The type letter _t_ can be inferred for numbers, strings and byte arrays.

At `Integer`:

```
>>> 23.asOscParameter.asRecord
(type: 'i', value: 23)
```

At `SmallFloat`:

```
>>> 3.141.asOscParameter.asRecord
(type: 'f', value: 3.141)
```

At `String`:

```
>>> 'text'.asOscParameter.asRecord
(type: 's', value: 'text')
```

At `ByteArray`:

```
>>> ByteArray[1 3 5]
>>> .asOscParameter
>>> .asRecord
(type: 'b', value: ByteArray[1 3 5])
```

* * *

See also: OscBundle, OscMessage, OscParameter

Guides: Protocol Functions

References:
_OpenSoundControl_
[1](https://opensoundcontrol.stanford.edu/spec-1_0.html)

Categories: Converting
