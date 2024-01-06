# Gate -- gate or hold

_Gate(in=0, gate=0)_

Allows input signal value to pass when gate is positive, otherwise holds last value.

- in: input signal
- gate: can be any signal, the output is held fixed when this is non-positive

Frequency is a random curve for a quarter of a cycle and a held tone for the remainder:

	let gatedNoise = Gate(
		LfNoise2(4),
		LfPulse(4 / 3, 0, 1 / 4)
	);
	SinOsc(gatedNoise * 100 + 200, 0) * 0.1

* * *

See also: Latch
