/* Uplink (Jmcc) #2 */
{
	let osc = {
		let e = LfPulse(Rand(0, 4), 0, Rand(0, 1)) * Rand(0, 8000) + Rand(0, 2000);
		LfPulse(Rand(0, 20), 0, Rand(0, 1)) * e
	};
	let freq = osc() + osc();
	EqPan(LfPulse(freq, 0, 0.5), Rand(-0.8, 0.8)) * 0.04
}.overlapTextureProgram(4, 1, 5)
