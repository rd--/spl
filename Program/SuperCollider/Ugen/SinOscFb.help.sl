/* SinOscFb */
SinOscFb([400, 301], MouseX(0, 4, 0, 0.2)) * 0.1

/* SinOscFb */
let y = MouseY(10, 1000, 1, 0.2);
let x = MouseX(0.5.pi, 1.pi, 0, 0.2);
SinOscFb(y, x) * 0.1

/* SinOscFb */
let y = MouseY(1, 1000, 1, 0.2);
let x = MouseX(0.5.pi, 1.pi, 0, 0.2);
SinOscFb(100 * SinOscFb(y, 0) + 200, x) * 0.1

/* SinOscFb ; OverlapTexture */
{ :tr |
	let x = MouseX(0.15, 0.85, 0, 0.2);
	let f0 = Choose(tr, [110, 220, 440]);
	{
		let freq = f0 + TRand(0, f0, tr);
		let fb = LinLin(LfNoise2(1), -1, 1, 0, x);
		SinOscFb(freq, fb) * 0.1
	} ! 16
}.OverlapTexture(2, 6, 3).Mix

/* ---- SinOscFb ; overlap texture program ---- */
{
	let x = MouseX(0.15, 0.85, 0, 0.2);
	let f0 = [110, 220, 440].atRandom;
	{
		let freq = f0 + f0.Rand0;
		let fb = LinLin(LfNoise2(1), -1, 1, 0, x);
		EqPan2(SinOscFb(freq, fb), 1.Rand2) * 0.1
	} !+ 16
}.overlapTextureProgram(2, 6, 3)
