/* sinOscFb */
sinOscFb([400, 301], mouseX(0, 4, 0, 0.2)) * 0.1

/* sinOscFb */
let y = mouseY(10, 1000, 1, 0.2);
let x = mouseX(0.5.pi, 1.pi, 0, 0.2);
sinOscFb(y, x) * 0.1

/* sinOscFb */
let y = mouseY(1, 1000, 1, 0.2);
let x = mouseX(0.5.pi, 1.pi, 0, 0.2);
sinOscFb(100 * sinOscFb(y, 0) + 200, x) * 0.1

/* sinOscFb ; overlapTexture */
{ :tr |
	let x = mouseX(0.15, 0.85, 0, 0.2);
	let f0 = tChoose(tr, [110, 220, 440]);
	{
		let freq = f0 + tRand(0, f0, tr);
		let fb = linLin(lfNoise2(1), -1, 1, 0, x);
		sinOscFb(freq, fb) * 0.1
	} ! 16
}.overlapTexture(2, 6, 3).mix
