/* http://twitter.com/sluyterrific_sc/status/435684664200540161 (es) */
[1 .. 99].collect { :i |
	let m = i % (lfNoise2(0.01) * 50 + 50) + (lfNoise2(0.1) * 10 + 40);
	sinOsc(m.midiCps, 0) * (lfNoise2(1) * 0.1 + 0.1)
}.splay
