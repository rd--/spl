/* Bidirectional strummable guitar (Jmcc) #11 */
let pitch1 = [52 57 62 67 71 76];
let pitch2 = pitch1 + 7;
let mouseX = mouseX(0, 1, 0, 0.2);
let str = pitch1.indices.collect { :i |
	let trigger = hpz1(mouseX > (0.25 + (i * 0.1)));
	let pluck1 = pinkNoise() * decay(trigger.max(0), 0.05);
	let period1 = pitch1[i].midiCps.reciprocal;
	let string1 = combL(pluck1, period1, period1, 4);
	let pluck2 = brownNoise() * decay(trigger.-.max(0), 0.05);
	let period2 = pitch2[i].midiCps.reciprocal;
	let string2 = combL(pluck2, period2, period2, -4);
	eqPan2(string1 + string2, i * 0.2 - 0.5)
};
leakDc(lpf(str.mix, 12000), 0.995)
