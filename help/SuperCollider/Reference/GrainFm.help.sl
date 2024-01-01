# GrainFm -- granular synthesis with frequency modulated sine tones

_GrainFm(numChannels=1, trigger=0, dur=1, carfreq=440, modfreq=220, index=1, pan=0, envbufnum=-1, maxGrains=512)_

- numChannels: the number of channels to output
- trigger: a trigger to start a new grain
- dur: size of the grain (in seconds)
- carFreq: the carrier freq of the grain generators internal oscillator
- modFreq: the modulating freq of the grain generators internal oscillator
- index: the index of modulation
- pan: determines where to pan the output
- envBufNum: the buffer number containing a signal to use for the grain envelope, -1 uses a built-in Hann envelope.  Cannot be LocalBuf (Nov. 2023)
- maxGrains: the maximum number of overlapping grains that can be used at a given time (ir)

Linear envelopes modulating controls:

	var numChannels = 8;
	var envDur = 15;
	var trigger = Impulse(Line(7.5, 15, envDur), 0);
	var dur = 0.1;
	var carFreq = Line(200, 800, envDur);
	var modFreq = 200;
	var index = Line(-1, 1, envDur);
	var pan = Line(-0.85, 0.85, envDur);
	var envBufNum = -1;
	var maxGrains = 512;
	GrainFm(numChannels, trigger, dur, carFreq, modFreq, index, pan, envBufNum, maxGrains).Splay * 0.1

Mouse controls panning, noise and mouse control deviation from center pitch:

	var numChannels = 8;
	var trigger = Impulse(10, 0);
	var dur = 0.1;
	GrainFm(
		numChannels,
		trigger,
		0.1, (* dur *)
		WhiteNoise() * MouseY(0, 400, 0, 0.2) + 440, (* carFreq *)
		TRand(20, 200, trigger), (* modFreq *)
		LfNoise1(500).Range(1, 10), (* index *)
		MouseX(-1, 1, 0, 0.2), (* pan *)
		-1, (* envBufNum *)
		512 (* maxGrains *)
	).Splay * 0.1

* * *

See also: GrainBuf, GrainIn, GrainSin, TGrains, Warp1
