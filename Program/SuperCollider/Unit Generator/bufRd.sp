/* bufRd ; requires */
let numFrames = 2 * 48000;
let buf = bufAlloc(1, numFrames).bufClear;
let osc = sinOsc(lfNoise1(2) * 300 + 400, 0) * 0.1;
let wr = bufWr(buf, phasor(0, bufRateScale(buf), 0, bufFrames(buf), 0), 1, osc);
bufRd(1, buf, sinOsc(0.1, 0) * bufFrames(buf), 1, 2) <! wr
