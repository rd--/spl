# xFade2

- _xFade2(inA, inB, pan=0, level=1)_

Equal power two channel cross fade.

- inA & inB: input signals
- pan: at -1 hear only _inA_, at +1 hear only _inB_
- level: multiplier

Cross-fade between sawtooth and sine osillators:

```
xFade2(
	saw(440),
	sinOsc(440, 0),
	lfTri(0.1, 0),
	0.1
)
```

Stereo (multiple-channel expansion):

```
xFade2(
	saw([440, 441]),
	sinOsc([440, 441], 0),
	lfTri(1 / [9, 10], 0),
	0.1
)
```

* * *

See also: balance2, linXFade2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/XFade2.html)

Categories: Ugen, Panning
