# Trig1 -- timed trigger

_Trig1(in=0, dur=0.1)_

When a non-positive to positive transition occurs at the input,
_Trig_ outputs one for the specified duration,
otherwise it outputs zero.
Any trigger received while the output is non-zero is ignored.
A trigger happens when the signal changes from non-positive to positive.

- in: trigger
- dur: duration of the trigger output

A Dust signal occasionally triggers a gate be held open for one fifth of a second.

	Trig1(Dust(1), 0.2) * SinOsc(800, 0) * 0.1

The Dust signal also selects a random duration, frequency and amplitude:

	var i = Dust([2, 3]);
	var tr = Trig1(i, TRand([0.1, 0.01], 0.35, i));
	var f = TExpRand([220, 550], 880, tr);
	var a = TExpRand([0.1, 0.01], 0.25, tr);
	tr * SinOsc(f, 0) * a

* * *

See also: Trig
