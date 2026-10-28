/* miRings ; basics ; requires=keywords */
let in = impulse(1, 0);
miRings(in: in,
	trig: 0,
	pit: 60,
	struct: 0.25,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: 0,
	poly: 1,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
)

/* miRings ; basics ; requires=keywords */
let in = pinkNoise() * 0.05;
miRings(in: in,
	trig: 0,
	pit: 40,
	struct: 0.25,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: 0,
	poly: 1,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
)

/* miRings ; using the 'trig' input to excite the resonator ; requires=keywords */
let trig = dust(0.7);
let model = 1;
miRings(in: 0,
	trig: trig,
	pit: 38,
	struct: 0.25,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: model,
	poly: 1,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
) * 0.2

/* miRings ; using the 'pit' input to set midi pitch and excite the resonator ; requires=keywords */
let pit = lfNoise0(2).linLin(-1, 1, 30,	50);
let model = 2;
miRings(in: 0,
	trig: 0,
	pit: pit,
	struct: 0.25,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: model,
	poly: 1,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
) * 0.5

/* miRings ; sympathetic strings ; requires=keywords */
let trig = dust(1);
let pit = latch(whiteNoise(), trig).linLin(-1, 1, 30, 60).round(1);
let struct = lfNoise2(0.4).linLin(-1, 1, 0, 1);
let model = 1;
let poly = 4;
miRings(in: 0,
	trig: 0,
	pit: pit,
	struct: struct,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: model,
	poly: poly,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
) * 0.5

/* miRings ; inharmonic string ; requires=keywords */
let trig = dust(3);
let pit = latch(whiteNoise(), dust(0.5)).linLin(-1, 1, 30, 60);
let struct = latch(pinkNoise(),	trig).linLin(-1, 1, 0.1, 1);
let damp = 0.8;
let model = 2;
let poly = 4;
miRings(in: 0,
	trig: trig,
	pit: pit,
	struct: struct,
	bright: 0.5,
	damp: damp,
	pos: 0.25,
	model: model,
	poly: poly,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
) * 0.25

/* miRings ; simple vibrato ; requires=keywords */
let trig = dust(0.5);
let pit = latch(whiteNoise(), trig).linLin(-1, 1, 36, 48) + sinOsc(3, 0);
miRings(in: 0,
	trig: 0,
	pit: pit,
	struct: 0.2,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: 0,
	poly: 1,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
)
