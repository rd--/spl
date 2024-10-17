/* Mouse x controls phase relation ; / shape = in-phase ; \ shape = out-of-phase ; O shape = 90 degree phase relation ; Jmcc */
SinOsc(80, [0, MouseX(0, 2 * pi, 0, 0.2)]) / 3

/* Harmonic relations ; Jmcc */
SinOsc([MouseX(60, 300, 0, 30) + 0.04, MouseY(60, 300, 1 , 30)], 0) * 0.1

/* Harmonic relations ; Jmcc */
Rlpf(
	LfPulse(
		[MouseX(60, 300, 0, 30) + 0.04, MouseY(60, 300, 0, 30)],
		0,
		0.5
	) * 0.1 - 0.05,
	800,
	1
)

/* Panning a mono signal ; x=left channel, y=right channel ; Jmcc */
Pan2(BrownNoise(), MouseX(-1, 1, 0, 0.2), 0.1)

/* Uncorrelated channels ; Jmcc */
BrownNoise(2) * 0.1

/* Uncorrelated channels ; Jmcc */
PinkNoise(2) * 0.1

/* Waveform ; Jmcc */
[
	LfTri(80, 0) * 0.2,
	CombN(
		OnePole(BrownNoise() * 0.1, MouseX(0, 1, 0, 0.2)),
		1 / 80,
		1 / 80,
		0.3
	) * SinOsc(80.04, 0.5 * pi).Abs
]

/* Waveform ; Jmcc */
[
	LfTri(80, 0) * 0.2,
	CombN(
		Resonz(BrownNoise() * 0.4, MouseX(20, 12000, 1, 0.2), 0.2),
		1 / 80,
		1 / 80,
		0.3
	) * SinOsc(80, 1).Abs
]

/* Filtered decorrelated noise ; Jmcc */
CombN(
	Resonz(BrownNoise(2) * 0.4, MouseX(20, 12000, 1, 0.2), 0.2),
	1 / 80,
	1 / 80,
	0.3
)

/* Quad ; eye ; Jmcc */
let m = MouseX(0.5, 1, 0, 0.2);
let a = LfPulse(200, 0, 0.3) * 0.05;
let b = OnePole(a, m);
let c = OnePole(b, m);
let d = OnePole(c, m);
let e = OnePole(d, m);
[b, c, d, e]
