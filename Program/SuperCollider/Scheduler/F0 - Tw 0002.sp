/* https://sccode.org/1-4Qy ; F0 ; 0002 */
{ :nextDelay |
	let o = eqPan2(
		bpf(
			impulse(
				linRand(0, 18, 0) + 0.5,
				0
			),
			linRand(0, 9999, 0),
			linRand(0, 0.3, 0)
		) * 5,
		rand(-1, 1)
	);
	release(o, 0.02, nextDelay, 9)
}.playEvery {
	3
}
