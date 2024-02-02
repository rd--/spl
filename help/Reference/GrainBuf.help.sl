# GrainBuf

_GrainBuf(numChannels=1, trigger=0, dur=1, sndbuf, rate=1, pos=0, interp=2, pan=0, envbufnum=-1, maxGrains=512)_

Granular synthesis with sound stored in a buffer.

- numChannels: the number of channels to output. If 1, mono is returned and pan is ignored.
- trigger: a kr or ar trigger to start a new grain. If ar, grains after the start of the synth are sample accurate.
- dur: size of the grain (in seconds).
- sndBuf: the buffer holding a mono audio signal. If using multi-channel files, use Buffer.readChannel.
- rate: the playback rate of the sampled sound
- pos: the playback position for the grain to start with (0 is beginning, 1 is end of file)
- interp: the interpolation method used for pitchshifting grains:
  1 = no interpolation,
  2 = linear,
  4 = cubic interpolation (more computationally intensive)
- pan: determines where to pan the output.
  If numChannels = 1, no panning is done.
  If numChannels = 2, panning is similar to Pan2.
  If numChannels > 2, panning is the same as PanAz.
- envbufnum: the buffer number containing a signal to use for the grain envelope. -1 uses a built-in Hann envelope.
- maxGrains: the maximum number of overlapping grains that can be used at a given time. This value is set at the UGens init time and cannot be modified. Defaults to 512. This can be set lower for more efficient use of memory.

All args except numChannels and trigger are polled at grain creation time.

Use MouseY to control grain frequency and MouseX to control panning:

	let sndBuf = SfAcquireMono('floating_1');
	let envBuf = -1;
	let freq = MouseY(10, 100, 1, 0.2);
	let pan = MouseX(-1, 1, 0, 0.2);
	GrainBuf(
		2,
		Impulse(freq, 0),
		0.1,
		sndBuf,
		LfNoise1(500).Range(0.5, 2),
		LfNoise2(0.1).Range(0, 1),
		2,
		pan,
		envBuf,
		512
	)


* * *

See also: GrainIn, GrainFM, GrainSin
