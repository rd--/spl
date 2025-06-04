# Saw

- _Saw(freq=440)_

Band limited sawtooth wave generator.

- freq: frequency in Hertz

Modulating the frequency:

```
Saw(XLine(40, 4000, 6)) * 0.1
```

Two band limited sawtooth waves through a resonant low pass filter:

```
Rlpf(
	Saw([100, 250]) * 0.1,
	XLine(8000, 400, 5),
	0.05
)
```

* * *

See also: LfSaw, Pulse, SyncSaw, VarSaw

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Saw.html)

Categories: Ugen
