# Rotate2

- _Rotate2(x, y, pos=0)_

Rotate a sound field.
Rotate2 can be used for rotating an ambisonic B-format sound field around an axis.
Rotate2 does an equal power rotation so it also works well on stereo sounds.
It takes two audio inputs (x, y) and an angle control (pos).
It outputs two channels (x, y).
It computes:

> _xOut = cos(angle) * xIn + sin(angle) * yIn_

and:

> _yOut = cos(angle) * yIn - sin(angle) * xIn_

where

> _angle = pos.pi_

so that -1 becomes -pi and +1 becomes +pi.
This allows you to use an `LfSaw` to do continuous rotation around a circle.

- x: Input signal X
- y: Input signal Y
- pos: angle to rotate, -1 to +1, -1/+1 is behind, -0.5 is left, 0 is forward, +0.5 is right

B-format encoding of two signals at opposite sides of the circle:

```
let p = WhiteNoise() * 0.05;
let q = LfSaw([200, 200.37, 201], 0).Sum * 0.03;
let [w, x, y] = PanB2(p, -0.5, 1) + PanB2(q, 0.5, 1);
let [rx, ry] = Rotate2(x, y, MouseX(-1, 1, 0, 0.2));
DecodeB2(8, w, rx, ry, 0)
```

Rotation of stereo sound using Lfo:

```
let x = PinkNoise() * 0.2;
let y = LfTri(800, 0) * LfPulse(3, 0, 0.3) * 0.2;
Rotate2(x, y, LfSaw(0.1, 0))
```

Rotation using mouse control:

```
let x = { LfSaw(200 + Rand(-2, 2), 0) * 0.1 } !+ 4;
let y = SinOsc(900, 0) * LfPulse(3, 0, 0.3) * 0.2;
Rotate2(x, y, MouseX(0, 2, 0, 0.2))
```

* * *

See also: BiPanB2, DecodeB2, PanB, PanB2

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Rotate2.html)

Categories: Ugen, Panning
