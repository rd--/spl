# compander

- _compander(in, control, thresh=0.5, slopeBelow=1, slopeAbove=1, clampTime=0.01, relaxTime=0.1)_

Compressor, expander, limiter, gate, ducker.
General purpose (hard-knee) dynamics processor.

- in: The signal to be compressed / expanded / gated.
- control: The signal whose amplitude determines the gain applied to the input signal.
- thresh: Control signal amplitude threshold, which determines the break point between slopeBelow and slopeAbove.
- slopeBelow: slope of the amplitude curve below the threshold.
- slopeAbove: slope of the amplitude curve above the threshold.
- clampTime: The amount of time for the amplitude adjustment to be applied.
- relaxTime: The amount of time for the amplitude adjustment to be released.

<!-- If any of this is confusing, see <http://en.wikipedia.org/wiki/Audio_level_compression> -->

Example signal to process:

```
decay2(
	impulse(8, 0) * (
		lfSaw(0.3, 0) * -0.3 + 0.3
	),
	0.001,
	0.3
) * pulse([80, 81], 0.3).sum
```

Noise gate (keywords):

```
let z = decay2(
	impulse(8, 0) * (
		lfSaw(0.3, 0) * -0.3 + 0.3
	),
	0.001,
	0.3
) * pulse([80, 81], 0.3).sum;
compander(
	in: z,
	control: z,
	thresh: mouseX(0.1, 1, 0, 0.2),
	slopeBelow: 10,
	slopeAbove: 1,
	clampTime: 0.01,
	relaxTime: 0.01
)
```

Compressor (keywords):

```
let z = decay2(
	impulse(8, 0) * (
		lfSaw(0.3, 0) * -0.3 + 0.3
	),
	0.001,
	0.3
) * pulse([80, 81], 0.3).sum;
compander(
	in: z,
	control: z,
	thresh: mouseX(0.1, 1, 0, 0.2),
	slopeBelow: 1,
	slopeAbove: 0.5,
	clampTime: 0.01,
	relaxTime: 0.01
)
```

limiter (keywords):

```
let z = decay2(
	impulse(8, 0) * (
		lfSaw(0.3, 0) * -0.3 + 0.3
	),
	0.001,
	0.3
) * pulse([80, 81], 0.3).sum;
compander(
	in: z,
	control: z,
	thresh: mouseX(0.1, 1, 0, 0.2),
	slopeBelow: 1,
	slopeAbove: 0.1,
	clampTime: 0.01,
	relaxTime: 0.01
)
```

Sustainer (keywords):

```
let z = decay2(
	impulse(8, 0) * (
		lfSaw(0.3, 0) * -0.3 + 0.3
	),
	0.001,
	0.3
) * pulse([80, 81], 0.3).sum;
compander(
	in: z,
	control: z,
	thresh: mouseX(0.01, 0.15, 0, 0.2),
	slopeBelow: 1 / 3,
	slopeAbove: 1,
	clampTime: 0.01,
	relaxTime: 0.05
) * 0.5
```

* * *

See also: limiter

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Compander.html)

Categories: Ugen, amplitude
