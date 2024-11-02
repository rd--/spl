/* Freezer ; static instance ; requires=SfAcquire */
let sf = SfAcquireMono('CrotaleD6');
Freezer(sf, 0.35, [0.4 0.45], 0.6, 0.1, 0.05, [0.02 0.05], 0.1, 0, 0, [6 8])

/* Freezer ; static instance */
let sf = SfAcquireMono('CrotaleD6');
Freezer(sf, 0.3, [0.4 0.45], 0.6, [0.98 1], [0.001 0.005], 0, 0, 0, 0, 6)

/* Freezer ; static instance */
let sf = SfAcquireMono('CrotaleD6');
Freezer(sf, 0.3, [0.7 0.75], 0.6, 0.35, 0, 0.5, 0.5, 0, 0, 6)

/* Freezer ; static instance */
let sf = SfAcquireMono('CrotaleD6');
Freezer(sf, 0.2500, 0.2505, [0.1 0.2], 1, 0, 0.050, [0.005 0.010], 0, 0, 16)

/* Freezer ; k-rate instance */
let sf = SfAcquireMono('CrotaleD6');
let n = { :f :i :j |
	LfNoise2(f).LinLin(-1, 1, i, j)
};
let left = n(1, 0.3, [0.6 0.8]);
let right = left + n(1, 0.01, [0.05 0.1]);
Freezer(sf, left, right, [0.1 0.2], 0.5, 0.1, 0.5, 0.05, 0, 0, 24)

/* Freezer ; k-rate instance */
let sf = SfAcquireMono('CrotaleD6');
let n = { :i :j |
	LfNoise2(0.1).LinLin(-1, 1, i, j)
};
Freezer(
	sf,
	n(0.3, [0.4 0.5]),
	n(0.5, [0.6 0.7]),
	n(0.3, [0.6 0.8]),
	n(0.95, 1.05),
	n(0.05, 0.15),
	n(0.05, 0.15),
	n(0.05, 0.15),
	0,
	0,
	36
)

/* Freezer ; Event control */
let sf = SfAcquireMono('Floating');
Voicer(1, 16) { :e |
	let incr = 1;
	let incrOff = 0;
	let incrRand = 0;
	let rightRand = 0.1;
	let phaseSync = 0;
	let phaseRand = 1;
	let numLp = 4;
	Freezer(
		sf,
		e.x * 0.75,
		e.x * (0.75 + (e.y * 0.1)),
		e.y,
		[incr * (1 - e.z), incr * (1 - e.i)],
		incrOff,
		incrRand,
		rightRand + (e.y * 0.1),
		phaseSync,
		phaseRand,
		numLp
	) * e.z * e.w
}.Sum
