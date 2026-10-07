/* Rand */
let tr = Impulse(7, 0) * SinOsc(331, 0);
let env = Decay2(tr, { TRand(0.01, 0.05, tr) } ! 2, { TRand(0.05, 0.15, tr) } ! 2);
Rlpf(LfSaw(TRand(321, 333, tr), 0), (LfNoise1(2) * 4 + 100).MidiCps, 1) * env

/* Rand */
let tr = Dust(5);
let f = TRand(200, 500, tr);
SinOsc(f, 0) * 0.1

/* TRand ; list input */
let tr = Dust([5 12]);
let f = TRand([200 1600], [500 3000], tr);
SinOsc(f.Lag(0.07), 0) * TRand(0.01, 0.15, tr).Lag2(0.02)

/* TRand ; Jmcc/Rd */
let clock = Impulse(16, 0);
let x = SinOsc(TRand(2000, 12000, clock), 0) * Decay2(clock, 0.002, 0.04);
CombN(x, 0.2, { Rand(0.04, 0.2) } ! 2, 2) * XLine(0.2, 0.001, 9)

/* TRand ; Jmcc/Rd */
let clock = Impulse(XLine(24, 1, 12), 0);
let x = SinOsc(TRand(2000, 12000, clock), 0) * Decay2(clock, 0.002, 0.04);
{
	CombN(x, 0.1, { ExpRand(0.02, 0.05) } ! 2, 2) * XLine(0.2, 0.001, 9)
} !+ 2
