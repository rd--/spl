# PitchShift

- _PitchShift(in, windowSize=0.2, pitchRatio=1, pitchDispersion=0, timeDispersion=0)_

Granular pitch shifter.
A time domain granular pitch shifter.
Grains have a triangular amplitude envelope and an overlap of 4:1.

- in: input signal
- windowSize: fixed size of the grain window in seconds
- pitchRatio: ratio of the pitch shift in _(0, 4)_
- pitchDispersion: maximum random deviation of the pitch from the _pitchRatio_
- timeDispersion: a random offset between zero and this value is added to the delay of each grain

The use of _timeDispersion_ can alleviate comb filter effects due to uniform grain placement.
_timeDispersion_ can be no larger than windowSize.

Modulate pitch ratio:

```
let z = Blip(800, 6) * 0.1;
PitchShift(
	z,
	0.02,
	Line(0.1, 4, 20),
	0,
	0.0001
)
```

Pitch shift input. __Use headphones__ to prevent feedback:

```
PitchShift(
	in: AudioIn([1, 2]),
	windowSize: 0.1,
	pitchRatio: MouseX(0, 2),
	pitchDispersion: 0,
	timeDispersion: 0.004
)
```

Use PitchShift to granulate input.
Use headphones to prevent feedback.
Upper left corner is normal playback.
`MouseX` controls pitch dispersion,
`MouseY` controls time dispersion.

```
let grainSize = 0.5;
PitchShift(
	in: AudioIn([1, 2]),
	windowSize: grainSize,
	pitchRatio: 1,
	pitchDispersion: MouseX(0, 1),
	timeDispersion: MouseY(0, grainSize)
)
```

* * *

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PitchShift.html)

Categories: Ugen
