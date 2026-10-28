# sequencer

- _sequencer(sequence, trig)_

Clocked values.
Outputs a different value from the sequence each time a trigger is received.

- sequence: the values in the list are output cyclically
- trig: step signal

Arpeggio:

```
let t = impulse(4, 0);
let f = sequencer([111 222 333 444], t);
sinOsc(f, 0) * perc(t, 0.1, 0.1, 0) * 0.1
```

Sequence triggered by square wave:

```
let freq = sequencer(
	[60 62 63 58 48 55],
	lfPulse(6, 0, 0.5)
).midiCps;
lfSaw(freq, 0) * 0.1
```

Sequence triggered by random impulses:

```
let freq = sequencer(
	[60 62 63 58 48 55],
	dust(6)
).midiCps;
lfSaw(freq, 0) * 0.1
```

Sequence of a demand rate value:

```
let tr = lfPulse(6, 0, 0.5);
let freq = {
	demandSequencer(
		drand(Infinity, [1 2 3 7 8]),
		tr
	) * 30 + 340
} ! 2;
sinOsc(freq, 0) * 0.1
```

Sequence of shifting sequences:

```
let clock = impulse(8, 0);
let root = sequencer(
	[24 26 24 22],
	pulseDivider(clock, 64, 0)
);
let note = sequencer(
	[
		33 33 35 36 45 47 38 40
		33 33 35 36 47 48 50 52
	],
	clock
);
let freq = (note + root).midiCps;
let trig = impulseSequencer(
	[4 0 1 1 4 1 1 1] / 10,
	clock
);
let env = decay2(trig, 0.005, 1.4) * 0.25;
let z = varSaw(
	freq * [1 1.505],
	0,
	mouseY(0, 1, 0, 0.2)
) * env;
combN(z, 0.26, 0.26, 4).softClip
```

* * *

See also: impulseSequencer

Guides: Unit Generators

Categories: Ugen
