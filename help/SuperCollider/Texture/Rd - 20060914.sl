/* 20060914 ; Rd */
{
	let chord = { :m |
		let ds = 3;
		let du = [5 4 5 7 4 5];
		let d = du * ds;
		let freq = XLine(m, m + Rand(0.05, 0.5), d).MidiCps;
		let env = Sine(1, du.max * ds) * Rand(0.005, 0.01);
		let pos = XLine(1.Rand2, 1.Rand2, d);
		let osc = SinOsc(freq, 0);
		EqPan(osc, pos).Sum * env
	};
	let mnn = ([4 5 6 7] * 12) +.x [0 2 4 5 7 9 11];
	let chd = { mnn.atRandom } ! 6;
	{ chd.chord } !+ 9
}.overlap(21, 0, 3)
