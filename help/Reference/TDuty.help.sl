# TDuty

- _TDuty(dur=1, reset=0, level=1)_

Demand results as trigger from demand rate Ugens.

A value is demanded of each Ugen in the list and output as a trigger,
according to a stream of duration values.
The unit generators in the list should be _demand_ rate.

When there is a trigger at the reset input,
the demand rate Ugens in the list and the duration are reset.

- dur: time values, the next level is acquired after duration
- reset: resets the list of Ugens and the duration Ugen when triggered.
- level: demand Ugen providing the output values

The reset input may also be a demand UGen, providing a stream of reset times.

Demand Ugen as durations:

```
let trig = TDuty(
	Drand(inf, [0.01 0.2 0.4 0.3]),
	0,
	Dseq(inf, [0.1 0.4 0.01 0.1 1])
);
Ringz(trig, 1000, 1) * 0.1
```

Control rate ugen as durations:

```
let trig = TDuty(
	MouseX(0.1, 0.5, 1, 0.2),
	0,
	Dseq(inf, [0.1 0.4 0.01 0.1 1])
);
Ringz(trig, 1000, 1) * 0.1
```

* * *

See also: Duty
