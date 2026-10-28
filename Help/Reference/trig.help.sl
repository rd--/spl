# trig

- _trig(in=0, dur=0.1)_

Timed trigger.
When a non-positive to positive transition occurs at the input,
_trig_ outputs the level of the triggering input for the specified duration,
otherwise it outputs zero.
Any trigger received while the output is non-zero is ignored.

- in: trigger
- dur: duration of the trigger output

A dust signal occasionally triggers a gate be held open for one fifth of a second.

```
trig(dust(1), 0.2) * sinOsc(800, 0) * 0.5
```

The trigger signal also selects a random duration and frequency:

```
let tr = dust(2);
let d = tRand(0.2, 0.5, tr);
let f = tExpRand(220, 880, tr);
trig(tr, d) * sinOsc(f, 0) * 0.5
```

An impulse triggers more frequently than the duration resets:

```
trig(
	impulse(1, 0),
	2 - [0, 0.001]
) * sinOsc(800, 0) * 0.2
```

* * *

See also: trig1

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Trig.html)

Categories: Ugen
