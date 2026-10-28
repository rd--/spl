/* http://twitter.com/rukano/status/98315246548172800 ; texture variant */
{ :tr |
	let h = tChoose(tr, [100 800 3000]);
	{ sinOsc(tExpRand(60, h, tr), 0) * 0.1 } !^ 40
}.overlapTexture(5, 7, 2).mix
