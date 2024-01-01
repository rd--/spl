(* MiRings ; basics ; requires=keywords *)
var in = Impulse(1, 0);
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

(* MiRings ; basics ; requires=keywords *)
var in = PinkNoise() * 0.05;
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

(* MiRings ; using the 'trig' input to excite the resonator ; requires=keywords *)
var trig = Dust(0.7);
var model = 1;
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

(* MiRings ; using the 'pit' input to set midi pitch and excite the resonator ; requires=keywords *)
var pit = LfNoise0(2).Range(30,	50);
var model = 2;
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

(* MiRings ; sympathetic strings ; requires=keywords *)
var trig = Dust(1);
var pit = Latch(WhiteNoise(), trig).Range(30, 60).RoundTo(1);
var struct = LfNoise2(0.4).Range(0, 1);
var model = 1;
var poly = 4;
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

(* MiRings ; inharmonic string ; requires=keywords *)
var trig = Dust(3);
var pit = Latch(WhiteNoise(), Dust(0.5)).Range(30, 60);
var struct = Latch(PinkNoise(),	trig).Range(0.1, 1);
var damp = 0.8;
var model = 2;
var poly = 4;
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

(* MiRings ; simple vibrato ; requires=keywords *)
var trig = Dust(0.5);
var pit = Latch(WhiteNoise(), trig).Range(36, 48) + SinOsc(3, 0);
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
