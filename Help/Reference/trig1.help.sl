# trig1

- _trig1(in=0, dur=0.1)_

Timed trigger.
When a non-positive to positive transition occurs at _in_,
_trig1_ outputs one for the specified _dur_ seconds,
otherwise it outputs zero.
Any trigger received while the output is non-zero is ignored.

- in: trigger, c.f. `What is a Trigger`
- dur: duration of the trigger output

A dust signal occasionally triggers a gate be held open for one fifth of a second.

~~~spl syn=A
trig1(dust(1), 0.2) * sinOsc(800, 0) * 0.1
~~~

The dust signal also selects a random duration, frequency and amplitude:

~~~spl syn=B
let i = dust([2, 3]);
let tr = trig1(i, tRand([0.1, 0.01], 0.35, i));
let f = tExpRand([220, 550], 880, tr);
let a = tExpRand([0.1, 0.01], 0.25, tr);
tr.lag(0.05) * sinOsc(f, 0) * a
~~~

* * *

See also: trig

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Trig1.html)

Categories: Ugen
