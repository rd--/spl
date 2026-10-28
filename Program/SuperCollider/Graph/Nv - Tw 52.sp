/* Nv 52 http://swiki.hfbk-hamburg.de/MusicTechnology/899 ; requires=adverbs */
let x = [4 4.5; 2 3 5 6];
let z = x *.x (x *.x x).tuples;
let y = (z * 4).++.clump(2) ++ [0];
let f = duty(1 / 5, 0, dseq(Infinity, y));
gVerb(
	varSaw(
		f, 0, 0.9
	) * lfPulse(
		5, 0, 0.5
	).lag(0.01),
	99, 5, 0.5, 0.5, 15,
	1, 0.7, 0.5, 300
).transpose.mix / 15
