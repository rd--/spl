# freqShift

- _freqShift(input, shift, phase)_

Frequency shifter.
freqShift implements single sideband amplitude modulation,
also known as frequency shifting,
but not to be confused with pitch shifting.
Frequency shifting moves all the components of a signal by a fixed amount,
but does not preserve the original harmonic relationships.

- input: audio input
- shift: amount of shift in cycles per second
- phase: phase of the frequency shift (0 - 2pi)

Shifting a 100Hz tone by 1 Hz rising to 500Hz:

```
freqShift(
	sinOsc(100, 0),
	xLine(1, 500, 5),
	0
) * 0.1
```

Shifting a complex tone by 1 Hz rising to 500Hz:

```
freqShift(
	sinOscBank(
		[101, 303, 606, 808],
		0.1,
		0
	),
	xLine(1, 500, 10),
	0
) * 0.1
```

Modulating shift and phase:

```
freqShift(
	sinOsc(10, 0),
	lfNoise2(0.3) * 1500,
	sinOsc(500, 0).linLin(
		-1, 1,
		0, 2.pi
	)
) * 0.1
```

Frequency shifting an audio sample:

```spl SfAcquire
let sf = SfAcquire('Floating', 1, [1]);
freqShift(
	playBuf(1, sf, 1, 0, 0, 1, 0),
	lfNoise0(0.45) * 1000,
	0
) * 0.5
```

Shifting bandpassed noise:

```
let snd = bpf(whiteNoise(), 1000, 0.001);
[
	freqShift(
		snd,
		lfNoise0(5.5) * 1000,
		0
	) * 4,
	snd
]
```

Simple detune & pitchmod via freqShift:

```
{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = tChoose(tr, [0 .. 2]);
	let note = 48 + tChoose(tr, table);
	let freq = (octave * 12 + note).midiCps;
	let detune = 1.5;
	let osc = sinOsc(freq, 0) * 0.1;
	let left = osc + freqShift(
		osc,
		freq * detune,
		0
	);
	let right = freqShift(
		left,
		sinOsc(3.23, 0) * 5,
		0
	);
	[left, right] / 3
}.overlapTexture(3, 3, 3).mix
```

Shift pulse wave in opposite directions:

```
{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = tChoose(tr, [0 .. 2]);
	let note = 48 + tChoose(tr, table);
	let freq = (octave * 12 + note).midiCps;
	let width = sinOsc(2.3, 0).linLin(
		-1, 1,
		0.2, 0.8
	);
	let osc = pulse(freq, width) * 0.1;
	let left = freqShift(
		osc,
		xLine(-0.1, -200, 3),
		0
	);
	let right = freqShift(
		osc,
		xLine(0.1, 200, 3),
		0
	);
	[left, right] / 3
}.overlapTexture(3, 3, 3).mix
```

freqShift, feedback, freqShift:

```
{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = tChoose(tr, [0 .. 2]);
	let note = 48 + tChoose(tr, table);
	let freq = (octave * 12 + note).midiCps;
	let in = freqShift(
		inFb(1, 0) * 3.2,
		txLine(0.01, freq * 1.5, 1, tr),
		0
	);
	let osc = sinOsc(
		freq,
		0
	) * sine(tr, 9) * 0.1;
	let snd = freqShift(
		osc + in,
		sinOsc(4.24, 0.5) * 3,
		0
	) * 0.5;
	[(osc + snd) / 3] # 2
}.overlapTexture(3, 3, 3).mix
```

Non-graph variant:

~~~spl texture
{
	let table = [0 2 4 5 7 9 11 12];
	let octave = [0 .. 2].atRandom;
	let note = 48 + table.atRandom;
	let freq = (octave * 12 + note).midiCps;
	let in = freqShift(
		inFb(1, 0) * 3.2,
		xLine(0.01, freq * 1.5, 1),
		0
	);
	let osc = sinOsc(
		freq,
		0
	) * sine(1, 9) * 0.1;
	let snd = freqShift(
		osc + in,
		sinOsc(4.24, 0.5) * 3,
		0
	) * 0.5;
	[(osc + snd) / 3] # 2
}.overlapTextureProgram(3, 3, 3)
~~~

* * *

See also: Hilbert, HilbertFir

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/FreqShift.html)

Categories: Ugen
