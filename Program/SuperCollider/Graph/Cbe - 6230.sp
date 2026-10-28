/* http://scsynth.org/t/6230 (cbe) */
let freq = xLine(800, 1200, 100);
let osc = sinOsc(freq, 0);
let step1 = lfPulse(freq / 2, 0, 0.5) * 0.5 + 0.5;
let step2 = pulse(freq / 2, 0.5) * 0.5 + 0.5;
[osc * step1, osc * step2] * 0.1
