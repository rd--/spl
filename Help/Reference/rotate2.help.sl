# rotate2

- _rotate2(x, y, pos=0)_

Rotate a sound field.
rotate2 can be used for rotating an ambisonic B-format sound field around an axis.
rotate2 does an equal power rotation so it also works well on stereo sounds.
It takes two audio inputs (x, y) and an angle control (pos).
It outputs two channels (x, y).
It computes:

> _xOut = cos(angle) * xIn + sin(angle) * yIn_

and:

> _yOut = cos(angle) * yIn - sin(angle) * xIn_

where

> _angle = pos.pi_

so that -1 becomes -pi and +1 becomes +pi.
This allows you to use an `lfSaw` to do continuous rotation around a circle.

- x: Input signal X
- y: Input signal Y
- pos: angle to rotate, -1 to +1, -1/+1 is behind, -0.5 is left, 0 is forward, +0.5 is right

B-format encoding of two signals at opposite sides of the circle:

~~~spl syn=A
let p = whiteNoise() * 0.05;
let q = lfSaw([200, 200.37, 201], 0).sum * 0.03;
let a = panB2(p, -0.5, 1);
let b = panB2(q, 0.5, 1);
let [w, x, y] = a + b;
let m = mouseX(-1, 1, 0, 0.2);
let [rx, ry] = rotate2(x, y, m);
decodeB2(8, w, rx, ry, 0)
~~~

Rotation of stereo sound using Lfo:

~~~spl syn=B
let x = pinkNoise() * 0.2;
let y = lfTri(800, 0) * lfPulse(3, 0, 0.3) * 0.2;
rotate2(x, y, lfSaw(0.1, 0))
~~~

Rotation using mouse control:

~~~spl syn=C
let x = {
	lfSaw(200 + rand(-2, 2), 0) * 0.1
} !+ 4;
let y = (
	sinOsc(900, 0)
	* lfPulse(3, 0, 0.3)
	* 0.2
);
rotate2(x, y, mouseX(0, 2, 0, 0.2))
~~~

* * *

See also: biPanB2, decodeB2, panB, panB2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Rotate2.html)

Categories: Ugen, Panning
