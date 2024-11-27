# OscBundle

- _OscBundle(time, messageList)_

An _Open Sound Control_ bundle consists of an _time_ and a (possibly empty) _messageList_.

```
>>> OscBundle(0, [OscMessage('/x', [])]).asRecord
(
	timeTag: (native: 0),
	packets: [(address: '/x', args: [])]
)
```

The `encode` method answers the binary encoding of the bundle as a `ByteArray`:

```
>>> OscBundle(0, [OscMessage('/x', [])]).encode
[
	35 98 117 110 100 108 101 0 131 170
	126 128 0 0 0 0 0 0 0 8
	47 120 0 0 44 0 0 0
].asByteArray
```

* * *

See also: encode, OscMessage, OscParameter

Categories: OpenSoundControl
