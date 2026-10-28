/* Prepared just piano ; Colby Leider ; modified by Jmcc ; Graph rewrite (rd) */
let c = 4; /* Number of combs */
let a = 4; /* Number of allpasses */
let v = 3; /* Number of overlapped voices */
let d = mouseY(0, 1, 0, 0.2) > 0.5; /* Is pitch space discrete or continuous */
{ :tr |
	let y = dust(mouseX(0.1, 4, 1, 0.2)) * 0.4;
	y := resonz(y, 400, 0.4);
	y := lpf(y, 12000);
	y := integrator(y, 0.99);
	y := hpf(y, 200);
	y := {
		/* Partch tonality diamond about 1000Hz */
		combL(
			y,
			0.1,
			tRand(1, 8, tr).round(d) / tRand(1, 9, tr).round(d) * 0.001,
			5
		)
	} !+ c;
	a.timesRepeat {
		y := allpassN(y, 0.040, { tRand(0, 0.040, tr) } ! 2, 8)
	};
	y
}.overlapTexture(5, 3, v).mix
