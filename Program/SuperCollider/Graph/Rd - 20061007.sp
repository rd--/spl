/* 20061007 ; rd */
let lwr = 48;
let tr = { dust(0.65) } ! 2;
{
	let n = linLin(lfNoise2(0.1), -1, 1, lwr, 72);
	let e = decay2(tr, 0.05, tRand(0.05, 0.75, tr));
	let x = pinkNoise() * e * 0.1;
	let m = lfNoise2(0.1);
	let f = lag(n.midiCps, 0.25);
	combC(x, lwr.midiCps.reciprocal, f.reciprocal, linLin(m, -1, 1, 1, 8))
} !> 12 * 0.1
