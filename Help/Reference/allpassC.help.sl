# allpassC

- _allpassC(in, maxDelayTime=0.2, delayTime=0.2, decayTime=1)_

All pass delay line.
`allpassN` uses no interpolation,
`allpassL` uses linear interpolation,
`allpassC` uses cubic interpolation.

- in: the input signal
- maxDelayTime: the maximum delay time in seconds, used to initialize the delay buffer size
- delayTime: delay time in seconds
- decayTime: time for the echoes to decay by 60 decibels

If _decayTime_ is negative then the feedback coefficient will be negative,
thus emphasizing only odd harmonics at an octave lower

The allpass delay has no audible effect as a resonator on steady state sound:

~~~spl syn=A
allpassC(
	whiteNoise() * 0.1,
	0.01,
	xLine(0.0001, 0.01, 20),
	0.2
)
~~~

The examples below add the input to the effected sound so that you can hear the effect of the phase comb:

~~~spl syn=B
let z = whiteNoise() * 0.1;
z + allpassC(
	z,
	0.01,
	xLine(0.0001, 0.01, 20),
	0.2
)
~~~

The interpolation schemes result in different signals.

Used as an echo this does not really sound different than _Comb_,
but it outputs the input signal immediately (inverted) and the echoes are lower in amplitude.

~~~spl syn=C
allpassC(
	decay(
		dust(1) * 0.5,
		0.2
	) * whiteNoise(),
	0.2,
	0.2,
	3
)
~~~

* * *

See also: allpassL, allpassN, combC

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/AllpassC.html)

Categories: Ugen, Filter, Delay
