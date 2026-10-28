/* http://www.fredrikolofsson.com/f0blog/?q=node/537 ; Graph rewrite (rd) */
let n = [
	0 0 0 0 0 0 0 3 4 6 4 0 3 2 0 0 0 0 1 6 0 1 0 0 0 0 0 0 4 0 0 3
	1 1 2 0 0 3 3 0 0 3 4 0 1 3 0 0 0 0 1 0 1 7 0 0 5 6 3 0 4 0 9 0
];
let b = [0 2 4 5 7 9 11].localBuf;
let tr = impulse(4, 0);
let k = b.degreeToKey(sequencer(n, tr), 12);
let e = decay2(tr, 0.01, tRand(0.15, 0.5, tr));
{
	let m = 48 + k + tRand(0, 0.05, tr);
	let b = blip(m.midiCps, tRand(1, 7, tr)) * e * 8;
	combC(b.tanh / 8, 1, 1, 8) * tRand(0.05, 0.15, tr)
} ! 2
