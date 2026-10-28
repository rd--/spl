/* http://swiki.hfbk-hamburg.de/MusicTechnology/899 ; Tw (Tim Walters) */
[1 .. 8].collect { :k |
	let x = { :f :m :j |
		sinOsc(f + (m * 4 * j), m)
		*
		lfNoise1(j + 1 / f * 4) / 2
	};
	let y = x(0.1, 0, 8);
	[1 .. 9].do { :i |
		y := x(i * k * [4, 8], y, i)
	};
	y
}.mix / 4
