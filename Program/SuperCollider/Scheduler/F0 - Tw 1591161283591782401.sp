/* https://twitter.com/redFrik/status/1591161283591782401 */
{ :nextDelay |
	let d = 1 / 12;
	let b = [1 .. 8] / 4;
	let l = lfTri(d, b) / 8;
	let m = { [0 2 5 7 9].atRandom + [36 48].atRandom } ! 4 + l;
	let y = varSaw(m.midiCps, 0, l + 0.4);
	let z = rlpf(y, 8 ^ lfTri(d * b, 0) * 999, 1);
	let a = allpassC(z, 1, lfTri([6 4 6] / 4, [0 1]) + 1 / 2, 1);
	let x = allpassC(a * d, 1, 1 / 2, 4).splay;
	release(x, 9, nextDelay, 24)
}.playEvery {
	(0 -- 9).atRandom / 8 + (8 -- 41).atRandom
}
