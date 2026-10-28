/* 20060914 ; Rd */
{
	let chord = { :m |
		let ds = 3;
		let du = [5 4 5 7 4 5];
		let d = du * ds;
		let freq = xLine(m, m + rand(0.05, 0.5), d).midiCps;
		let env = Sine(1, du.max * ds) * rand(0.005, 0.01);
		let pos = xLine(rand(-1, 1), rand(-1, 1), d);
		let osc = sinOsc(freq, 0);
		eqPan(osc, pos).sum * env
	};
	let mnn = ([4 5 6 7] * 12) +.x [0 2 4 5 7 9 11];
	let chd = { mnn.atRandom } ! 6;
	{ chd.chord } !+ 9
}.overlapTextureProgram(21, 0, 3)
