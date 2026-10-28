/* Vibraphone simulation ; Kevin Larke ; Real Time Vibraphone Pitch and Timbre Classification ; Even control */
Voicer(1, 16) { :e |
	let freq = e.p.unitCps;
	let detune = e.y * 15;
	let freqs = freq * [1, 4, 10, 13.75 + detune];
	let hiFreqs = freq * [19.2, 20, 21.2];
	let modFreq = e.j * 4 + 3;
	let modAmp = e.k * 2;
	let mod = linLin(sinOsc(modFreq, tRand(0, 2.pi, e.w)), -1, 1, 1 - ([0.5, 0.3, 0.3, 0.5] * modAmp), 1);
	let velocity = latch(e.z, e.w) * 2;
	let sound = 0.3 * [1, 1.1 * velocity, 0.6 * velocity * velocity, 0.5 * velocity] * sinOsc(freqs, 0);
	let decay = 0;
	let decays = [1, 0.7 * (-1 * decay).exp, 0.5 * (-1 * decay).exp, 0.4 * (-1 * decay).exp];
	let zero = 0.000001;
	let soundMain = txLine(zero, 1, 1 / freqs, e.w) * txLine(1, zero, decays * 4, e.w) * sound * mod;
	let soundHigh = txLine(0.3 * (velocity + zero), zero, 0.02, e.w) * sinOsc(hiFreqs, 0); /* Hi frequency onset */
	let pan = e.i * 2 - 1;
	eqPan2(soundMain.sum + soundHigh.sum, pan) * lagUd(e.w, 0.01, 4)
}.mix * 0.25
