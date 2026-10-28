/* delayWrite ; karplus-strong (adc) */
let freq = 100;
let repeatFreq = 0.3;
let feedbackCoef = 0.997;
let buffer = bufAlloc(1, 48000 * 0.3).bufClear;
let exciter = decay(impulse(0.2, 0), 0.02) * pinkNoise();
let filterFreq = mouseY(20000, 2000, 1, 0.2);
let delayedSignal = delayTap(buffer, 1 / freq);
let filteredSignal = lpf(delayedSignal, filterFreq);
let mixedSignal = (filteredSignal * feedbackCoef) + exciter;
mixedSignal <! delayWrite(buffer, mixedSignal)
