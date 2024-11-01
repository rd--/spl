/* https://sccode.org/1-4Qy ; F0 ; 0002 */
{ :currentTime |
	let o = Bpf(
		Impulse(LinRand(0.5, 18.5, 0), 0),
		LinRand(0, 9999, 0),
		LinRand(0, 0.3, 0)
	) * 5;
	Release(EqPan(o, 1.Rand2), 0, 3, 9).playAt(currentTime);
	(2 -- 3).atRandom
}.schedule
