/* Slow beating sines (Jmcc) #7 */
{
	let n = 20; /* n * 3 components in each channel */
	let d = 5.0; /* beating frequency deviation */
	let p = [];
	let q = [];
	n.timesRepeat {
		let freq = IRand(24, 84).MidiCps;
		p.add(freq);
		{ p.add(freq + d.Rand2) } ! 2;
		{ q.add(freq + d.Rand2) } ! 3
	};
	[p, q].collect { :freq |
		SinOscBank(
			freq,
			0.1,
			{ 2 * pi.Rand0 } ! (3 * n)
		)
	} / n
}.xfade(4, 4)
