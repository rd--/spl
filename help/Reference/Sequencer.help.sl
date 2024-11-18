# Sequencer

- _Sequencer(sequence, trig)_

Clocked values.
Outputs a different value from the sequence each time a trigger is received.

- sequence: the values in the list are output cyclically
- trig: step signal

Arpeggio:

```
let t = Impulse(4, 0);
let f = Sequencer([111 222 333 444], t);
SinOsc(f, 0) * Perc(t, 0.1, 0.1, 0) * 0.1
```

Sequence triggered by square wave:

```
let freq = Sequencer(
	[60 62 63 58 48 55],
	LfPulse(6, 0, 0.5)
).MidiCps;
LfSaw(freq, 0) * 0.1
```

Sequence triggered by random impulses:

```
let freq = Sequencer(
	[60 62 63 58 48 55],
	Dust(6)
).MidiCps;
LfSaw(freq, 0) * 0.1
```

Sequence of a demand rate value:

```
let tr = LfPulse(6, 0, 0.5);
let freq = {
	DemandSequencer(Drand(inf, [1 2 3 7 8]), tr) * 30 + 340
} ! 2;
SinOsc(freq, 0) * 0.1
```

Sequence of shifting sequences:

```
let clock = Impulse(8, 0);
let root = Sequencer(
	[24 26 24 22],
	PulseDivider(clock, 64, 0)
);
let note = Sequencer(
	[
		33 33 35 36 45 47 38 40
		33 33 35 36 47 48 50 52
	],
	clock
);
let freq = (note + root).MidiCps;
let trig = ImpulseSequencer(
	[4 0 1 1 4 1 1 1] / 10,
	clock
);
let env = Decay2(trig, 0.005, 1.4) * 0.25;
let z = VarSaw(
	freq * [1 1.505],
	0,
	MouseY(0, 1, 0, 0.2)
) * env;
CombN(z, 0.26, 0.26, 4).SoftClip
```

* * *

See also: ImpulseSequencer

Categories: Ugen
