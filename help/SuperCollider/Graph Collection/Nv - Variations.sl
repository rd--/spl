{- nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899 ; requires=crossedMultiply (⊗) -}
let x = [4 4.5; 2 3 5 6];
let z = x.crossedMultiply(x.crossedMultiply(x).allTuples);
let y = (z * 4).concatenation.clump(2) ++ [0];
let f = Sequencer(y, Impulse(5, 0));
GVerb(
	VarSaw(f, 0, 0.9) * LfPulse(5, 0, 0.5).Lag(0.01),
	99, 5, 0.5, 0.5, 15, 1, 0.7, 0.5, 300
).transposed.Mix / 15

{- https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43 ; requires=keywords -}
(0 .. 9).collect { :i |
	let x = Impulse(freq: 1, phase: i / 10) + Impulse(freq: 0, phase: 0);
	let o = LfSaw(freq: [102, 101], iphase: 0);
	let d = 1 / Latch(in: 1.015 ^ Sweep(trig: Impulse(freq: 0, phase: 0), rate: 1) * 64 % 1 + 1 * 200, trig: x);
	Pluck(in: o, trig: x, maxDelayTime: 1, delayTime: d, decayTime: 4, coef: 0.2)
}.mean * 0.1

{- nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899 ; requires=*.x (⊗) ; edit (rd) -}
let x = [4 4.5; 2 3 5 6];
let z = x *.x (x *.x x).allTuples;
let y = (z * 4).concatenation.clump(2) ++ [0];
let f = HoldSequence(y, 1 / 5);
GVerb(
	VarSaw(f, 0, 0.9) * LfPulse(5, 0, 0.5).Lag(0.01),
	99, 5, 0.5, 0.5, 15, 1, 0.7, 0.5, 300
).transposed.Mix / 15
