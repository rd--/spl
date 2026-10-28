# stepper

- _stepper(trig, reset=0, min=0, max=7, step=1, resetVal=min)_

pulse counter.
Each trigger increments a counter which is output as a signal.
The counter wraps between min and max.

- trig: step output on trigger.
- reset: resets the counter to resetval when triggered.
- min: minimum value of the counter.
- max: maximum value of the counter.
- step: step value each trigger. May be negative.
- resetVal: value to which the counter is reset when it receives a reset trigger. If nil, then this is patched to min.

Count by one from four up to sixteen:

```
sinOsc(
	stepper(
		impulse(10, 0),
		0,
		4,
		16,
		1,
		0
	) * 100,
	0
) * 0.05
```

Count by -3:

```
sinOsc(
	stepper(
		impulse(10, 0), 0, 4, 16, -3, 0
	) * 100,
	0
) * 0.05
```

Count by 4:

```
sinOsc(
	stepper(
		impulse(10, 0), 0, 4, 16, 4, 0
	) * 100,
	0
) * 0.05
```

Count by mouse control:

```
let x = mouseX(-9, 9, 0, 0.2);
sinOsc(
	stepper(
		impulse(10, 0), 0, 4, 16, x, 0
	) * 100,
	0
) * 0.05
```

Using `stepper` and `bufRd` for sequencing, mouse controls clock rate:

```
let b = [
	43 55 72 70 55 58 41 67
	41 60 55 39 58 55 43 51
].localBuf;
let rate = mouseX(1, 3, 1, 0.2);
let clock = impulse(rate, 0);
let env = decay2(clock, 0.002, 2.5);
let index = stepper(clock, 0, 0, 15, 1, 0);
let freq = bufRd(1, b, index, 1, 1).midiCps;
let lfreq = lag2(freq, 0.1) + [0, 0.3];
let ffreq = lag2(lfreq, 0.1) + [0, 0.3];
let lfo = sinOsc(
	0.2,
	[0, 0.5.pi]
) * 0.0024 + 0.0025;
let rvb = { :in |
	let c = combL(
		in,
		1,
		0.66 / rate,
		2
	) * 0.8 + in; /* echo */
	let z = c;
	5.timesRepeat {
		z := allpassN(
			z,
			0.05,
			{ rand(0, 0.05) } ! 2,
			rand(1.5, 2)
		)
	};
	c + (0.3 * z)
};
let out = lfPulse(
	lfreq * [1, 3 / 2, 2],
	0,
	0.3
).sum;
out := rlpf(out, ffreq, 0.3) * env;
out := rlpf(out, ffreq, 0.3) * env;
out := leakDc(rvb(out * 0.02), 0.995);
1.timesRepeat {
	out := delayL(out, 0.1, lfo) + out
}; /* flanger */
onePole(out, 0.9) * 0.5
```

* * *

See also: pulseCount

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Stepper.html)

Categories: Ugen
