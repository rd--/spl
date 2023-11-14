# LinXFade2 -- two channel linear crossfade

_LinXFade2(a, b, pos)_

Two channel linear crossdafe.

- a: an input signal
- b: another input signal
- pos: cross fade position from -1 to +1

Cross fade from sine tone to noise and back again:

	LinXFade2(SinOsc(800, 0), PinkNoise(), SinOsc(1, 0)) * 0.1

* * *

See also: XFade2

