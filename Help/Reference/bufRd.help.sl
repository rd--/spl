# bufRd

- _bufRd(numChannels, bufNum=0, phase=0, loop=1, interpolation=2)_

Buffer reading oscillator.
Read the content of a buffer at an index.

Where `playBuf` plays through the buffer by itself,
`bufRd only moves its read point by the phase input and therefore has no pitch input.
bufRd has variable interpolation.

- numChannels: number of channels
- bufNum: signal buffer index
- phase: index into the buffer
- loop: 1 means true, 0 means false
- interpolation: 1 means no interpolation, 2 is linear, 4 is cubic interpolation.

Zig zag around sound:

```spl SfAcquire
let sf = SfAcquire('Floating', 1, [1]).first;
let mx = mouseX(2, 20, 1, 0.2);
let phase = lfNoise2(mx);
bufRd(1, sf, phase * sfFrameCount(sf), 1, 2)
```

Ordinary playback, phase courtesy `lfSaw`:

```spl SfAcquire
let sf = SfAcquire('Floating', 1, [1]).first;
let sw = lfSaw(1 / sfDuration(sf), 0);
let ph = sw.linLin(-1, 1, 0, sfFrameCount(sf));
bufRd(1, sf, ph, 1, 2)
```

Ordinary playback, phase courtesy `phasor`:

```spl SfAcquire
let sf = SfAcquire('Floating', 1, [1]).first;
let ph = phasor(
	0,
	sfRateScale(sf),
	0,
	sfFrameCount(sf),
	0
);
bufRd(1, sf, ph, 1, 2)
```

Play window function at local buffer:

```
let tbl = 0:180.collect { :each |
	each.degreesToRadians.sin
}.localBuf;
let dur = 3;
let ph = line(0, bufFrames(tbl), dur);
let win = bufRd(1, tbl, ph, 1, 2);
sinOsc(440, 0) * 0.1 * win
```

Trigger window function at local buffer:

```
let tbl = 0:180.collect { :each |
	each.degreesToRadians.sin
}.localBuf;
let dur = 1 / 7;
let tr = impulse(5, 0);
let ph = tLine(0, bufFrames(tbl), dur, tr);
let win = bufRd(1, tbl, ph, 1, 2);
sinOsc(
	tExpRand(111, 555, tr),
	0
) * win / 3
```

Plot window function:

~~~spl svg=A
0:180.collect { :each |
	each.degreesToRadians.sin
}.linePlot
~~~

![](Help/Image/bufRd-A.svg)

* * *

See also: bufFrames, playBuf

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/table.html)
[2](https://csound.com/docs/manual/tablei.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/BufRd.html)

Categories: Ugen, Buffer
