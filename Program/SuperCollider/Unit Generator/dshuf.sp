/* dshuf */
let seq = dseq(Infinity, [dshuf(3, [1 3 2 7 8.5])]);
let trig = impulse(mouseX(1, 40, 1, 0.2), 0);
let freq = demand(trig, 0, seq) * 30 + 340;
sinOsc(freq, 0) * 0.1

/* dshuf ; audio rate */
let seq = dseq(Infinity, dshuf(5, { rand(0, 10) } ! 81));
let trig = impulse(mouseX(1, 10000, 1, 0.2), 0);
let freq = demand(trig, 0, seq) * 30 + 340;
sinOsc(freq, 0) * 0.1

/* dshuf ; embedded structures */
let seq = dseq(Infinity, [
	dshuf(8, [
		drand(1, [1, 2, 3]),
		3,
		drand(1, [20, 23, 56]),
		7,
		8.5
	])
]);
let trig = impulse(mouseX(1, 40, 1, 0.2), 0);
let freq = demand(trig, 0, seq) * 30 + 340;
sinOsc(freq, 0) * 0.1
