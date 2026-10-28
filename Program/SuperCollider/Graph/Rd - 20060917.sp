/* 20060917 ; rd ; requires=DustRange */
let b = [
	60 71 89 65 36 57 92 97 92 97;
	71 89 60 57 65 36 95 92 93 97
].localBuf;
let clk = dustRange(0.2, 0.9);
let env = decay2(clk, 0.2, 2.5);
let idx = stepper(clk, 0, 0, 15, 1, 0);
let f1 = (bufRd(1, b, idx, 1, 1) - 24).midiCps;
let f2 = lfNoise0([1, 3]) * 1.2 + f1;
sinOsc(f1, 0) + sinOsc(f2, 0) * env * 0.2
