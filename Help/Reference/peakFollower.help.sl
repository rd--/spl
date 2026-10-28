# peakFollower

- _peakFollower(in, decay)_

Track peak signal amplitude.
Outputs the peak amplitude of the signal received at the input.
If level is below maximum, the level decreases by the factor given in decay.

- in: input signal.
- decay: decay factor.

Internally, the absolute value of the signal is used, to prevent underreporting the peak value if there is a negative dc offset.
To obtain the minimum and maximum values of the signal as is, use the `runningMin` and `runningMax` Ugens.

No decay:

```
let peak = peakFollower(
	dust(20) * line(0, 1, 4),
	1
);
sinOsc(peak * 1500 + 200, 0) * 0.1
```

A little decay:

```
let peak = peakFollower(
	dust(20) * line(0, 1, 4),
	0.999
);
sinOsc(peak * 1500 + 200, 0) * 0.1
```

Mouse controls decay:

```
let x = mouseX(0.99, 1.00001, 0, 0.1);
let peak = peakFollower(
	dust(20) * line(0, 1, 4),
	x.min(1)
);
sinOsc(peak * 1500 + 200, 0) * 0.1
```

Follow a sine lfo, decay controlled by mouse:

```
let decay = mouseX(0, 1.1, 0, 0.1).min(1);
let peak = peakFollower(
	sinOsc(0.2, 0),
	decay
);
sinOsc(peak * 200 + 500, 0) * 0.1
```

* * *

See also: amplitude, peak

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PeakFollower.html)

Categories: Ugen
