/* lpf ; https://scsynth.org/t/5208/7 ; at very low frequencies lpf acts strangely */
let impulseFreq = 3;
let lfo = lfPulse(impulseFreq, 0, 0.5);
let freq = linExp(mouseX(0, 1, 0, 0.2), 0, 1, impulseFreq, 20000);
sinOsc(200 + (lpf(lfo, freq) * 200), 0) * 0.1

/* lpf */
lpf(whiteNoise(), 500) * 0.1

/* lpf ; modulate frequency */
lpf(whiteNoise(), sinOsc([0.1, 0.13], 1.pi) * [2300, 3000] + 3500) * 0.1

/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
[
	lpf(saw(mouseX(50, 500, 0, 0.2)), mouseY(50, 1500, 1, 0.2)),
	lpf(saw(mouseX(60, 600, 0, 0.2)), mouseY(60, 1600, 1, 0.2)),
	lpf(saw(mouseX(75, 1700, 0, 0.2)), mouseY(70, 1700, 1, 0.2)),
	lpf(saw(mouseX(80, 800, 0, 0.2)), mouseY(80, 1800, 1, 0.2))
].sum * 0.1

/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
lpf(
	saw(mouseX([50 60 75 80], [500 600 1700 800], 0, 0.2)),
	mouseY([50 60 70 80], [1500 1600 1700 1800], 1, 0.2)
).sum * 0.1
