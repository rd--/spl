# warp1

- _warp1(numChannels=1, bufnum=0, pointer=0, freqScale=1, windowSize=0.2, envbufnum=-1, overlaps=8, windowRandRatio=0, interp=1)_

Warp a buffer with a time pointer.
Inspired _warp1_ from SuperCollider2 by Chad Kirby,
which was inspired by _sndwarp_ from CSound by Richard Karpen.
A granular time stretcher and pitchshifter.

- numChannels: number of channels at bufNum
- bufNum: buffer number of soundfile
- pointer: position in buffer (0-1). 0 is the beginning, 1 is the end
- freqScale: amount of frequency shift. 1/2 is one octave down, 2 is one octave up, negative values play backwards
- windowSize: size of each grain window
- envBufNum: buffer number of grain envelope. -1 uses a built-in Hanning envelope
- overlaps: number of overlapping windows
- windowRandRatio: amount of randomness of the windowing function (0-1). 0 is no randomness
- interp: interpolation method. 1 = none, 2 = linear, 4 = cubic

Here the pointer moves from the beginning to the end of the soundfile over fifteen seconds, control pitch with _mouseX_:

```spl SfAcquire
warp1(
	1,
	sfAcquireMono('Floating'),
	lfSaw(1 / 15, 0).linLin(-1, 1, 0, 1),
	mouseX(0.5, 2, 0, 0.2),
	0.1,
	-1,
	8,
	0.1,
	2
) * 0.25
```

Pointer is `phasor`, playback slows from unit to a quarter over twenty seconds:

```spl SfAcquire
let sf = sfAcquireMono('Floating');
let d = sampleDur() / sfDuration(sf);
let pointer = phasor(
	0,
	d * xLine(1, 0.25, 20),
	0,
	1,
	0
);
let sound = warp1(
	1,
	sf,
	pointer,
	1,
	0.3,
	-1,
	16,
	line(0, 1, 40),
	4
);
eqPan(sound, pointer * 2 - 1) / 4
```

* * *

See also: grainFm, tGrains

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Warp1.html)

Categories: Ugen
