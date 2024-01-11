{- GrainSin -}
let k = 8;
let overlap = MouseY(0, 2, 0, 0.2);
let f = MouseX(1, 220, 0, 0.2);
let tr = Impulse(f, 0);
let a = GrainSin(k, tr, overlap / f, 440, TRand(-1, 1, tr), -1, 512).Splay;
LeakDc(a, 0.995) * 0.1

{- GrainSin ; f0 https://www.listarc.bham.ac.uk/lists/sc-users/msg66911.html ; requires=kr -}
let k = 8;
let tr = Impulse(MouseY(1, 999, 0, 0.2), 0);
let l = (0 .. 15).collect { :i |
	i ^ LfNoise0(1).Range(0.3, 0.7) + 1 * 99
};
GrainSin(
	k,
	tr,
	MouseX(0.001, 0.5, 1, 0.2),
	Choose(tr, l.kr),
	TRand(-1, 1, tr),
	-1,
	512
).Splay * 0.1
