/* Harmonic zither (Jmcc) #11 ; mouse control */
let pitch = [50 53.86 57.02 59.69 62 64.04 65.86 67.51 69.02 71.69 72.88 74];
let triggerSpacing = 0.5 / (pitch.size - 1);
let panSpacing = 1.5 / (pitch.size - 1);
let strings = pitch.indices.collect { :i |
	let trigger = hpz1(mouseX(0, 1, 0, 0.2) > (0.25 + i * triggerSpacing)).abs;
	let pluck = pinkNoise() * decay(trigger, 0.05);
	let period = pitch[i].midiCps.reciprocal;
	let string = combL(pluck, period, period, 8);
	eqPan(string, i - 1 * panSpacing - 0.75)
};
leakDc(lpf(strings.sum, 12000), 0.995)
