/* Shepard tones ; Adc */
let ampTable = 1024.hannWindowTable.square.localBuf;
let freqTable = [0 .. 1023].collect { :i |
	0.5 ^ (i / 1024 * 10) * 20000
}.localBuf;
let rateScale = 1024 / 44100 / 10;
let rate = 0.1;
let ph = phasor(0, rate * rateScale, 0, 1024, 0);
let phases = [0 .. 9] * 0.1 * 1024 + ph;
let freqs = bufRd(1, freqTable, phases, 1, 2);
let amps = bufRd(1, ampTable, phases, 1, 2);
(sinOsc(freqs, 0) * amps).sum * 0.1
