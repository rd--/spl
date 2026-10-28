/* http://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43 */
[0 .. 9].collect { :i |
	let x = impulse(1, i / 10) + impulse(0, 0);
	let o = lfSaw([102 101], 0);
	let z = 1.015 ^ sweep(impulse(0, 0), 1) * 64 % 1 + 1 * 200;
	let d = 1 / latch(z, x);
	pluck(o, x, 1, d, 4, 0.2)
}.mix / 33
