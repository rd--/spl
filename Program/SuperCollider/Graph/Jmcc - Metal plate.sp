/* Metal plate (Jmcc) #4 */
let n = 4; /* Number of delay lines */
let maxTm = 0.03; /* Maximum delay time */
let buf = { localBuf(1, 48000 * 0.03).zeroBuf } ! n; /* Allocate buffers for delay lines */
let tapTm = { rand(0.015, maxTm) } ! n; /* Assign random tap times */
let excFreq = mouseY(10, 8000, 0, 0.2); /* Excitation */
let excTrig = impulse(0.5, 0) * 0.1;
let exc = decay2(excTrig, 0.01, 0.2) * lfNoise2(excFreq);
let del = [1 .. n].collect { :i |
	delayTap(buf[i], tapTm[i]) /* Tap the delay lines */
};
let fltFreq = mouseX(10, 5000, 0, 0.2); /* Filter the taps */
let pan = tRand(-1 / 3, 1 / 3, excTrig); /* Pan location */
let flt = lpf(del, fltFreq) * 0.98;
[1 .. n].collect { :i |
	flt[i] <! delayWrite(buf[i], flt[i] + exc) /* Write to delay lines */
}.sum.eqPan2(pan)
