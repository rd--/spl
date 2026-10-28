# combC

- _combC(in, maxDelayTime=0.2, delayTime=0.2, decayTime=1)_

Comb filter.
Comb delay line.
`combN` uses no interpolation,
`combL` uses linear interpolation,
`combC` uses cubic interpolation.

- in: the input signal.
- maxdelaytime: the maximum delay time in seconds. used to initialize the delay buffer size.
- delaytime: delay time in seconds.
- decaytime: time for the echoes to decay by 60 decibels. If this time is negative then the feedback coefficient will be negative, thus emphasizing only odd harmonics at an octave lower.

Comb used as a resonator. The resonant fundamental is equal to reciprocal of the delay time.

```
let z = whiteNoise() * 0.01;
combC(
	z,
	0.01,
	xLine(0.0001, 0.01, 20),
	0.2
)
```

With negative feedback:

```
let z = whiteNoise() * 0.01;
combC(
	z,
	0.01,
	xLine(0.0001, 0.01, 20),
	-0.2
)
```

Used as an echo:

```
let z = decay(
	dust(1) * 0.5,
	0.2
) * whiteNoise();
combC(z, 0.2, 0.2, 3)
```

* * *

See also: allpassC, combL

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/CombC.html),
_W_
[1](https://en.wikipedia.org/wiki/Comb_filter)

Categories: Ugen, Filter
