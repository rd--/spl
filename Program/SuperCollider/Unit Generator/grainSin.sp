/* grainSin */
let k = 8;
let overlap = mouseY(0, 2, 0, 0.2);
let f = mouseX(1, 220, 0, 0.2);
let tr = impulse(f, 0);
let a = grainSin(k, tr, overlap / f, 440, tRand(-1, 1, tr), -1, 512).splay;
leakDc(a, 0.995) * 0.1

/* grainSin ; f0 https://www.listarc.bham.ac.uk/lists/sc-users/msg66911.html ; requires=kr */
let k = 8;
let tr = impulse(mouseY(1, 999, 0, 0.2), 0);
let l = [0 .. 15].collect { :i |
	i ^ lfNoise0(1).linLin(-1, 1, 0.3, 0.7) + 1 * 99
};
grainSin(
	k,
	tr,
	mouseX(0.001, 0.5, 1, 0.2),
	tChoose(tr, l.kr),
	tRand(-1, 1, tr),
	-1,
	512
).splay * 0.1
