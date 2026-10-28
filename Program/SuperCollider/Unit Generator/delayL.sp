/* delayL */
let osc = sinOsc(mouseX(110, 440, 1, 0.2), 0) * 0.1;
[osc, delayL(osc, 4, mouseY(0.5, 4, 0, 2))]

/* delayL ; stereo */
let osc = sinOsc(mouseX(110, 440, 1, 0.2) * [1, 1.03], 0) * 0.1;
osc + delayL(osc, 4, mouseY(0.5, 4, 0, 2))

/* delayL ; audio input ; warning=feedback */
let input = audioIn([1, 2]);
let delayTime = [
	mouseX(0.5, 4, 0, 2),
	mouseY(0.5, 4, 0, 2)
] * lfNoise2(1 / [5, 7]).abs;
input + delayL(input, 4, delayTime)
