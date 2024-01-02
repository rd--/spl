# PulseCount -- pulse counter

_PulseCount(trig=0, reset=0)_

Each trigger increments a counter which is output as a signal.

- trig: trigger
- reset: resets the counter to zero when triggered.

Pulse count as frequency input:

	var count = PulseCount(Impulse(10, 0), Impulse(0.4, 0));
	SinOsc(count * 200, 0) * 0.05

* * *

See also: Stepper
