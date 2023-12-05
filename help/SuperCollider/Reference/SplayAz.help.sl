# SplayAz -- panning

Spreads an array of _n_ channels across a ring of _k_ channels.

_SplayAz(numChans=4, inArray, spread=1, level=1, width=2, center=0, orientation=0.5, levelComp=true)_

SplayAz spreads an array of _inArray.size_ channels across a ring of _numChans_ channels.
Optional spread and center controls, and equal power levelCompensation.
numChans and orientation are as in PanAz.

Each of the inputs is evenly spaced over a cyclic period of 2 in pos with 0 equal to channel zero and 2 / _numChans_ equal to channel 1, 4 / _numChans_ equal to channel 2, &etc.

The distance between the input signals in the output range is determined by the spread argument.

- numChans: Number of output channels of the UGen
- inArray: Input signals (can be a single UGen or an array)
- spread: How far the input signals are apart in the output. If zero, everything is mixed on center position (see below).
- level: Scaling for all signals
- width: Over how much of the channels each signal is distributed.
_ center: Which of the channels will be the first channel
- orientation: Should be zero if the front is a vertex of the polygon.
  The first speaker will be directly in front.
  Should be 0.5 if the front bisects a side of the polygon.
  Then the first speaker will be the one left of center.
- levelComp: If true, the signal level is adjusted to maintain overall loudness the same (n.reciprocal.sqrt).

With mouse control:

```
var numChannels = 8;
var numVoices = 16;
var inArray = (1 .. numVoices).collect { :each |
	SinOsc(LfNoise2(Rand(10, 20)) * 200 + (each * 100 + 400), 0)
};
var spread = MouseY(1, 0, 0, 0.2);
var level = 0.2;
var width = 2;
var center = MouseX(-1, 1, 0, 0.2);
var orientation = 0.5;
var levelComp = true;
SplayAz(
	numChannels,
	inArray,
	spread,
	level,
	width,
	center,
	orientation,
	levelComp
)
```

* * *

See also: Pan2, PanAz, Splay, Splay2
