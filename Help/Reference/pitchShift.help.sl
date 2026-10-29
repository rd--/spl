# pitchShift

- _pitchShift(in, windowSize=0.2, pitchRatio=1, pitchDispersion=0, timeDispersion=0)_

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

~~~spl syn=A
let z = blip(800, 6) * 0.1;
pitchShift(
	z,
	0.02,
	line(0.1, 4, 20),
	0,
	0.0001
)
~~~

Pitch shift input. __Use headphones__ to prevent feedback:

~~~spl syn=B
pitchShift(
	in: audioIn([1, 2]),
	windowSize: 0.1,
	pitchRatio: mouseX(0, 2),
	pitchDispersion: 0,
	timeDispersion: 0.004
)
~~~

Use pitchShift to granulate input.
Use headphones to prevent feedback.
Upper left corner is normal playback.
`mouseX` controls pitch dispersion,
`mouseY` controls time dispersion.

~~~spl syn=C
let grainSize = 0.5;
pitchShift(
	in: audioIn([1, 2]),
	windowSize: grainSize,
	pitchRatio: 1,
	pitchDispersion: mouseX(0, 1),
	timeDispersion: mouseY(0, grainSize)
)
~~~

* * *

See also: freqShift

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PitchShift.html)

Categories: Ugen
