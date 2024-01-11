{- Slow beating harmonic sines (Jmcc) #7 -}
{
	let n = 8; {- number of notes -}
	let d = 0.4; {- beat frequency deviation -}
	let m = 5; {- harmonics per note -}
	let p = [];
	let q = [];
	let k = 24 + 12.atRandom;
	n.timesRepeat {
		let freq = ([0, 2, 4, 5, 7, 9].atRandom + (IRand(0, 7) * 12) + k).MidiCps;
		[p, q].do { :each |
			[1, 2, 4, 5, 6].do { :h |
				each.add(freq * h + d.Rand2)
			}
		}
	};
	[p, q].collect { :freq |
		SinOscBank(freq, 0.1, { 2 * Rand(0, pi) } ! (m * n))
	} / n
}.xfade(6, 3)
