# Pitch

- _Pitch(in, initFreq=440, minFreq=60, maxFreq=4000, execFreq=100, maxBinsPerOctave=16, median=1, ampThreshold=0.01, peakThreshold=0.5, downSample=1, clar)_

Autocorrelation pitch follower.
Returns two signals, _freq_ and _hasFreq_.

This is a better pitch follower than `ZeroCrossing`, but more costly of CPU.
For most purposes the default settings can be used and only in needs to be supplied.

Track sine oscillator:

```
let x = MouseX(220, 660, 0, 0.1);
let y = MouseY(0.01, 0.1, 0, 0.1);
let z = SinOsc(x, 0) * y;
let f = Pitch(
	z,
	440, 60, 4000, 100,
	16,
	7,
	0.02, 0.5,
	1, 0
);
[z, SinOsc(f.first / 2, 0) * 0.1]
```

Track audio input, __use headphones__:

```
let z = AudioIn([1, 2]).Sum;
let f = Pitch(
	z,
	440, 60, 4000, 100,
	16,
	7,
	0.02, 0.5,
	1, 0
);
let s = VarSaw(
	f.first * [0.5, 1, 2],
	0,
	LfNoise1(0.3) * 0.1 + 0.1
) * 0.1;
6.timesRepeat {
	s := AllpassN(
		s,
		0.040,
		{ Rand(0, 0.04) } ! 2,
		2
	)
};
s
```

* * *

See also: Amplitude

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pitch.html)

Categories: Ugen, Analysis
