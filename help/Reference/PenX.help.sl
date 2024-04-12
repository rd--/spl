# PenX

- _PenX(voiceNumber=1)_

Read _x_-coordinate of the first Pen to control the frequency of a sine tone oscillator:

```
SinOsc(PenX(1) * 555 + 333, 0) / 11
```

Read from two pens, `PenX` controls frequency, `PenY` stereo location and `PenZ` amplitude:

```
let k = [1, 2];
Pan2(
	SinOsc(PenX(k) * 555 + 333, 0),
	PenY(k) * 2 - 1,
	PenZ(k) * PenDown(k)
).Sum
```

* * *

See also: PenDown, PenY, PenZ
