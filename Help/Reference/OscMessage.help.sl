# OscMessage

- _OscMessage(address, parameterList)_

An _Open Sound Control_ message consists of an _address_ `String` and a (possibly empty) _parameterList_.

```
>>> OscMessage('/x', []).asRecord
(
	address: '/x',
	args: []
)

>>> OscMessage('/y', [3.141]).asRecord
(
	address: '/y',
	args: [
		(type: 'f', value: 3.141)
	]
)
```

The `encode` method answers the binary encoding of the message as a `ByteArray`:

```
>>> OscMessage('/x', []).encode
[47 120 0 0 44 0 0 0].asByteArray

>>> OscMessage('/y', [3.141]).encode
[47 121 0 0 44 102 0 0 64 73 6 37]
.asByteArray
```

* * *

See also: asRecord, encode, OscBundle, OscParameter

Categories: OpenSoundControl
