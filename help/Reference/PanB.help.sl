# PanB -- Ambisonic B format panner

PanB(in, azimuth, elevation, level)

- in: input signal
- azimuth: in radians, -pi to +pi
- elevation: in radians, -0.5pi to +0.5pi
- level: a control rate level input.

Output channels are in order _w, x, y, z_.
You will only hear the first two channels on a stereo setup.

	let [w, x, y, z] = PanB(
		PinkNoise() * 0.1,
		LfSaw(0.5, pi),
		0,
		0.3
	);
	Silent(8) ++ DecodeB2(8, w, x, y, 0)
