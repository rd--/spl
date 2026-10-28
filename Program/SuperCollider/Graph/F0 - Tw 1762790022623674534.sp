/* https://twitter.com/redFrik/status/1762790022623674534 (f0) */
let l = localIn(5, 0);
let y = [0 3.084 5.028 6.972 10.056];
let z = sinOsc(
	(sinOsc(1 / 5 * l, [0 .. 4] / 5 * 2.pi).round(1) * 12 + 60 + y).midiCps,
	delayN(l, 1 / 5, 1 / 5) * 2.pi
) / 5;
hpf(z, 9).splay <! localOut(z)
