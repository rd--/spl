# saw

- _saw(freq=440)_

Band limited sawtooth wave generator.

- freq: frequency in Hertz

Modulating the frequency:

```
saw(xLine(40, 4000, 6)) * 0.1
```

Two band limited sawtooth waves through a resonant low pass filter:

```
rlpf(
	saw([100, 250]) * 0.1,
	xLine(8000, 400, 5),
	0.05
)
```

* * *

See also: lfSaw, pulse, syncSaw, varSaw

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Saw.html)

Categories: Ugen
