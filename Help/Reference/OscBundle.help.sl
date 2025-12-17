# OscBundle

- _OscBundle(t, [m₁ m₂ …])_

An _Open Sound Control_ bundle consists of a time _t_ and a (possibly empty) message list _m_.

```
>>> let t = 0;
>>> let m = OscMessage('/x', []);
>>> OscBundle(t, [m]).asRecord
(
	timeTag: (native: 0),
	packets: [(address: '/x', args: [])]
)
```

The `encode` method answers the binary encoding of the bundle as a `ByteArray`:

```
>>> let m = OscMessage('/x', []);
>>> OscBundle(0, [m]).encode
[
	35 98 117 110 100 108 101 0 131 170
	126 128 0 0 0 0 0 0 0 8
	47 120 0 0 44 0 0 0
].asByteArray
```

* * *

See also: encode, OscMessage, OscParameter

Guides: Protocol Functions

Categories: OpenSoundControl
