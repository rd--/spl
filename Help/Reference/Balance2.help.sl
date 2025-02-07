# Balance2

- _Balance2(left, right, pos=0, level=1)_

`Balance2` is a stereo signal balancer,
it applies equal power rules to balance two channels.
`Balance2` places the left input in the left channel,
the right input in the right channel,
and applies independent multipliers to each channel.
The output of `Balance2` remains a stereo signal.

When _pos_ is -1 the multipliers are ⟦1, 0⟧,
when _pos_ is +1 the multipliers are ⟦0, 1⟧,
when _pos_ is 0 the multipliers are ⟦√½, √½⟧.

Pan sweep from left to right:

```
Balance2(
	SinOsc(440, 0),
	SinOsc(1000, 0),
	Line(-1, 1, 5),
	0.1
)
```

In this program two sine oscillators (at 440 and 550 hz) are balanced using a low frequency noise generator.

```
let o = SinOsc([440, 550], 0);
Balance2(
	o.first,
	o.second,
	LfNoise1(4),
	0.1
)
```

* * *

See also: Pan2

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Balance2.html)

Categories: Panning
