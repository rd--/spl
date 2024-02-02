# Dc -- constant

Create a constant amplitude signal.
This Ugen simply outputs the initial value you give it.

_Dc(in=0)_

- in: constant value to output, cannot be modulated, set at initialisation time

Silence:

	Dc(0)
​
Dc offset, will click on start and finish:

	SinOsc(440, 0) * 0.1 + Dc(0.5)

Note the transient before LeakDc adapts and suppresses the offset:

	LeakDc(Dc(0.5), 0.995)

Offset one random sine tone by one silent channel:

	[Dc(0), SinOsc(Rand(200, 400), 0) * 0.1]

* * *

See also: LeakDc, Silent
