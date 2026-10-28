/* Clustered sines (Jmcc) #2 ; Graph rewrite */
let n = 80;
{ :tr |
	let f1 = tRand(100, 1100, tr);
	let f2 = 4.0 * f1;
	{
		{
			let y = f1 + tRand(0, f2, tr);
			sinOsc(y, 0) * f1 / y
		} !+ n
	} ! 2 * 0.1 / n
}.overlapTexture(4, 4, 3).mix
