/* https://sccode.org/1-4Qy ; F0 ; 0001 */
[0 .. 23].collectTextureProgram { :each |
	let p = sinOsc(each % 9 // 3 * 100 + (each % 9) + 500, 0);
	release(
		eqPan(
			sinOsc(each + 1, p) * 0.03,
			rand(-1, 1)
		),
		0, 2, 25
	)
} { 2 }
