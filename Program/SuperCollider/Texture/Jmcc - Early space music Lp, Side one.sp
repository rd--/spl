/* Early space music lp side one (Jmcc) #12 */
{
	let scale = [0 2 4 5 7 9 11];
	let octave = [24 36 48 60 72 84 96] - 3;
	let fList = [
		{
			let f = (scale.atRandom + octave.atRandom).midiCps;
			let z = {
				let ff = f * (sinOsc(expRand(4, 6), 0) * 0.008 + 1);
				lfSaw([ff * rand(0.99, 1.01), ff * rand(0.99, 1.01)], 0) * 0.01
			} !+ 10;
			let x = z.lpz2.lpz2;
			(system.coin(0.3) & { f < 1400 }).ifTrue {
				let ff = sinOsc(rand(0.3, 0.8), 0) * f * rand(0.5, 3) + (f * rand(4, 12));
				x := rlpf(x, ff, 0.1)
			};
			x
		},
		{
			let rnd = { expRand(4, 12) * [1, rand(0.9, 1.1)] };
			let rates = xLine(rnd(), rnd(), 12) * [1, -1].atRandom;
			let sw = lfSaw(rates, 0) * rand(2, 16) + rand(40, 120);
			let lfo = lfTri(expRand(0.25, 0.5) * [1, -1].atRandom, 0);
			let freq = (lfo * linRand(4, 30, 0) + sw).midiCps;
			combN(sinOsc(freq, 0) * 0.02, 0.3, rand(0.15, 0.3), 4)
		}
	];
	let f/0 = fList.atRandom;
	let z = f();
	combN(z, 0.5, [0.5, 0.47], 7) + z.reverse
}.overlapTextureProgram(4, 4, 6)
