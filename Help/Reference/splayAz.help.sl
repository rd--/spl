# splayAz

- _splayAz(numChans=4, inList, spread=1, level=1, width=2, center=0, orientation=0.5, levelComp=true)_

splayAz spreads an array of _inList.size_ channels across a ring of _numChans_ channels.
Optional spread and center controls, and equal power levelCompensation.
numChans and orientation are as in panAz.

Each of the inputs is evenly spaced over a cyclic period of 2 in pos with 0 equal to channel zero and 2 / _numChans_ equal to channel 1, 4 / _numChans_ equal to channel 2, &etc.

The distance between the input signals in the output range is determined by the spread argument.

- numChans: Number of output channels of the UGen
- inList: Input signals (can be a single UGen or an array)
- spread: How far the input signals are apart in the output. If zero, everything is mixed on center position (see below).
- level: Scaling for all signals
- width: Over how much of the channels each signal is distributed.
- center: Which of the channels will be the first channel
- orientation: Should be zero if the front is a vertex of the polygon.
The first speaker will be directly in front.
Should be 0.5 if the front bisects a side of the polygon.
Then the first speaker will be the one left of center.
- levelComp: If true, the signal level is adjusted to maintain overall loudness the same (n.reciprocal.sqrt).

With mouse control:

```
let numChannels = 8;
let numVoices = 16;
let inList = 1:numVoices.collect { :each |
	sinOsc(
		lfNoise2(
			rand(10, 20)
		) * 200 + (each * 100 + 400),
		0
	)
};
let spread = mouseY(1, 0, 0, 0.2);
let level = 0.2;
let width = 2;
let center = mouseX(-1, 1, 0, 0.2);
let orientation = 0.5;
let levelComp = true;
splayAz(
	numChannels,
	inList,
	spread,
	level,
	width,
	center,
	orientation,
	levelComp
)
```

* * *

See also: pan2, panAz, splay, splay2

Guides: Unit Generators

Categories: Panning
