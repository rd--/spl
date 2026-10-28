# balance2

- _balance2(left, right, pos=0, level=1)_

`balance2` is a stereo signal balancer,
it applies equal power rules to balance two channels.
`balance2` places the left input in the left channel,
the right input in the right channel,
and applies independent multipliers to each channel.
The output of `balance2` remains a stereo signal.

When _pos_ is -1 the multipliers are ⟦1, 0⟧,
when _pos_ is +1 the multipliers are ⟦0, 1⟧,
when _pos_ is 0 the multipliers are ⟦√½, √½⟧.

Pan sweep from left to right:

```
balance2(
	sinOsc(440, 0),
	sinOsc(1000, 0),
	line(-1, 1, 5),
	0.1
)
```

In this program two sine oscillators (at 440 and 550 hz) are balanced using a low frequency noise generator.

```
let o = sinOsc([440, 550], 0);
balance2(
	o.first,
	o.second,
	lfNoise1(4),
	0.1
)
```

* * *

See also: pan2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Balance2.html)

Categories: Panning
