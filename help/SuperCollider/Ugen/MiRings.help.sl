/* MiRings ; basics ; requires=keywords */
let in = Impulse(1, 0);
MiRings(in: in,
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

/* MiRings ; basics ; requires=keywords */
let in = PinkNoise() * 0.05;
MiRings(in: in,
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

/* MiRings ; using the 'trig' input to excite the resonator ; requires=keywords */
let trig = Dust(0.7);
let model = 1;
MiRings(in: 0,
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

/* MiRings ; using the 'pit' input to set midi pitch and excite the resonator ; requires=keywords */
let pit = LfNoise0(2).LinLin(-1, 1, 30,	50);
let model = 2;
MiRings(in: 0,
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

/* MiRings ; sympathetic strings ; requires=keywords */
let trig = Dust(1);
let pit = Latch(WhiteNoise(), trig).LinLin(-1, 1, 30, 60).RoundTo(1);
let struct = LfNoise2(0.4).LinLin(-1, 1, 0, 1);
let model = 1;
let poly = 4;
MiRings(in: 0,
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

/* MiRings ; inharmonic string ; requires=keywords */
let trig = Dust(3);
let pit = Latch(WhiteNoise(), Dust(0.5)).LinLin(-1, 1, 30, 60);
let struct = Latch(PinkNoise(),	trig).LinLin(-1, 1, 0.1, 1);
let damp = 0.8;
let model = 2;
let poly = 4;
MiRings(in: 0,
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

/* MiRings ; simple vibrato ; requires=keywords */
let trig = Dust(0.5);
let pit = Latch(WhiteNoise(), trig).LinLin(-1, 1, 36, 48) + SinOsc(3, 0);
MiRings(in: 0,
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
