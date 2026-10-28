/* phasor ; phase modulation ; mouse control */
let carFreq = 440;
let modFreq = mouseX(1, 1000, 1, 0.2);
let modIndex = mouseY(0, 100, 0, 0.2);
let modDev = modFreq * modIndex;
let rateConversion = 2.pi / sampleRate();
let phase = phasor(0, carFreq * rateConversion, 0, 2.pi, 0);
let phaseOffset = sinOsc(modFreq, 0) * modDev * rateConversion;
[sinOsc(0, phase + phaseOffset), sinOsc(carFreq, 0)] * 0.1

/* sinOsc ; phase input ; constant frequency */
let freq = 440;
let rate = 2.pi * freq / sampleRate();
let phase = phasor(1, rate, 0, 2.pi, 0);
sinOsc(0, phase) * 0.1

/* phasor ; https://scsynth.org/t/8528/2 */
let raisedCos = { :phase :index |
	let cosine = (phase * 2.pi).cos;
	(index.abs * (cosine - 1)).exp
};
let rate = 110;
let modRatio = 2.5;
let index = sinOsc(0.3, 0).linLin(-1, 1, 0, 30);
let modPhase = phasor(dc(0), rate * modRatio * sampleDur(), 0, 1, 0);
let mod = (modPhase * 2.pi).sin;
let raisedCosWindow = raisedCos(modPhase, index);
let carPhase = phasor(dc(0), rate * sampleDur(), 0, 1, 0);
let car = (carPhase * 2.pi + (mod * index)).sin;
let sig = car * raisedCosWindow;
leakDc(sig, 0.995) * 0.1

/* IXA ; https://nathan.ho.name/posts/ixa-synthesis/ */
let ixa = { :freq :in :index |
	let phase = phasor(impulse(0, 0), freq / sampleRate(), 0, 1, 0);
	let w1 = (phase % 0.5 * 2.pi).sin * (2 * (phase % 0.5 < 0.25) - 1);
	let w2 = w1 + (2 * (phase % 0.5 >= 0.25));
	let w3 = w2 + (2 * (phase >= 0.5));
	(w3 + (in * index)).fold
};
let freq = 100;
[ixa(freq, sinOsc(freq, 0), line(0, 10, 3)) * 0.5] # 2
