# Trig1

Timed trigger.

_Trig1(in=0, dur=0.1)_

When a non-positive to positive transition occurs at _in_,
_Trig1_ outputs one for the specified _dur_ seconds,
otherwise it outputs zero.
Any trigger received while the output is non-zero is ignored.

- in: trigger, cf. [What is a Trigger]
- dur: duration of the trigger output

A Dust signal occasionally triggers a gate be held open for one fifth of a second.

```
Trig1(Dust(1), 0.2) * SinOsc(800, 0) * 0.1
```

The Dust signal also selects a random duration, frequency and amplitude:

```
let i = Dust([2, 3]);
let tr = Trig1(i, TRand([0.1, 0.01], 0.35, i));
let f = TExpRand([220, 550], 880, tr);
let a = TExpRand([0.1, 0.01], 0.25, tr);
tr.Lag(0.05) * SinOsc(f, 0) * a
```

* * *

See also: Trig

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Trig1.html)
