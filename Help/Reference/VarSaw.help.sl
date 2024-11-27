# VarSaw

- _VarSaw(freq=440, iphase=0, width=0.5)_

Variable duty `Saw`.

- freq: frequency in Hertz
- iphase: initial phase offset in cycles (0-1)
- width: duty cycle from zero to one

Modulate frequency and width:

```
VarSaw(
	LfPulse([3, 3.03], 0, 0.3) * 200 + 200,
	0,
	LfTri(1, 0) * 0.5 + 0.5
) * 0.1
```

Same but with static width:

```
VarSaw(
	LfPulse([3, 3.03], 0, 0.3) * 200 + 200,
	0,
	0.2
) * 0.1
```

Compare `VarSaw` and `LfPulse`:

```
let freq = LfPulse(3, 0, 0.3);
[
	LfPulse(freq * 200 + 200, 0, 0.2),
	VarSaw(freq * 200 + 200, 0, 0.2)
] * 0.1
```

* * *

See also: LfSaw, Saw, SyncSaw

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/VarSaw.html)

Categories: Ugen, Oscillator
