/* 20060922 ; rd ; requires=Perc */
let t0 = impulse(1 / 0.3, 0);
let t1 = [t0, tDelay(t0, 0.15)];
let k = tRand(56, 57, t1);
sinOsc(
	sinOsc(k.midiCps, 0).*+(
		tRand(40, 480, t1),
		(k + 1 + tRand(-1, 1, t1)).midiCps
	),
	0
) * perc(t1, 0.01, 0.9, -4) * 0.1
