/* http://scsynth.org/t/7055 ; tmm881 ; rewrite for clarity &etc. */
let mouse = [
	mouseX(0, 1, 0, 0.2),
	mouseY(0, 1, 0, 0.2)
];
let tendencyMask = [
	xLine(0.5, 50, 300),
	xLine(0.25, 25, 600),
	xLine(0.125, 12.5, 900)
];
{
	let modRate = {
		tRand(
			1/2.pi,
			1.pi,
			impulse(tRand(1/2.pi, 1.pi, impulse(1/2.pi, 0)), 0)
		)
	} ! 3;
	let mod = {
		tRand(
			tendencyMask * 0.125,
			tendencyMask * 4,
			impulse(tendencyMask * modRate, 0)
		)
	} ! 2;
	let dur = [1 .. 3].collect { :i |
		rand(0.25, 4) * mod[1][i] * (mouse + 0.1).atRandom
	};
	let triggerRate = [1 .. 3].collect { :i |
		rand(0.25, 4) * mod[2][i] * (mouse / 10 + 0.1).atRandom
	};
	let freqMul = {
		(mouse * 10 + 0.1).atRandom
	} ! 3;
	let dry = [1 .. 3].collect { :i |
		let freqRange = 10 ^ i * [22, 88] * freqMul[i];
		let freq = {
			tRand(
				freqRange[1],
				freqRange[2],
				impulse(triggerRate[i], 0)
			) + [0, rand(-1, 1)]
		} ! 2;
		let tr = impulse(triggerRate[i], 0);
		grainFm(2, tr, dur[i], freq[1], freq[2], 1, whiteNoise() * 0.6, -1, 512) * 0.1
	}.sum;
	let rev = freeVerb(dry, 0.33, 0.5, 0.5);
	let del = combC(dry, 0.2, 0.2, 1);
	dry + rev + del * 0.2
}.!(4).sum.transpose.mix
