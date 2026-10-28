/* Jj ; bohlen-pierce ; texture graph variant */
{ :tr |
	let f = { :x |
		3 ^ (tRand(0, 17, tr) / 13) * x
	};
	let e = perc(tr, 0.01, 1, -4) * 0.1;
	pmOsc(f([438, 442]), f(880), f(e), 0) * e
}.overlapTexture(1 / 3, 0, 4).mix
