/* https://twitter.com/headcube/status/273708223440244736; nv ; kr... */
let n = {
	lfNoise1(1 / 8)
};
[
	rlpf(
		saw([200, 302]).mean,
		5 ^ n() * 1000,
		0.6
	) + rlpf(
		saw(
			amplitude(
				3 ^ n() * 3000 * inFeedback(1, 0) + 1,
				4,
				4
			)
		),
		1000,
		1
	) / 5
] # 2
