/* Phase modulation with slow beats (Jmcc) #6 ; Graph rewrite */
let n = 4;
let x = mouseX(100, 6000, 1, 0.2); /* Controls random frequency of new events */
let y = mouseY(0, 2, 0, 0.2); /* Controls modulation index */
{ :tr |
	let a = 0;
	let f1 = tRand(0, x, tr);
	3.timesRepeat {
		let f2 = tRand(0, x, tr);
		a := sinOsc([f2, f2 + tRand(-1, 1, tr)], 0) * y + a
	};
	sinOsc([f1, f1 + tRand(-1, 1, tr)], a) * 0.1
}.overlapTexture(4, 4, n).mix * 0.25
