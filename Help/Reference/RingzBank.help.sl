# RingzBank

- _RingzBank(input, freqList, ampList, timeList)_

Bank of resonators.
RingzBank (_Klank_) is a bank of fixed frequency resonators which can be used to simulate the resonant modes of an object. Each mode is given a ring time, which is the time for the mode to decay by 60 dB.

- input: the excitation input to the resonant filter bank.
- frequencies: a List of filter frequencies.
- amplitudes: a List of filter amplitudes. If _nil_ default to 1.
- ring times: a List of 60 dB decay times for the filters. If _nil_ default to 1.

Four resonant filters, default amplitudes and decay times:

```
RingzBank(
	Impulse(2, 0) * 0.1,
	[800, 1071, 1153, 1723],
	nil,
	nil
)
```

With dust input:

```
RingzBank(
	Dust(8) * 0.1,
	[800, 1071, 1153, 1723],
	nil,
	nil
)
```

With noise input:

```
RingzBank(
	PinkNoise() * 0.007,
	[800, 1071, 1153, 1723],
	nil,
	nil
)
```

With stereo input:

```
RingzBank(
	PinkNoise(0.005 # 2, 0),
	[200 671 1153 1723],
	nil,
	nil
)
```

With random frequencies input:

```
RingzBank(
	Decay(
		Impulse(4, 0),
		0.03
	) * ClipNoise() * 0.005,
	{ Rand(800, 4000) } ! 12,
	nil,
	{ Rand(0.1, 2) } ! 12
)
```

Texture of variation of above:

```
{ :tr |
	let z = Decay(
		Impulse(4, 0),
		TRand(0.03, 0.09, tr)
	) * ClipNoise() * 0.0025;
	let r = RingzBank(
		z,
		{ TRand(800, 4000, tr) } ! 12,
		nil,
		{ TRand(0.1, 2, tr) } ! 12
	);
	EqPan2(r, TRand(-1, 1, tr))
}.OverlapTexture(8, 3, 4).Mix
```

* * *

See also: Resonz, Ringz, SinOscBank

Categories: Filter
