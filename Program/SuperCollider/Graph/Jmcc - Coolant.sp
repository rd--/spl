/* Coolant (Jmcc) #2 ; Graph rewrite ; requires=XFadeTexture */
let o = onePole(brownNoise() * 0.002, 0.95);
{ :tr |
	{
		ringz(o, 40 + tRand(0, 2000, tr), 1) * 0.5
	} !^ 10
}.xFadeTexture(4, 4)
