/* Tw 600429640600186880 (es) ; http://twitter.com/sluyterrific_sc/status/600429640600186880 */
let m = mouseX(0.925, 1, 0, 0.2);
let l = localIn(2, 0) * m + (dust2([1, 1]) * 9);
let s = [2 .. 6].collect { :n |
	allpassC(l, 0.6, lfNoise2(0.01) * 0.01 + (1 / n), 1)
}.sum / 4.5;
l <! localOut(leakDc(s, 0.995))
