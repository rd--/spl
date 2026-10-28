/* bezier ; reference sine tone */
sinOsc(440, 0) * 0.1

/* bezier ; Bézier curve oscillator ; bezier approximation of sin function */
bezier(100, 0.001, 440, 0, [0, 0, 0.2, -1.3, 0.3, -1.3, 0.5, 0, 0.7, 1.3, 0.8, 1.3, 1, 0]) * 0.1

/* bezier ; mouse control of frequency */
let x = mouseX(40, 4000, 1, 0.2);
bezier(100, 0.001, x, 0, [0, 0, 0.2, -1.3, 0.3, -1.3, 0.5, 0, 0.7, 1.3, 0.8, 1.3, 1, 0]) * 0.1

/* bezier ; mouse control of frequency & one control point */
let x = mouseX(40, 4000, 1, 0.2);
let y = mouseY(0.1, 0.2, 0, 0.2);
bezier(100, 0.001, x, 0, [0, 0, y, -1.3, 0.3, -1.3, 0.5, 0, 0.7, 1.3, 0.8, 1.3, 1, 0]) * 0.1

/* bezier ; dynamic shifting of control points, as oscillator */
let w = { :l :r |
	linLin(lfdNoise3(2), -1, 1, l, r)
};
{
	let p = [
		0, 0,
		w(0.05, 0.25), -1.3,
		w(0.25, 0.45), -1.3,
		0.5, 0,
		w(0.55, 0.75), 1.3,
		w(0.75, 0.95), 1.3,
		1, 0
	];
	let o = bezier(100, 0.001, w(200, 205), 0, p);
	eqPan2(o, iRand(-1, 1)) * 0.1
} !> 4

/* bezier ; Event control */
Voicer(1, 16) { :e |
	let w = { :l :r |
		linLin(lfdNoise3(e.j * 5), -1, 1, l, r)
	};
	{
		let p = [
			0, 0,
			w(0.05, 0.25), -1.3,
			w(0.25, 0.45), -1.3,
			0.5, 0,
			w(0.55, 0.75), 1.3,
			w(0.75, 0.95), 1.3,
			1, 0
		];
		let o = bezier(100, 0.001, w(200, 205) * (e.x + 0.5), 0, p);
		eqPan2(o, e.i * 2 - 1) * e.z * lagUd(e.w, 0.01, e.y * 4)
	} !+ 4
}.mix /* Cpu Load: Mac Studio M1 Max 2022: 16 voices = 85% */
