# varSaw

- _varSaw(freq=440, iphase=0, width=0.5)_

Variable duty `saw`.

- freq: frequency in Hertz
- iphase: initial phase offset in cycles (0-1)
- width: duty cycle from zero to one

Modulate frequency and width:

```
varSaw(
	lfPulse([3, 3.03], 0, 0.3) * 200 + 200,
	0,
	lfTri(1, 0) * 0.5 + 0.5
) * 0.1
```

Same but with static width:

```
varSaw(
	lfPulse([3, 3.03], 0, 0.3) * 200 + 200,
	0,
	0.2
) * 0.1
```

Compare `varSaw` and `lfPulse`:

```
let freq = lfPulse(3, 0, 0.3);
[
	lfPulse(freq * 200 + 200, 0, 0.2),
	varSaw(freq * 200 + 200, 0, 0.2)
] * 0.1
```

* * *

See also: lfSaw, saw, syncSaw

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/VarSaw.html)

Categories: Ugen, Oscillator
