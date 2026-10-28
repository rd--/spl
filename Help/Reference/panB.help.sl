# panB

- _panB(in, azimuth, elevation, level)_

Ambisonic B format panner.

- in: input signal
- azimuth: in radians, -pi to +pi
- elevation: in radians, -0.5pi to +0.5pi
- level: a control rate level input.

Output channels are in order _w, x, y, z_.
You will only hear the first two channels on a stereo setup.

```
let [w, x, y, z] = panB(
	pinkNoise() * 0.1,
	lfSaw(0.5, 1.pi),
	0,
	0.3
);
silent(8) ++ decodeB2(8, w, x, y, 0)
```

* * *

See also: panAz, decodeB2, pan2, panB2, rotate2

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PanB.html)

Categories: Ugen
