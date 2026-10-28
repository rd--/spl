/* http://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 1.1 */
let n = 11;
let g = {
	let freq = rand(50, 560.3);
	let numcps = rand(2, 20);
	let knum = sinOsc(expRand(0.02, 0.2), 0) * (numcps / 2) + (numcps / 2);
	let gen = gendy1(
		iRand(0, 6),
		iRand(0, 6),
		rand(0, 1),
		rand(0, 1),
		freq,
		freq,
		rand(0, 1),
		rand(0, 1),
		numcps,
		knum
	);
	eqPan(gen, rand(-1, 1)) * 0.5 / n.sqrt
} !+ n;
let x = mouseX(100, 2000, 0, 0.2);
let y = mouseY(0.01, 1.0, 0, 0.2);
resonz(g, x, y) * 0.5
