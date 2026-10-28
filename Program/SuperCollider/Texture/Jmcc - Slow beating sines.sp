/* Slow beating sines (Jmcc) #7 */
{
	let n = 20; /* n * 3 components in each channel */
	let d = 5; /* beating frequency deviation */
	let p = [];
	let q = [];
	n.timesRepeat {
		let freq = iRand(24, 84).midiCps;
		p.add!(freq);
		{ p.add!(freq + rand(-d, d)) } ! 2;
		{ q.add!(freq + rand(-d, d)) } ! 3
	};
	[p q].collect { :freq |
		sinOscBank(
			freq,
			0.1,
			{ rand(0, 2.pi) } ! (3 * n)
		)
	} / n
}.xFadeTextureProgram(4, 4)
