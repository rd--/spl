# OscMessage

- _OscMessage(address, parameterList)_

An _Open Sound Control_ message consists of an _address_ string and a (possibly empty) _parameterList_.

```
>>> OscMessage('/x', []).asRecord
(address: '/x', args: [])

>>> OscMessage('/y', [3.141]).asRecord
(address: '/y', args: [(type: 'f', value: 3.141)])
```

* * *

See also: OscParameter

Categories: OpenSoundControl
