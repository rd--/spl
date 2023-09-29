# Trig1 - timed trigger

_Trig1(in=0, dur=0.1)_

When a nonpositive to positive transition occurs at the input,
_Trig_ outputs one for the specified duration,
otherwise it outputs zero.
Any trigger received while the output is non-zero is ignored.
A trigger happens when the signal changes from non-positive to positive.

- in: trigger
- dur: duration of the trigger output

A Dust signal occasionally triggers a gate be held open for one fifth of a second.

	Trig1(Dust(1), 0.2) * SinOsc(800, 0) * 0.1

The trigger signal also selects a random duration, frequency and amplitude:

	var t = Dust([2, 3]);
	var d = TRand([0.1, 0.01], 0.35, t);
	var f = TExpRand([220, 550], 880, t);
	var a = TExpRand([0.1, 0.01], 0.25, t);
	Trig1(t, d) * SinOsc(f, 0) * a

* * *

See also: Trig
