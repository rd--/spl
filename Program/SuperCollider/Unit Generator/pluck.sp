/* pluck ; https://scsynth.org/t/4318/17 */
let freq = lfNoise2(1);
let trig = impulse(linExp(freq, -1, 1, 1, 100), 0);
let freqs = (60.5 + [0 2 4 5 7 9 10]).midiCps;
let snd = pluck(hasher(sweep(trig, 1)) * -10.dbAmp, trig, 1 / freqs, 1 / freqs, 0.9, 0.5);
snd := leakDc(snd, 0.995).sum;
snd := moogFf(snd, linExp(lfNoise2(1), -1, 1, 500, 16000), 0, 0);
eqPan(snd, freq)

/* pluck ; Event control */
voicer(1, 16) { :e |
	let dm = 1 / 220;
	let dl = (e.x.negate * 0.9 + 1) * dm;
	let sig = pluck(whiteNoise() * e.z, e.w, dm, dl, 10, e.y / 3);
	eqPan2(sig, e.i * 2 - 1)
}.mix

/* pluck ; Event control */
(
	w: sinOsc(rand([2 .. 9] / 11, 1), 0),
	x: lfNoise2(rand([9 .. 2; -1] / 13, 1)).linLin(-1, 1, 0, [2 .. 9] / 17),
	y: lfNoise2(rand([2 .. 9] / 15, 2)).linLin(-1, 1, [9 .. 2; -1] / 19, 1),
	z: lfNoise2(rand(1, [9 .. 2; -1] / 11)).linLin(-1, 1, 0, [2 .. 9] / 9)
).voicer { :e |
	let dm = 1 / 220;
	let dl = (e.x.negate * 0.9 + 1) * dm;
	let sig = pluck(whiteNoise() * e.z, e.w, dm, dl, 10, e.y / 3);
	eqPan2(sig, e.y * 2 - 1) * 0.25
}.mix
