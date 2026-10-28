/* https://sccode.org/1-4Qy ; f0 ; 0100 */
{ :nextDelay |
	let z = iRand(1, 9) * 99;
	let a = delayN(
		lpf(inFb(2, 0), z),
		0.2, 0.2
	);
	release(
		sinOsc(z + [0, 3], a.pi),
		0, 6, 9
	) * 0.1
}.playEvery {
	6
}
