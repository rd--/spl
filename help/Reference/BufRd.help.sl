# BufRd

- _BufRd(numChannels, bufNum=0, phase=0, loop=1, interpolation=2)_

Buffer reading oscillator.
Read the content of a buffer at an index.

Where `PlayBuf` plays through the buffer by itself,
`BufRd only moves its read point by the phase input and therefore has no pitch input.
BufRd has variable interpolation.

- numChannels: number of channels
- bufNum: signal buffer index
- phase: index into the buffer
- loop: 1 means true, 0 means false
- interpolation: 1 means no interpolation, 2 is linear, 4 is cubic interpolation.

Zig zag around sound:

~~~
let sf = SfAcquire('floating_1', 1, [1]).first;
let phase = LfNoise2(MouseX(2, 20, 1, 0.2)) * SfFrames(sf);
BufRd(1, sf, phase, 1, 2)
~~~

Ordinary playback, phase courtesy _LfSaw_:

~~~
let sf = SfAcquire('floating_1', 1, [1]).first;
let sw = LfSaw(1 / SfDur(sf), 0);
let ph = sw.LinLin(-1, 1, 0, SfFrames(sf));
BufRd(1, sf, ph, 1, 2)
~~~

Ordinary playback, phase courtesy _Phasor_:

~~~
let sf = SfAcquire('floating_1', 1, [1]).first;
let ph = Phasor(0, SfRateScale(sf), 0, SfFrames(sf), 0);
BufRd(1, sf, ph, 1, 2)
~~~

Play window function at local buffer:

~~~
let tbl = 0:180.collect { :each |
	each.degreesToRadians.sin
}.asLocalBuf;
let dur = 3;
let ph = Line(0, BufFrames(tbl), dur);
let win = BufRd(1, tbl, ph, 1, 2);
SinOsc(440, 0) * 0.1 * win
~~~

Trigger window function at local buffer:

~~~
let tbl = 0:180.collect { :each |
	each.degreesToRadians.sin
}.asLocalBuf;
let dur = 1 / 7;
let tr = Impulse(5, 0);
let ph = TLine(0, BufFrames(tbl), dur, tr);
let win = BufRd(1, tbl, ph, 1, 2);
SinOsc(TExpRand(111, 555, tr), 0) * win / 3
~~~

* * *

See also: BufFrames, PlayBuf
