# impulseSequencer

- _impulseSequencer(sequence, trig)_

Clocked impulses.
Outputs a single sample impulse level from the sequence each time a trigger is received.

- sequence: the values in the array are output cyclically
- trig: step to next item when triggered

Use a pulse wave as a trigger:

~~~spl syn=A
let seq = { :index |
	let p = [
		1 0 0 1 0 0 1 0
		0 0 1 0 1 0 0 0
		;
		0 0 0 0 0 0 0 0
		0 0 0 0 0 0 0 0
		1 1 1 1 1 0 0 0
		;
		1 0.1 0.1 1 0.1 1 0.1 0.1
		;
		1 0 0.2 0 0.2 0 0.2 0
	];
	let dt = [0.3 0.3 0.25 0.5];
	decay2(
		impulseSequencer(p[index], t),
		0.001,
		dt[index]
	)
};
let t = lfPulse(8, 0, 0.5);
[
	1.seq * sinOsc(1700, 0) * 0.1,
	2.seq * sinOsc(2400, 0) * 0.04,
	3.seq * brownNoise() * 0.05,
	4.seq * sinOsc(100, 0) * 0.2
].splay
~~~

* * *

See also: sequencer

Guides: Unit Generators
