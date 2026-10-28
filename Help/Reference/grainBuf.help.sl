# grainBuf

- _grainBuf(numChannels=1, trigger=0, dur=1, sndbuf, rate=1, pos=0, interp=2, pan=0, envbufnum=-1, maxGrains=512)_

Granular synthesis with sound stored in a buffer.

- numChannels: the number of channels to output. If 1, mono is returned and pan is ignored.
- trigger: a kr or ar trigger to start a new grain. If ar, grains after the start of the synth are sample accurate.
- dur: size of the grain (in seconds).
- sndBuf: the buffer holding a mono audio signal. If using multi-channel files, use Buffer.readChannel.
- rate: the playback rate of the sampled sound
- pos: the playback position for the grain to start with (0 is beginning, 1 is end of file)
- interp: the interpolation method used for pitchshifting grains.
- pan: determines where to pan the output.
- envbufnum: the buffer number containing a signal to use for the grain envelope. -1 uses a built-in Hann envelope.
- maxGrains: the maximum number of overlapping grains that can be used at a given time. This value is set at the UGens init time and cannot be modified. Defaults to 512. This can be set lower for more efficient use of memory.

The possible interpolation values are
1 = no interpolation,
2 = linear,
4 = cubic interpolation (more computationally intensive).

If _numChannels_ is one then no panning is done,
if it is two then panning is similar to `pan2`,
and if it is more than two panning is the same as `panAz`.

All arguments except numChannels and trigger are polled at grain creation time.

Use mouseY to control grain frequency and mouseX to control panning:

```spl SfAcquire
let sndBuf = sfAcquireMono('Floating');
let envBuf = -1;
let freq = mouseY(10, 100, 1, 0.2);
let pan = mouseX(-1, 1, 0, 0.2);
grainBuf(
	2,
	impulse(freq, 0),
	0.1,
	sndBuf,
	lfNoise1(500).linLin(-1, 1, 0.5, 2),
	lfNoise2(0.1).linLin(-1, 1, 0, 1),
	2,
	pan,
	envBuf,
	512
)
```

* * *

See also: grainFm, grainIn, grainSin

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/GrainBuf.html)

Categories: Ugen
