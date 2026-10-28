/* Griot modeling (Jmcc) */
let maxDt = 48000 * 0.03; /* Maximum delay time */
let n = 5; /* Number of delay lines */
let buf = { bufAlloc(1, maxDt).bufClear } ! n; /* Allocate buffers for delay lines */
let tapTimes = n.arithmeticProgression(0.003, 0.0005); /* Tap times to determine string pitches */
let exc = [1 .. n].collect { :i |
	let excEnv = Env([0 1 0], [0.01 0.2], -2, nil, nil, 0);
	let excTrig = impulse(n, 0);
	let excCh = demand(excTrig, 0, dbrown(Infinity, 0, n - 1, 1));
	let excFr = mouseY(10, 10000, 0, 0.2);
	let excSg = lfNoise2(excFr) * excEnv.asEnvGen(excTrig) * rand(0, 0.1);
	excSg * ((excCh - i).abs < 1)
};
let del = [1 .. n].collect { :i |
	delayTap(buf[i], tapTimes[i]) /* Tap the delay lines */
};
let flt = lpf(del, mouseX(10, 10000, 0, 0.2)) * 0.98; /* Filter the taps */
[
	[1 .. n].collect { :i |
		flt[i] <! delayWrite(buf[i], flt[i] + exc[i]) /* Write to delay lines */
	}.sum
] # 2
