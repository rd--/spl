/* decay2 */
{
	let tr = dust(1);
	let env = decay2(
		tr,
		tRand(0.01, 0.2, tr),
		tRand(0.2, 1, tr)
	);
	sinOsc(tRand(110, 330, tr), 0) * env
} !^ 5

/* decay2 ; c.f. MultiTouchPad help file */
Voicer(1, 16) { :e |
	let impulseFreq = tChoose(e.w, [1 2 3 4 6 8 9]);
	let oscFreq = tRand(80, 880, e.w);
	let mul = (1 - e.y) * e.w;
	let pan = (e.x * 2) - 1;
	let distort = e.z * 16;
	let decay = e.z * 2;
	let trig = impulse(impulseFreq, 0);
	let snd = sinOsc(oscFreq, 0) * decay2(trig, 0.01, 0.2 * decay);
	eqPan2(
		(snd * distort).tanh / distort,
		pan.lag(0.1)
	) * mul.lag(0.1)
}.mix

/* decay2 ; c.f. MultiTouchPad help file */
{
	let tr = dust(1 / 9);
	let impulseFreq = tChoose(tr, [1 2 3 4 6 8 9]);
	let oscFreq = tRand(20, 880, tr);
	let distort = tRand(0.1, 8, tr);
	let env = decay2(impulse(impulseFreq, 0), 0.01, 0.2 * tRand(0.1, 1, tr));
	let snd = sinOsc(oscFreq, 0) * env;
	eqPan2(
		(snd * distort).tanh / distort,
		tRand(-1, 1, tr)
	) * txLine(tRand(0.2, 0.5, tr), 0.001, tRand(3, 7, tr), impulse(0, 0) + tr)
} !> 16

/* decay2 */
let lfo = sinOsc([1, 11], 0);
let tr = tr1(lfo);
sinOsc([222, 2222], 0) * decay2(tr, 0.01, [0.5, 0.1]) * [0.2, 0.1]

/* decay2 */
{
	let lfo = sinOsc(rand(1, 13), 0);
	let tr = tr1(lfo);
	let env = decay2(tr, 0.01, rand(0.1, 0.5));
	sinOsc(rand(1111, 2222), 0) * env * rand(0.01, 0.1)
} !^ 24
