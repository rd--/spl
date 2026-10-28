# panAz

- _panAz(numChans, in, pos=0, level=1, width=2, orientation=0.5)_

Azimuth panner.
Two channel equal power panner.

- numChans: number of output channels
- in: input signal
- pos: pan position
- level: control rate level input
- width: width of panning envelope
- orientation: specifies speaker orientation

Channels are evenly spaced over a cyclic period of two.
All channels will be cyclically panned through if _pos_ is a sawtooth signal in _(-1, 1)_.

A _width_ value of two pans between pairs of adjacent speakers.
Width values greater than two will spread the pan over greater numbers of speakers.
Width values less than one will leave silent gaps between speakers.

_orientation_ should be zero if the front is a vertex of the polygon,
the first speaker will be directly in front,
and should be 0.5 if the front bisects a side of the polygon,
in which case the first speaker will be the one left of center.

Eight channel circular panning:

```
panAz(
	8,
	pinkNoise(),
	lfSaw(mouseX(1 / 5, 5, 1, 0.2), 0),
	0.1,
	2,
	0
)
```

panAz used to balance _k_ signals,
mouse controls freqency (of position oscillator) and width parameters.

```
let k = 8;
let i = sinOsc(
	{ rand(333, 555) } ! k,
	0
) * 0.1;
let g = panAz(
	k,
	dc(1),
	lfSaw(mouseX(1 / 5, 5, 1, 0.2), 0),
	1,
	mouseY(1, 3, 0, 0.2),
	0
);
i * g
```

Three signals Az panned across distinct rings (horizontal),
then balanced by a further Az panner (vertical):

```
let i = hpf(
	pinkNoise(),
	[1111, 333, 55]
) * 0.1;
let p = panAz(
	[8, 4, 4],
	i,
	lfSaw(mouseX(1 / 5, 5, 1, 0.2), 0),
	1,
	1,
	[0, 0.5, 0.5]
);
let g = panAz(
	3,
	dc(1),
	mouseY(-2 / 3, 2 / 3, 0, 0.2),
	1,
	mouseX(1, 3, 0, 0.2),
	0
);
(p * g).mix * 4
```

* * *

See also: panB2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PanAz.html)

Categories: Ugen
