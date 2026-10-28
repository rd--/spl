# pitchFollower

- _pitchFollower(in, initFreq=440, minFreq=60, maxFreq=4000, execFreq=100, maxBinsPerOctave=16, median=1, ampThreshold=0.01, peakThreshold=0.5, downSample=1, clar)_

Autocorrelation pitch follower.
Returns two signals, _freq_ and _hasFreq_.

This is a better pitch follower than `zeroCrossing`, but more costly of CPU.
For most purposes the default settings can be used and only in needs to be supplied.

Track sine oscillator:

```
let x = mouseX(220, 660, 0, 0.1);
let y = mouseY(0.01, 0.1, 0, 0.1);
let z = sinOsc(x, 0) * y;
let f = pitchFollower(
	z,
	440, 60, 4000, 100,
	16,
	7,
	0.02, 0.5,
	1, 0
);
[z, sinOsc(f.first / 2, 0) * 0.1]
```

Track audio input, __use headphones__:

```
let z = audioIn([1, 2]).sum;
let f = pitchFollower(
	z,
	440, 60, 4000, 100,
	16,
	7,
	0.02, 0.5,
	1, 0
);
let s = varSaw(
	f.first * [0.5, 1, 2],
	0,
	lfNoise1(0.3) * 0.1 + 0.1
) * 0.1;
6.timesRepeat {
	s := allpassN(
		s,
		0.040,
		{ rand(0, 0.04) } ! 2,
		2
	)
};
s
```

* * *

See also: amplitude

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pitch.html)

Categories: Ugen, Analysis
