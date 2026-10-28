/* https://sccode.org/1-4Qy ; F0 ; 0252 */
[0 .. 23].collectTextureProgram { :each |
	let e = line(0, 1.pi, 10).sin;
	let o = syncSaw([7 8], ([5 10 12 20 24] * 10).atWrap(each * 2));
	let f = moogFf(o, 4000 * e, 2, 0) * e / 3;
	release(f, 0.02, 10, 0.02)
} { 1 }
