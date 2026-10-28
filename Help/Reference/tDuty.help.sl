# tDuty

- _tDuty(dur=1, reset=0, level=1)_

demand results as trigger from demand rate Ugens.

A value is demanded of each Ugen in the list and output as a trigger,
according to a stream of duration values.
The unit generators in the list should be _demand_ rate.

When there is a trigger at the reset input,
the demand rate Ugens in the list and the duration are reset.

- dur: time values, the next level is acquired after duration
- reset: resets the list of Ugens and the duration Ugen when triggered.
- level: demand Ugen providing the output values

The reset input may also be a demand UGen, providing a stream of reset times.

demand Ugen as durations:

```
let trig = tDuty(
	drand(Infinity, [0.01 0.2 0.4 0.3]),
	0,
	dseq(Infinity, [0.1 0.4 0.01 0.1 1])
);
ringz(trig, 1000, 1) * 0.1
```

Control rate ugen as durations:

```
let trig = tDuty(
	mouseX(0.1, 0.5, 1, 0.2),
	0,
	dseq(Infinity, [0.1 0.4 0.01 0.1 1])
);
ringz(trig, 1000, 1) * 0.1
```

Duration sequence:

```
let b = [3 3 2 2 2 1 2 2 2] / 3;
tDuty(dseq(Infinity, b), 0, 1)
```

* * *

See also: duty

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TDuty.html)

Categories: Ugen
