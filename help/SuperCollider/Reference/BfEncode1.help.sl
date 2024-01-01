# BfEncode1 -- panning

Ambisonic B format encoder

Output channels are in order _w,x,y,z_.

_BfEncode1(in, azimuth=0, elevation=0, rho=1, gain=1, wComp=0)_

- in: Input signal
- azimuth: In radians, -pi to pi
- elevation: In radians, -0.5pi to +0.5pi
- rho: The speaker radius (1 places shound at the radius, <1 within the radius, >1 is outside the radius) beyond the radius, a distance scaling is applied (no filtering is done).
- gain: A control rate level input.
- wComp: Chooses how the W channels is scaled. If 0, a scaler of 0.707 is used. If 1, W is varied according to the scaling of the X, Y and Z channels. 0 is the default.

Decode to octaphonic:

	var mouseAzimuth = MouseX(0, 2 * pi, 0, 0.2);
	var mouseRho = MouseY(0, 4, 0, 0.2);
	var cycleAzimuth = LfSaw(1 / 4, 0).LinLin(-1, 1, 0, 2 * pi);
	var [w, x, y, z] = BfEncode1(
		PinkNoise(),
		cycleAzimuth, (* mouseAzimuth *)
		0,
		1, (* mouseRho *)
		0.3,
		0
	);
	BfDecode1(w, x, y, z, [-0.75 -0.5 -0.25 0 0.25 0.5 0.75 1] * pi, 0, 0)

Decode to quadraphonic in sequence _fl, fr, rl, rr_:

	var mouseAzimuth = MouseX(0, 2 * pi, 0, 0.2);
	var mouseRho = MouseY(0, 4, 0, 0.2);
	var cycleAzimuth = LfSaw(1 / 4, 0).LinLin(-1, 1, 0, 2 * pi);
	var [w, x, y, z] = BfEncode1(
		PinkNoise(),
		cycleAzimuth, (* mouseAzimuth *)
		0,
		1, (* mouseRho *)
		0.3,
		0
	);
	BfDecode1(w, x, y, z, [-0.25 0.25 1.25 0.75] * pi, 0, 0)

* * *

See also: BfDecode1
