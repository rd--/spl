{- Arachnid espresso ; Jmcc -}
{
	let [p, pf] = [1 1; 1 1; -1 2].atRandom; {- choose string or pipe -}
	let r = [8 4 2].atRandom;
	let c = Impulse(r, 0);
	let t = ImpulseSequencer(
		[
			1 1 0 0 0 0 0 0;
			1 1 1 0 0 0 0 0;
			1 1 1 1 0 0 0 0
		].atRandom.shuffled,
		c
	);
	let e = Trig(t, Rand(0.3, 0.9) / r);
	let f = pf * Sequencer(
		{ Rand(24, 96).MidiCps } ! [1 .. 4].atRandom,
		t
	).Lag(0.1 / r);
	let n = Lpz2(LfNoise2(Min(f * 24, 12000)) * 0.2 * e);
	let z = EqPan2(
		CombC(n, 0.1, 1 / f, Min(0.5, ExpRand(90, 240) / f) * p) * 0.2,
		1.Rand2
	);
	6.timesRepeat {
		z := AllpassL(z, 0.03, [0.03.Rand0, 0.03.Rand0], 3)
	};
	z
}.overlap(19, 0.5, 5)
