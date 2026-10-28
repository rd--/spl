/* decay ; As envelope */
let tr = lfPulse(mouseX(3, 21, 1, 0.2), 0.2, 0.0004);
decay(tr, { tRand(0.01, 0.35, tr) } ! 2) * sinOsc({ tRand(500, 700, tr) } ! 2, 0) * 0.1

/* dust ; As envelope ; Applicative form */
let lfo = { :freq :lo :hi |
	lfNoise2(freq).linLin(-1, 1, lo, hi)
};
allpassN(
	bpf(
		pinkNoise() * decay(
			dust([3 / 5, 5 / 7]) * 1 / 4,
			lfo(1 / 3, 1 / 5, 5 / 7)
		),
		lfo(1 / 3, 700, 2300),
		lfo(1 / 3, 1 / 9, 3)
	),
	1 / 5,
	1 / 5,
	lfo(1 / 3, 1 / 3, 3)
)

/* dust ; As envelope ; Left-to-right */
dust(1).*(0.25).decay(0.2).*(pinkNoise()).allpassN(0.2, 0.2, 3)

/* dust ; As envelope ; Left-to-right */
let lfo = { :freq :lo :hi |
	lfNoise2(freq).linLin(-1, 1, lo, hi)
};
dust([3 / 5, 5 / 7])
.*(1 / 4)
.decay(lfo(1 / 3, 1 / 5, 5 / 7))
.*(pinkNoise())
.bpf(lfo(1 / 3, 700, 2300), lfo(1 / 3, 1 / 9, 3))
.allpassN(1 / 5, 1 / 5, lfo(1 / 3, 1 / 3, 3))
