/* http://twitter.com/redFrik/status/1546903641575112715 ; requires=StandardL ; wait */
let b = [0 3.084 5.028 6.972 10.056];
let k = localBuf(b).degreeToKey(
	2 ^ standardL(standardL(b + 1 / 32, b + 1, 0.5, 0), b / 7 + 1, 0.5, 0) * 12,
	12
);
let f1 = (k + 36 - (standardL(1 / 32, 1, 0.5, 0) > 0)).midiCps;
let f2 = standardL(b / 8 + 8, b / 5 + 1, 0.5, 0);
let fb = standardL(1 / 3, b / 8 + 1, 0.5, 0) + 1 / 3;
let a = standardL(b + 2 / 32, b / 9 + 1, 0.5, 0).max(0) / 16 * ampComp(f1, 60.midiCps, 1 / 3);
let x = splay2(sinOscFb(f1 + f2, fb) * a);
x + gVerb(x, 99, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300).transpose.sum
