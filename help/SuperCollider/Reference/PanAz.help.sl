# PanAz -- azimuth panner

_PanAz(numChans, in, pos=0, level=1, width=2, orientation=0.5)_

Two channel equal power panner.

- numChans: number of output channels
- in: input signal
- pos: pan position. Channels are evenly spaced over a cyclic period of 2.0 in pos with 0.0 equal to channel zero and 2.0/numChans equal to channel 1, 4.0/numChans equal to channel 2, etc. Thus all channels will be cyclically panned through if a sawtooth wave from -1 to +1 is used to
modulate the pos.
- level: a control rate level input.
- width: The width of the panning envelope. Nominally this is 2.0 which pans between pairs of adjacent speakers. Width values greater than two will spread the pan over greater numbers of speakers. Width values less than one will leave silent gaps between speakers.
- orientation: Should be zero if the front is a vertex of the polygon. The first speaker will be directly in front. Should be 0.5 if the front bisects a side of the polygon. Then the first speaker will be the one left of center.

Eight channel circular panning:

	PanAz(
		8,
		PinkNoise(),
		LfSaw(MouseX(1 / 5, 5, 1, 0.2), 0),
		0.1,
		2,
		0
	)

PanAz used to balance _k_ signals,
mouse controls freqency (of position oscillator) and width parameters.

```
var k = 8;
var i = SinOsc({ Rand(333, 555) } ! k, 0) * 0.1;
var g = PanAz(k, Dc(1), LfSaw(MouseX(1 / 5, 5, 1, 0.2), 0), 1, MouseY(1, 3, 0, 0.2), 0);
i * g
```

Three signals Az panned across distinct rings (horizontal),
then balanced by a further Az panner (vertical):

```
var i = Hpf(PinkNoise(), [1111, 333, 55]) * 0.1;
var p = PanAz([8, 4, 4], i, LfSaw(MouseX(1 / 5, 5, 1, 0.2), 0), 1, 1, [0, 0.5, 0.5]);
var g = PanAz(3, Dc(1), MouseY(-2 / 3, 2 / 3, 0, 0.2), 1, MouseX(1, 3, 0, 0.2), 0);
(p * g).Mix * 4
```

* * *

See also: PanB2
