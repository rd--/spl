# Warp1 -- Warp a buffer with a time pointer

Inspired Warp1 from SuperCollider2 by Chad Kirby, which was inspired by sndwarp from CSound by Richard Karpen.
A granular time stretcher and pitchshifter.

_Warp1(numChannels=1, bufnum=0, pointer=0, freqScale=1, windowSize=0.2, envbufnum=-1, overlaps=8, windowRandRatio=0, interp=1)_

- numChannels: number of channels at bufNum.
- bufNum: buffer number of soundfile.
- pointer: position in buffer, 0 is the beginning, 1 is the end.
- freqScale: amount of frequency shift, 1/2 is one octave down, 2 is one octave up, negative values play backwards.
- windowSize: size of each grain window.
- envBufNum: buffer number of grain envelope, -1 uses a built-in Hanning envelope.
- overlaps: number of overlapping windows.
- windowRandRatio: amount of randomness of the windowing function, 0 is no randomness, 1 is probably too random.
- interp: interpolation method, 1 = none, 2 = linear, 4 = cubic.

Here the pointer moves from the beginning to the end of the soundfile over fifteen seconds, control pitch with _MouseX_:

	var numChannels = 1;
	var sf = SfAcquireMono('floating_1');
	var pointer = LfSaw(1 / 15, 0).Range(0, 1);
	var freqScale = MouseX(0.5, 2, 0, 0.2);
	var windowSize = 0.1;
	Warp1(numChannels, sf, pointer, freqScale, windowSize, -1, 8, 0.1, 2) * 0.25

Pointer is _Phasor_, playback slows from unit to a quarter over twenty seconds:

	var sf = SfAcquireMono('floating_1');
	var pointer = Phasor(
		0,
		SampleDur() / SfDur(sf) * XLine(1, 0.25, 20),
		0,
		1,
		0
	);
	var sound = Warp1(
		1,
		sf,
		pointer,
		1,
		0.3,
		-1,
		16,
		Line(0, 1, 40),
		4
	);
	EqPan(sound, pointer * 2 - 1) / 4

* * *

See also: GrainFm, TGrains
