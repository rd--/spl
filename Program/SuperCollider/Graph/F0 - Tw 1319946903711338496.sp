/* http://twitter.com/redFrik/status/1319946903711338496 ; Graph rewrite (rd) */
let c = [0 0.804 1.944 3.084 3.888 5.028 5.832 6.972 7.776 8.916 10.056 10.86];
{ :tr |
	let i = pulseCount(tr, 0);
	let z = {
		let o = 12 * tRand(3, 6, tr);
		let n = selectT(tChoose(tr, [0, 2, 3, 5, 7, 8, 10]), c);
		let f = lfTri(1 / 99, 0) * 9 + (o + n).midiCps;
		let y = sinOscFb(f, lfTri(1 + i / 50, 0) + 1 / 2);
		let e = tRand(0, 1, tr) > 0.5 / 2;
		eqPan2(y, lfTri(i / 70, 0)) * e
	} !+ 9;
	combN(z, 0.2, 0.2, 1).tanh * 0.1
}.overlapTexture(3, 9, 2).mix
