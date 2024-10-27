/* Early space music lp side one (Jmcc) #12 */
{
	let scale = [0 2 4 5 7 9 11];
	let octave = [24 36 48 60 72 84 96] - 3;
	let z =	[
		{
			let f = (scale.atRandom + octave.atRandom).MidiCps;
			let z = {
				let ff = f * (SinOsc(ExpRand(4, 6), 0) * 0.008 + 1);
				LfSaw([ff * Rand(0.99, 1.01), ff * Rand(0.99, 1.01)], 0) * 0.01
			} !+ 10;
			let x = z.Lpz2.Lpz2;
			(0.3.coin & { f < 1400 }).ifTrue {
				let ff = SinOsc(Rand(0.3, 0.8), 0) * f * Rand(0.5, 3) + (f * Rand(4, 12));
				x := Rlpf(x, ff, 0.1)
			};
			x
		},
		{
			let rnd = { ExpRand(4, 12) * [1, Rand(0.9, 1.1)] };
			let rates = XLine(rnd(), rnd(), 12) * [1, -1].atRandom;
			let sw = LfSaw(rates, 0) * Rand(2, 16) + Rand(40, 120);
			let lfo = LfTri(ExpRand(0.25, 0.5) * [1, -1].atRandom, 0);
			let freq = (lfo * LinRand(4, 30, 0) + sw).MidiCps;
			CombN(SinOsc(freq, 0) * 0.02, 0.3, Rand(0.15, 0.3), 4)
		}
	].atRandom.value;
	CombN(z, 0.5, [0.5, 0.47], 7) + z.reversed
}.overlap(4, 4, 6)
