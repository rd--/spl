# penX

- _penX(voiceNumber=1)_

Read _x_-coordinate of the first pen to control the frequency of a sine tone oscillator:

```
sinOsc(penX(1) * 555 + 333, 0) / 11
```

Read from two pens, `penX` controls frequency, `penY` stereo location and `penZ` amplitude:

```
let k = [1 2];
pan2(
	sinOsc(penX(k) * 555 + 333, 0),
	penY(k) * 2 - 1,
	penZ(k) * penDown(k)
).sum
```

* * *

See also: penDown, penY, penZ

Guides: Unit Generators

Categories: Ugen
