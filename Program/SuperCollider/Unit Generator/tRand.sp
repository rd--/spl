/* rand */
let tr = impulse(7, 0) * sinOsc(331, 0);
let env = decay2(tr, { tRand(0.01, 0.05, tr) } ! 2, { tRand(0.05, 0.15, tr) } ! 2);
rlpf(lfSaw(tRand(321, 333, tr), 0), (lfNoise1(2) * 4 + 100).midiCps, 1) * env

/* rand */
let tr = dust(5);
let f = tRand(200, 500, tr);
sinOsc(f, 0) * 0.1

/* tRand ; list input */
let tr = dust([5 12]);
let f = tRand([200 1600], [500 3000], tr);
sinOsc(f.lag(0.07), 0) * tRand(0.01, 0.15, tr).lag2(0.02)

/* tRand ; Jmcc/Rd */
let clock = impulse(16, 0);
let x = sinOsc(tRand(2000, 12000, clock), 0) * decay2(clock, 0.002, 0.04);
combN(x, 0.2, { rand(0.04, 0.2) } ! 2, 2) * xLine(0.2, 0.001, 9)

/* tRand ; Jmcc/Rd */
let clock = impulse(xLine(24, 1, 12), 0);
let x = sinOsc(tRand(2000, 12000, clock), 0) * decay2(clock, 0.002, 0.04);
{
	combN(x, 0.1, { expRand(0.02, 0.05) } ! 2, 2) * xLine(0.2, 0.001, 9)
} !+ 2
