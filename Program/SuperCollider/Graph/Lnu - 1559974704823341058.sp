/* http://twitter.com/lukiss163/status/1559974704823341058 ; requires=StandardN */
let f = {
	standardN((lfdNoise1(1) * 8 + 8).round(4), 1, 0.5, 0).abs
};
let p = lfPulse(linExp(f(), -1, 1, 4, 80).round(1).midiCps.lag(0.05), 0, 0.5);
let w = linExp(lfSaw({ -8 } ! 2 * f(), 0), -1, 1, 100, f() * 8000);
(leakDc(moogFf(p, w, (lfdNoise1(1) * 2 + 2).abs, 0), 0.995)).tanh
