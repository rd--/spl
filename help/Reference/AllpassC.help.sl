# AllpassC

- _AllpassC(in, maxDelayTime=0.2, delayTime=0.2, decayTime=1)_

All pass delay line.
`AllpassN` uses no interpolation,
`AllpassL` uses linear interpolation,
`AllpassC` uses cubic interpolation.

- in: the input signal.
- maxDelayTime: the maximum delay time in seconds.
  Used to initialize the delay buffer size.
- delayTime: delay time in seconds.
- decayTime: time for the echoes to decay by 60 decibels.
  If this time is negative then the feedback coefficient will be negative,
  thus emphasizing only odd harmonics at an octave lower.

The allpass delay has no audible effect as a resonator on steady state sound:

```
let z = WhiteNoise() * 0.1;
AllpassC(z, 0.01, XLine(0.0001, 0.01, 20), 0.2)
```

The examples below add the input to the effected sound so that you can hear the effect of the phase comb:

```
let z = WhiteNoise() * 0.1;
z + AllpassC(z, 0.01, XLine(0.0001, 0.01, 20), 0.2)
```

The interpolation schemes result in different signals.

Used as an echo this does not really sound different than _Comb_, but it outputs the input signal immediately (inverted) and the echoes are lower in amplitude.

```
AllpassC(
	Decay(Dust(1) * 0.5, 0.2) * WhiteNoise(),
	0.2,
	0.2,
	3
)
```

* * *

See also: AllpassL, AllpassN, CombC

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/AllpassC.html)

Categories: Ugen, Filter, Delay
