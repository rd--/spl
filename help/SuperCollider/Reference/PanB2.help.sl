# PanB2 -- Ambisonic B format panner

PanB2(in, azimuth, level)

- in: input signal
- azimuth: position, -1 to +1, -1/+1 is behind, -0.5 is left, 0 is forward, +0.5 is right
- level: a control rate level input.

Output channels are in order _w, x, y, z_.
You will only hear the first two channels on a stereo setup.

	var [w, x, y] = PanB2(
		PinkNoise(),
		LfSaw(MouseX(1 / 5, 5, 1, 0.2), 0),
		0.1
	);
	Silent(8) ++ DecodeB2(8, w, x, y, 0)
