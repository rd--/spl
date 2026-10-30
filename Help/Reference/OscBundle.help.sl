# OscBundle

- _OscBundle(t, [m₁ m₂ …])_

An _Open Sound Control_ bundle consists of a time _t_ and a (possibly empty) message list _m_.

The `encodeRecord` method answers the `Record` encoding of the bundle:

```
>>> let t = 0;
>>> let m = OscMessage('/x', []);
>>> let b = OscBundle(t, [m]);
>>> let r = b.encodeRecord;
>>> let j = r.encodeJson;
>>> (r, r = j.parseJson)
(
	(
		timeTag: (native: 0),
		packets: [(address: '/x', args: [])]
	),
	true
)
```

The `encode` method answers the binary encoding of the bundle as a `ByteArray`:

```
>>> let m = OscMessage('/x', []);
>>> OscBundle(0, [m]).encode
ByteArray[
	35 98 117 110 100 108 101 0 131 170
	126 128 0 0 0 0 0 0 0 8
	47 120 0 0 44 0 0 0
]
```

* * *

See also: OscMessage, OscParameter, encode

Guides: Protocol Functions

References:
_OpenSoundControl_
[1](https://opensoundcontrol.stanford.edu/spec-1_0.html)
