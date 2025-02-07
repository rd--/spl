# Vosim

- _Vosim(trig=0.1, freq=400, nCycles=1, decay=0.9)_

Vosim pulse generator.

- trig: starts a vosim pulse when a transition from non-positive to positive occurs and no other Vosim is still going
- freq: the frequency of the squared sinewave
- nCycles: the number of squared sinewaves to use in one vosim pulse.
- decay: the decay factor

Audio rate input will produce sample accurate triggering.
_nCycles_ is checked each time `Vosim` receives a trigger.

Mouse control of frequency:

```
Vosim(
	Impulse(110 + [-1 0 1], 0),
	MouseX([110 220 440], 880, 1, 0.2),
	[3 5 7],
	[0.77 0.88 0.99]
).Splay * 0.1
```

Noise modulation of frequency:

```
Vosim(
	Impulse(110 + [-1 0 1], 0),
	LinExp(
		LfNoise2([0.35 0.25 0.15]),
		-1, 1,
		[110 220 440], 880
	),
	[3 5 7],
	[0.77 0.88 0.99]
).Splay * 0.1
```

* * *

See also: Formant, Formlet

References:
_Csound_
[1](https://csound.com/docs/manual/vosim.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/VOSIM.html)

Categories: Ugen
