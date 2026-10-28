/* sc-140 ; 01 ; Nathaniel Virgo */
let a = combN(
	bpf(
		localIn(2, 0) * 7.5 + (saw([32, 33]) * 0.2),
		2 ^ (lfNoise0(4 / 3) * 4) * 300,
		0.1
	).distort,
	2,
	2,
	40
);
a <! localOut(a)

/* sc-140 ; 03 ; Tim Walters */
[0 .. 15].collect { :k |
	[0 .. 7].collect { :i |
		let e = decay(dust(1 / 4 ^ i), sinOsc(0.1, 0) + 1 * k + i) * k * 999;
		let ph = sinOsc(i * k ^ i / [4, 5], 0) * e;
		sinOsc(i * k * k, ph)
	}.product
}.mix

/* sc-140 ; 05 ; Batuhan Bozkurt */
let f = localIn(2, 0).tanh;
let k = latch(f[1].abs, impulse(1 / 4, 0));
f <! localOut(f + combC(blip([4, 6], 100 * k + 50) * 0.9, 1, k * 0.3, 50 * f))

/* sc-140 ; 07 ; Thor Magnusson */
let a = lfNoise0(8);
eqPan2([
	sinOsc(pulse(1, 0.5) * 24, 0),
	sinOsc(90 + (a * 90), 0),
	moogFf(saw(lfNoise0(4) * 333 + 666), a * xLine(1, 39, 99) * 99, 2, 0)
].sum, 0) / 3
