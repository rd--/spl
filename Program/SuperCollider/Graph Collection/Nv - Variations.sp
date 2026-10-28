/* nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899 ; requires=crossedMultiply (⊗) */
let x = [4 4.5; 2 3 5 6];
let z = x.crossedMultiply(x.crossedMultiply(x).tuples);
let y = (z * 4).++.clump(2) ++ [0];
let f = sequencer(y, impulse(5, 0));
gVerb(
	varSaw(f, 0, 0.9) * lfPulse(5, 0, 0.5).lag(0.01),
	99, 5, 0.5, 0.5, 15, 1, 0.7, 0.5, 300
).transpose.mix / 15

/* https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43 ; requires=keywords */
[0 .. 9].collect { :i |
	let x = impulse(
		freq: 1,
		phase: i / 10
	) + impulse(
		freq: 0,
		phase: 0
	);
	let o = lfSaw(
		freq: [102, 101],
		iphase: 0
	);
	let d = 1 / latch(
		in: 1.015 ^ sweep(
			trig: impulse(
				freq: 0,
				phase: 0
			),
			rate: 1
		) * 64 % 1 + 1 * 200,
		trig: x
	);
	pluck(
		in: o,
		trig: x,
		maxDelayTime: 1,
		delayTime: d,
		decayTime: 4,
		coef: 0.2
	)
}.mean * 0.1

/* nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899 ; requires=*.x (⊗) ; edit (rd) */
let x = [4 4.5; 2 3 5 6];
let z = x *.x (x *.x x).tuples;
let y = (z * 4).++.clump(2) ++ [0];
let f = holdSequence(y, 1 / 5);
gVerb(
	varSaw(f, 0, 0.9) * lfPulse(5, 0, 0.5).lag(0.01),
	99, 5, 0.5, 0.5, 15, 1, 0.7, 0.5, 300
).transpose.mix / 15
