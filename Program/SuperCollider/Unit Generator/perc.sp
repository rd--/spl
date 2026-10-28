/* perc ; envGen of EnvPerc without level input ; c.f. asr for gate variant */
let tr = impulse(1, 0);
sinOsc(tRand(200, 500, tr), 0) * perc(tr, 0.01, 1, -4) * 0.1

/* perc */
{
	let tr = dust(1 / 4);
	sinOsc(tRand(200, 500, tr), 0) * perc(tr, 0.01, tRand(1, 4, tr), -4) * 0.2
} !^ 9

/* perc ; linear attack decay envelope */
impulse(1, 0).perc(0.01, 0.1, 0) * sinOsc(220, 0) * 0.1
