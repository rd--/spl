{- Decay2 -}
{
	let tr = Dust(1);
	let env = Decay2(
		tr,
		TRand(0.01, 0.2, tr),
		TRand(0.2, 1, tr)
	);
	SinOsc(TRand(110, 330, tr), 0) * env
} !^ 5

{- Decay2 ; c.f. MultiTouchPad help file -}
Voicer(1, 16) { :e |
	let impulseFreq = Choose(e.w, [1 2 3 4 6 8 9]);
	let oscFreq = TRand(80, 880, e.w);
	let mul = (1 - e.y) * e.w;
	let pan = (e.x * 2) - 1;
	let distort = e.z * 16;
	let decay = e.z * 2;
	let trig = Impulse(impulseFreq, 0);
	let snd = SinOsc(oscFreq, 0) * Decay2(trig, 0.01, 0.2 * decay);
	EqPan2(
		(snd * distort).Tanh / distort,
		pan.Lag(0.1)
	) * mul.Lag(0.1)
}.Mix

{- Decay2 ; c.f. MultiTouchPad help file -}
{
	let tr = Dust(1 / 9);
	let impulseFreq = Choose(tr, [1 2 3 4 6 8 9]);
	let oscFreq = TRand(20, 880, tr);
	let distort = TRand(0.1, 8, tr);
	let env = Decay2(Impulse(impulseFreq, 0), 0.01, 0.2 * TRand(0.1, 1, tr));
	let snd = SinOsc(oscFreq, 0) * env;
	EqPan2(
		(snd * distort).Tanh / distort,
		TRand(-1, 1, tr)
	) * TxLine(TRand(0.2, 0.5, tr), 0.001, TRand(3, 7, tr), Impulse(0, 0) + tr)
} !> 16

{- Decay2 -}
let lfo = SinOsc([1, 11], 0);
let tr = Tr1(lfo);
SinOsc([222, 2222], 0) * Decay2(tr, 0.01, [0.5, 0.1]) * [0.2, 0.1]

{- Decay2 -}
{
	let lfo = SinOsc(Rand(1, 13), 0);
	let tr = Tr1(lfo);
	let env = Decay2(tr, 0.01, Rand(0.1, 0.5));
	SinOsc(Rand(1111, 2222), 0) * env * Rand(0.01, 0.1)
} !^ 24

{- ---- ; plot ; excitation function -}
let strike = Impulse(1, 0);
let env = Decay2(strike, 0.01, 0.06);
let noise = LfNoise2(3000) * env;
[env, noise] * 0.4
