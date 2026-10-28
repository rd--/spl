/* duty ; c.f. equivalent demand graph ; (duty) */
let tr = dust(9);
let n = dseq(Infinity, [0, 2, 4, 5, 7, 9, 11, 12]) + (tRand(3, 6, tr).round(1) * 12);
let f = duty(0.1, 0, n.midiCps);
let o = sinOsc([f, f + 0.7], 0);
o.cube.cube * 0.1

/* duty */
let f = { :tr :trs |
	let n = dseq(Infinity, [7, 0, 3, 3, 3, drand(1, [5, 10, 12]), 7]) + 48;
	let a = decay2(
		tr,
		0.01,
		tRand(0.15, 0.35, tr) * mouseY(0.5, 2, 0, 0.2)
	) * tRand(0.01, 0.2, tr);
	let f = demand(tr, 0, (n + trs).midiCps);
	let o = sinOsc([f, f + tRand(0.7, 1.3, tr)], 0);
	o.cube.cube * a
};
let d = dseq(Infinity, [8, 3, 3, 2, 8, 4, 4]) / mouseX(9, 27, 1, 0.2);
let t1 = tDuty(d, 0, 1);
let t2 = pulseDivider(t1, 2, 0);
let t4 = pulseDivider(t1, 4, 0);
let t24 = pulseDivider(t1, 24, 0);
let b = demand(t24, 0, dseq(Infinity, [0, -1, -2]));
f(t1, b + 0) + f(t2, b + 12) + f(t4, b - 5)
