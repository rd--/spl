/* Tw 0033 (F0) ; http://www.fredrikolofsson.com/f0blog/?q=node/537 */
let f = lfPar(1 / 14, 0).round(1) * 20 + 80;
let a = pulse([1 .. 4], 0.35);
let n = brownNoise() * a;
let z = [0 .. 3].collect { :i |
	[i + 1 * f, i * f + i + 0.333]
};
let o = lfPar(z, 0);
(o > n / 3).splay2.mix * 0.1
