# FreqShift

- _FreqShift(input, shift, phase)_

Frequency shifter.
FreqShift implements single sideband amplitude modulation,
also known as frequency shifting,
but not to be confused with pitch shifting.
Frequency shifting moves all the components of a signal by a fixed amount,
but does not preserve the original harmonic relationships.

- input: audio input
- shift: amount of shift in cycles per second
- phase: phase of the frequency shift (0 - 2pi)

Shifting a 100Hz tone by 1 Hz rising to 500Hz:

```
FreqShift(
	SinOsc(100, 0),
	XLine(1, 500, 5),
	0
) * 0.1
```

Shifting a complex tone by 1 Hz rising to 500Hz:

```
FreqShift(
	SinOscBank(
		[101, 303, 606, 808],
		0.1,
		0
	),
	XLine(1, 500, 10),
	0
) * 0.1
```

Modulating shift and phase:

```
FreqShift(
	SinOsc(10, 0),
	LfNoise2(0.3) * 1500,
	SinOsc(500, 0).LinLin(
		-1, 1,
		0, 2.pi
	)
) * 0.1
```

Frequency shifting an audio sample:

```spl SfAcquire
let sf = SfAcquire('Floating', 1, [1]);
FreqShift(
	PlayBuf(1, sf, 1, 0, 0, 1, 0),
	LfNoise0(0.45) * 1000,
	0
) * 0.5
```

Shifting bandpassed noise:

```
let snd = Bpf(WhiteNoise(), 1000, 0.001);
[
	FreqShift(
		snd,
		LfNoise0(5.5) * 1000,
		0
	) * 4,
	snd
]
```

Simple detune & pitchmod via FreqShift:

```
{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = Choose(tr, [0 .. 2]);
	let note = 48 + Choose(tr, table);
	let freq = (octave * 12 + note).MidiCps;
	let detune = 1.5;
	let osc = SinOsc(freq, 0) * 0.1;
	let left = osc + FreqShift(
		osc,
		freq * detune,
		0
	);
	let right = FreqShift(
		left,
		SinOsc(3.23, 0) * 5,
		0
	);
	[left, right] / 3
}.OverlapTexture(3, 3, 3).Mix
```

Shift pulse wave in opposite directions:

```
{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = Choose(tr, [0 .. 2]);
	let note = 48 + Choose(tr, table);
	let freq = (octave * 12 + note).MidiCps;
	let width = SinOsc(2.3, 0).LinLin(
		-1, 1,
		0.2, 0.8
	);
	let osc = Pulse(freq, width) * 0.1;
	let left = FreqShift(
		osc,
		XLine(-0.1, -200, 3),
		0
	);
	let right = FreqShift(
		osc,
		XLine(0.1, 200, 3),
		0
	);
	[left, right] / 3
}.OverlapTexture(3, 3, 3).Mix
```

FreqShift, feedback, FreqShift:

```
{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = Choose(tr, [0 .. 2]);
	let note = 48 + Choose(tr, table);
	let freq = (octave * 12 + note).MidiCps;
	let in = FreqShift(
		InFb(1, 0) * 3.2,
		TxLine(0.01, freq * 1.5, 1, tr),
		0
	);
	let osc = SinOsc(
		freq,
		0
	) * Sine(tr, 9) * 0.1;
	let snd = FreqShift(
		osc + in,
		SinOsc(4.24, 0.5) * 3,
		0
	) * 0.5;
	2 # [(osc + snd) / 3]
}.OverlapTexture(3, 3, 3).Mix
```

Non-graph variant:

~~~spl texture
{
	let table = [0 2 4 5 7 9 11 12];
	let octave = [0 .. 2].atRandom;
	let note = 48 + table.atRandom;
	let freq = (octave * 12 + note).MidiCps;
	let in = FreqShift(
		InFb(1, 0) * 3.2,
		XLine(0.01, freq * 1.5, 1),
		0
	);
	let osc = SinOsc(
		freq,
		0
	) * Sine(1, 9) * 0.1;
	let snd = FreqShift(
		osc + in,
		SinOsc(4.24, 0.5) * 3,
		0
	) * 0.5;
	2 # [(osc + snd) / 3]
}.overlapTextureProgram(3, 3, 3)
~~~

* * *

See also: Hilbert, HilbertFir

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/FreqShift.html)

Categories: Ugen
