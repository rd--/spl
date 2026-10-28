/* https://sccode.org/1-4Qy ; f0 ; 0252 */
let i = 0;
let f = [5, 10, 12, 20, 24] * 10;
{ :nextDelay |
	let e = line(0, 1.pi, 10).sin;
	let o = moogFf(
		syncSaw([7, 8], f.atWrap(i)),
		4000 * e,
		2,
		0
	) * e / 3;
	i := i + 2;
	release(o, 0.02, 10, 0.02)
}.playEvery {
	1
}
