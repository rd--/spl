/* http://scsynth.org/t/phaseshaping-osc-algorithms/3926/4 ; Sp ; Event control ; http://core.ac.uk/download/pdf/297014559.pdf */
voicer(1, 16) { :e |
	let width = e.x.clip(0.05, 0.95);
	let freq = e.y * 800 + 200;
	let saw = linLin(lfSaw(freq / 2, 1), -1, 1, width.-, 1 - width);
	let trig = toggleFf(trig(saw.-, 2 / sampleRate()) + trig(saw, 2 / sampleRate()));
	let a = linLin(saw, width.-, 0, 0, 1.pi).sin;
	let b = linLin(saw, 0, 1 - width, 0, 2.pi).sin;
	select2(trig, a, b).eqPan2(0) * e.w * e.z
}.mix * 0.2
