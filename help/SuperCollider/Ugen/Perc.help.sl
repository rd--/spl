{- Perc ; EnvGen of EnvPerc without level input ; c.f. Asr for gate variant -}
let tr = Impulse(1, 0);
SinOsc(TRand(200, 500, tr), 0) * Perc(tr, 0.01, 1, -4) * 0.1

{- Perc -}
{
	let tr = Dust(1 / 4);
	SinOsc(TRand(200, 500, tr), 0) * Perc(tr, 0.01, TRand(1, 4, tr), -4) * 0.2
} !^ 9

{- Perc ; linear attack decay envelope -}
Impulse(1, 0).Perc(0.01, 0.1, 0) * SinOsc(220, 0) * 0.1
