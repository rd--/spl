/* Mouse x controls phase relation ; / shape = in-phase ; \ shape = out-of-phase ; O shape = 90 degree phase relation ; Jmcc */
sinOsc(80, [0, mouseX(0, 2.pi, 0, 0.2)]) / 3

/* Harmonic relations ; Jmcc */
sinOsc([mouseX(60, 300, 0, 30) + 0.04, mouseY(60, 300, 1 , 30)], 0) * 0.1

/* Harmonic relations ; Jmcc */
rlpf(
	lfPulse(
		[mouseX(60, 300, 0, 30) + 0.04, mouseY(60, 300, 0, 30)],
		0,
		0.5
	) * 0.1 - 0.05,
	800,
	1
)

/* Panning a mono signal ; x=left channel, y=right channel ; Jmcc */
pan2(brownNoise(), mouseX(-1, 1, 0, 0.2), 0.1)

/* Uncorrelated channels ; Jmcc */
brownNoise([0.1] # 2, 0)

/* Uncorrelated channels ; Jmcc */
pinkNoise([0.1] # 2, 0)

/* Waveform ; Jmcc */
[
	lfTri(80, 0) * 0.2,
	combN(
		onePole(brownNoise() * 0.1, mouseX(0, 1, 0, 0.2)),
		1 / 80,
		1 / 80,
		0.3
	) * sinOsc(80.04, 0.5.pi).abs
]

/* Waveform ; Jmcc */
[
	lfTri(80, 0) * 0.2,
	combN(
		resonz(brownNoise() * 0.4, mouseX(20, 12000, 1, 0.2), 0.2),
		1 / 80,
		1 / 80,
		0.3
	) * sinOsc(80, 1).abs
]

/* Filtered decorrelated noise ; Jmcc */
combN(
	resonz(
		brownNoise([0.4] # 2, 0),
		mouseX(20, 12000, 1, 0.2),
		0.2
	),
	1 / 80,
	1 / 80,
	0.3
)

/* Quad ; eye ; Jmcc */
let m = mouseX(0.5, 1, 0, 0.2);
let a = lfPulse(200, 0, 0.3) * 0.05;
let b = onePole(a, m);
let c = onePole(b, m);
let d = onePole(c, m);
let e = onePole(d, m);
[b, c, d, e]
