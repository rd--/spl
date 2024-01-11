{- Uplink (Jmcc) #2 -}
{
	let osc = {
		let e = LfPulse(4.Rand0, 0, 1.Rand0) * 8000.Rand0 + 2000.Rand0;
		LfPulse(20.Rand0, 0, 1.Rand0) * e
	};
	let freq = osc() + osc();
	EqPan(LfPulse(freq, 0, 0.5), 0.8.Rand2) * 0.04
}.overlap(4, 1, 5)
