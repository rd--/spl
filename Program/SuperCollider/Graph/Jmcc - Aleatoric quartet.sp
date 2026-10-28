/* Aleatoric quartet (Jmcc) #7 */
let amp = 0.07;
let density = mouseX(0.01, 1, 0, 0.1);
let dMul = density.reciprocal * 0.5 * amp;
let dAdd = amp - dMul;
let rapf = { :in |
	allpassN(in, 0.05, { rand(0, 0.05) } ! 2, 1)
};
let mkFreq = {
	let n0 = lfNoise0(selectT(iRand(0, 2), [1, 0.5, 0.25]));
	lag((n0 * 7 + 66 + rand(-30, 30)).round(1), 0.2).midiCps
};
let g = [1 .. 4].collect { :ix |
	let x = pinkNoise() * (lfNoise1(8) * dMul + dAdd).max(0);
	eqPan2(combL(x, 0.02, mkFreq().reciprocal, 3), rand(-1, 1))
}.sum;
5.timesRepeat {
	g := rapf(g)
};
leakDc(g, 0.995)
