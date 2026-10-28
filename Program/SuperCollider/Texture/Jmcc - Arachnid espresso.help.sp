/* Arachnid espresso ; Jmcc */
{
	let p = [1 1; 1 1; -1 2].atRandom; /* choose string or pipe */
	let r = [8 4 2].atRandom;
	let c = impulse(r, 0);
	let t = impulseSequencer(
		[
			1 1 0 0 0 0 0 0;
			1 1 1 0 0 0 0 0;
			1 1 1 1 0 0 0 0
		].atRandom.shuffle,
		c
	);
	let e = trig(t, rand(0.3, 0.9) / r);
	let f = p[2] * sequencer(
		{ rand(24, 96).midiCps } ! [1 .. 4].atRandom,
		t
	).lag(0.1 / r);
	let n = lpz2(lfNoise2(Min(f * 24, 12000)) * 0.2 * e);
	let z = eqPan2(
		combC(n, 0.1, 1 / f, Min(0.5, expRand(90, 240) / f) * p[1]) * 0.2,
		rand(-1, 1)
	);
	6.timesRepeat {
		z := allpassL(z, 0.03, [rand(0, 0.03), rand(0, 0.03)], 3)
	};
	z
}.overlapTextureProgram(19, 0.5, 5)
