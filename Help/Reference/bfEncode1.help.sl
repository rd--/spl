# bfEncode1

- _bfEncode1(in, azimuth=0, elevation=0, rho=1, gain=1, wComp=0)_

Ambisonic B format encoder
Output channels are in order _w,x,y,z_.

- in: Input signal
- azimuth: In radians, -pi to pi
- elevation: In radians, -0.5pi to +0.5pi
- rho: The speaker radius (1 places shound at the radius, <1 within the radius, >1 is outside the radius) beyond the radius, a distance scaling is applied (no filtering is done)
- gain: A control rate level input
- wComp: Chooses how the W channels is scaled.

If _wComp_ is 0, a scaler of 0.707 is used.
If it is 1, W is varied according to the scaling of the X, Y and Z channels.

Decode to octaphonic:

~~~spl syn=A
let useMouse = false;
let azimuth = useMouse.if {
	mouseX(0, 2.pi, 0, 0.2)
} {
	lfSaw(1 / 4, 0)
	.linLin(-1, 1, 0, 2.pi)
};
let rho = useMouse.if {
	mouseY(0, 4, 0, 0.2)
} {
	1
};
let [w, x, y, z] = bfEncode1(
	pinkNoise(),
	azimuth,
	0,
	rho,
	0.3,
	0
);
bfDecode1(
	w, x, y, z,
	[
		-0.75 -0.5
		-0.25 0
		0.25 0.5
		0.75 1
	].pi,
	0,
	0
)
~~~

Decode to quadraphonic in sequence _fl, fr, rl, rr_:

~~~spl syn=B
let useMouse = false;
let azimuth = useMouse.if {
	mouseX(0, 2.pi, 0, 0.2)
} {
	lfSaw(1 / 4, 0)
	.linLin(-1, 1, 0, 2.pi)
};
let rho = useMouse.if {
	mouseY(0, 4, 0, 0.2)
} {
	1
};
let [w, x, y, z] = bfEncode1(
	pinkNoise(),
	azimuth,
	0,
	rho,
	0.3,
	0
);
bfDecode1(
	w, x, y, z,
	[
		-0.25 0.25
		1.25 0.75
	].pi,
	0,
	0
)
~~~

* * *

See also: bfDecode1

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/BFEncode1.html)

Categories: Ugen, Panning
