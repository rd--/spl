/* Monastic resonance (Jmcc) #5 ; mouse controls size and reverb time ; requires=AudioIn */
let decayTime = mouseX(0, 16, 0, 0.2);
let delayScale = mouseY(0.01, 1, 0, 0.2);
let s = audioIn([1, 2]) * 0.005;
let z = delayC(s.sum, 0.048, 0.048);
let y = combL(z, 0.1, { rand(0.01, 0.09) } ! 8 * delayScale, decayTime).sum;
5.timesRepeat {
	y := allpassC(y, 0.050, { rand(0, 0.05) } ! 2, 1)
};
leakDc(y, 0.995)
