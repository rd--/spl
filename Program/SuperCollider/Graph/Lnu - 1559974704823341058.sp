/* http://twitter.com/lukiss163/status/1559974704823341058 ; requires=StandardN */
let f = {
	StandardN((LfdNoise1(1) * 8 + 8).round(4), 1, 0.5, 0).abs
};
let p = LfPulse(linExp(f(), -1, 1, 4, 80).round(1).midiCps.Lag(0.05), 0, 0.5);
let w = linExp(LfSaw({ -8 } ! 2 * f(), 0), -1, 1, 100, f() * 8000);
(LeakDc(MoogFf(p, w, (LfdNoise1(1) * 2 + 2).abs, 0), 0.995)).tanh
