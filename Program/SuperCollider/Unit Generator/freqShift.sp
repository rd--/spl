/* freqShift */
let a = blip(60, 4) * lfGauss(4, 1 / 8, 0, 1, 0);
let b = a / 4 + localIn(2, 0);
let c = freqShift(b, lfNoise0(1 / 4) * 90, 0);
c <! localOut(delayC(c, 1, 0.1) * 0.9)
