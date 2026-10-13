/* https://sccode.org/1-4Qy ; F0 ; 0002 */
{ :nextDelay |
	let o = EqPan2(
		Bpf(
			Impulse(
				LinRand(0, 18, 0) + 0.5,
				0
			),
			LinRand(0, 9999, 0),
			LinRand(0, 0.3, 0)
		) * 5,
		Rand(-1, 1)
	);
	Release(o, 0.02, nextDelay, 9)
}.playEvery {
	3
}
