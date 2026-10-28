/* combN */
let m = lfNoise1(3) * 24 + (lfSaw([5, 5.123], 0) * 3 + 80);
combN(sinOsc(m.midiCps, 0) * 0.4, 1, 0.3, 2)

/* combN ; karplus-strong ; mouse control of frequency ; no interpolation (adc) */
let freq = mouseX(220, 1760, 1, 0.2);
let repeatFreq = 0.3;
let exciter = decay(impulse(repeatFreq, 0), 0.02) * pinkNoise();
combN(exciter, 0.1, 1 / freq, 3)
