/* Uplink (Jmcc) #2 */
{
	let osc = {
		let e = lfPulse(rand(0, 4), 0, rand(0, 1)) * rand(0, 8000) + rand(0, 2000);
		lfPulse(rand(0, 20), 0, rand(0, 1)) * e
	};
	let freq = osc() + osc();
	eqPan(lfPulse(freq, 0, 0.5), rand(-0.8, 0.8)) * 0.04
}.overlapTextureProgram(4, 1, 5)
