# BfDecode1

- _BfDecode1(w, x, y, z, azimuth=0, elevation=0, wComp=0)_

3D Ambisonic decoder.
Decode a two dimensional ambisonic B-format signal for any speaker arrangement.

Note:
Because of the way the W component is scaled,
it is recommended that you only decode with BfEncode signals with BfDecode1.

Warning:
All of the B-format signals must be audio rate signals.
If you want to zero one out, use Dc(0).

- w,x,y,z: B-format signals
- azimuth: Angle from 0 front and center of the speaker
- elevation: Angle from 0 center of the speaker
- wComp: Chooses how the W channels is scaled. If 0, a scaler of 0.707 is used. If 1, W is varied according to the scaling of the X, Y and Z channels. 1 is the default.

B-format decode to cube _lfh, rfh, rrh, lrh, lfl, rfl, rrl, lrl_,
where lfl = left front high, lfl = left front low &etc.

```
let p = PinkNoise();
let [w, x, y, z] = BfEncode1(
	p,
	MouseX(0 - pi, pi, 0, 0.2),
	MouseY(0.25 * pi, -0.25 * pi, 0, 0.2),
	1,
	1,
	0
);
BfDecode1(
	w, x, y, z,
	[-0.25 0.25 1.25 0.75 -0.25 0.25 1.25 0.75] * pi,
	[0.25 0.25 0.25 0.25 -0.25 -0.25 -0.25 -0.25] * pi,
	0
)
```

* * *

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/BFDecode1.html)

Categories: Panning
