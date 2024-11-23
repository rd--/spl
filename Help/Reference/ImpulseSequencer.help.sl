# ImpulseSequencer

- _ImpulseSequencer(sequence, trig)_

Clocked impulses.
Outputs a single sample impulse level from the sequence each time a trigger is received.

- sequence: the values in the array are output cyclically
- trig: step to next item when triggered

Use a pulse wave as a trigger:

```
let seq = { :index |
	let p = [
		1 0 0 1 0 0 1 0 0 0 1 0 1 0 0 0;
		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0;
		1 0.1 0.1 1 0.1 1 0.1 0.1;
		1 0 0.2 0 0.2 0 0.2 0
	];
	let dt = [0.3 0.3 0.25 0.5];
	Decay2(
		ImpulseSequencer(p[index], t),
		0.001,
		dt[index]
	)
};
let t = LfPulse(8, 0, 0.5);
[
	1.seq * SinOsc(1700, 0) * 0.1,
	2.seq * SinOsc(2400, 0) * 0.04,
	3.seq * BrownNoise() * 0.05,
	4.seq * SinOsc(100, 0) * 0.2
].Splay
```

* * *

See also: Sequencer

Categories: Ugen, Sequencing
