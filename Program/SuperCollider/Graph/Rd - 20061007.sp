/* 20061007 ; rd */
let lwr = 48;
let tr = { Dust(0.65) } ! 2;
{
	let n = linLin(LfNoise2(0.1), -1, 1, lwr, 72);
	let e = Decay2(tr, 0.05, TRand(0.05, 0.75, tr));
	let x = PinkNoise() * e * 0.1;
	let m = LfNoise2(0.1);
	let f = Lag(n.midiCps, 0.25);
	CombC(x, lwr.midiCps.reciprocal, f.reciprocal, linLin(m, -1, 1, 1, 8))
} !> 12 * 0.1
