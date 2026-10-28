/* slew */
let x = mouseX(200, 12000, 1, 0.2);
let y = mouseY(200, 12000, 1, 0.2);
[
	slew (saw(440).-, x, y) * 0.05,
	slew(lfPulse(800, 0, 0.5), x, y) * 0.1
]

/* slew ; square to triangle ; triangle to sin-like ; https://scsynth.org/t/5208/2 (sp) */
let freq = 440;
let square = lfPulse(freq, 0, 0.5) * 2 - 1;
let tri = slew(square, freq * 4, freq * 4);
let sin = linLin(tri > 0, 0, 1, -1, 1) * (tri.abs ^ (1 / 4));
xFade2(tri, sin, mouseX(-1, 1, 0, 0.2), 0.05)
