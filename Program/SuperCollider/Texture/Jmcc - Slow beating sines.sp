/* Slow beating sines (Jmcc) #7 */
{
	let n = 20; /* n * 3 components in each channel */
	let d = 5; /* beating frequency deviation */
	let p = [];
	let q = [];
	n.timesRepeat {
		let freq = IRand(24, 84).MidiCps;
		p.add(freq);
		{ p.add(freq + Rand(-d, d)) } ! 2;
		{ q.add(freq + Rand(-d, d)) } ! 3
	};
	[p, q].collect { :freq |
		SinOscBank(
			freq,
			0.1,
			{ Rand(0, 2.pi) } ! (3 * n)
		)
	} / n
}.xFadeTextureProgram(4, 4)
