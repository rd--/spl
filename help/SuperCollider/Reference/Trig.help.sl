# Trig -- timed trigger

_Trig(in=0, dur=0.1)_

When a non-positive to positive transition occurs at the input,
_Trig_ outputs the level of the triggering input for the specified duration,
otherwise it outputs zero.
Any trigger received while the output is non-zero is ignored.
A trigger happens when the signal changes from non-positive to positive.

- in: trigger
- dur: duration of the trigger output

A Dust signal occasionally triggers a gate be held open for one fifth of a second.

	Trig(Dust(1), 0.2) * SinOsc(800, 0) * 0.5

The trigger signal also selects a random duration and frequency:

	var tr = Dust(2);
	var d = TRand(0.2, 0.5, tr);
	var f = TExpRand(220, 880, tr);
	Trig(tr, d) * SinOsc(f, 0) * 0.5

An Impulse triggers more frequently than the duration resets:

	Trig(Impulse(1, 0), 2 - [0, 0.001]) * SinOsc(800, 0) * 0.2

* * *

See also: Trig1
