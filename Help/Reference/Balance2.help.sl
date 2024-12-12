# Balance2

- _Balance2(left, right, pos=0, level=1)_

`Balance2` is a stereo signal balancer.
Equal power panning balances two channels.
By panning from left (_pos = -1_) to right (_pos = 1_) you are decrementing the level of the left channel from 1 to 0 taking the square root of the linear scaling factor,
while at the same time incrementing the level of the right channel from 0 to 1 using the same curve.
In the center position (pos=0) this results in a level for both channels of 0.5.sqrt (~=0.707 or -3dB).
The output of `Balance2` remains a stereo signal.

Balance2 places the left input in the left channel and the right input in the right channel and applies independent multipliers to each channel.
When _pos_ is -1 only the left channel is heard, the multipliers are 1 and 0, i.e. × ⟦1, 0⟧
When _pos_ is +1 only the right channel is heard, the multipliers are 0 and 1, i.e. × ⟦0, 1⟧
When _pos_ is 0 the two channels are balanced and both multipliers are √½ (≈ 0.7), i.e. × ⟦√½, √½⟧

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
