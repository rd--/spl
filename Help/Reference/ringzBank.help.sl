# ringzBank

- _ringzBank(input, freqList, ampList, timeList)_

Bank of resonators.
ringzBank (_klank_) is a bank of fixed frequency resonators which can be used to simulate the resonant modes of an object. Each mode is given a ring time, which is the time for the mode to decay by 60 dB.

- input: the excitation input to the resonant filter bank.
- frequencies: a List of filter frequencies.
- amplitudes: a List of filter amplitudes. If _nil_ default to 1.
- ring times: a List of 60 dB decay times for the filters. If _nil_ default to 1.

Four resonant filters, default amplitudes and decay times:

```
ringzBank(
	impulse(2, 0) * 0.1,
	[800, 1071, 1153, 1723],
	nil,
	nil
)
```

With dust input:

```
ringzBank(
	dust(8) * 0.1,
	[800, 1071, 1153, 1723],
	nil,
	nil
)
```

With noise input:

```
ringzBank(
	pinkNoise() * 0.007,
	[800, 1071, 1153, 1723],
	nil,
	nil
)
```

With stereo input:

```
ringzBank(
	pinkNoise([0.005] # 2, 0),
	[200 671 1153 1723],
	nil,
	nil
)
```

With random frequencies input:

```
ringzBank(
	decay(
		impulse(4, 0),
		0.03
	) * clipNoise() * 0.005,
	{ rand(800, 4000) } ! 12,
	nil,
	{ rand(0.1, 2) } ! 12
)
```

Texture of variation of above:

```
{ :tr |
	let z = decay(
		impulse(4, 0),
		tRand(0.03, 0.09, tr)
	) * clipNoise() * 0.0025;
	let r = ringzBank(
		z,
		{ tRand(800, 4000, tr) } ! 12,
		nil,
		{ tRand(0.1, 2, tr) } ! 12
	);
	eqPan2(r, tRand(-1, 1, tr))
}.overlapTexture(8, 3, 4).mix
```

* * *

See also: resonz, ringz, sinOscBank

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Klank.html)

Categories: Filter
