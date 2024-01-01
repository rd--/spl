(* https://sccode.org/1-4Qy ; f0 ; 0324 *)
var c = [1 3 5 6];
var f = DurationSequencer(
	LfTri(1 / c / 8, 0) > 0 * 3 + c * 99,
	c + 1 / 16
);
Hpf(BLowPass(LfTri(c, 0), f, 0.001) / 12, 9).Splay.Sin / 2
