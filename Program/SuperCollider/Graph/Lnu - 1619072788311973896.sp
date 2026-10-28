/* http://twitter.com/lukiss163/status/1619072788311973896 ; Lnu */
let c = [0 .. 8].collect { :n |
	let d = dust(1);
	tRand(0.5, 2.5, d).lag3(1 / 16) ^ n
};
let m = c.last;
let n = c / c.sum;
let o = sinOsc(c.log10 * c, 0);
let r = tChoose(
	dust(1 + m),
	[
		c.sum,
		n,
		c.round(32),
		n.atan2(m),
		c.sin,
		c.tan,
		n.hypotenuse(c)
	]
);
let e = ((lfSaw(c.tan / m, 0).abs ^ r.max(0)).log10.sin.abs ^ 10).tanh;
splay(
	o * e,
	sinOsc(m * m, 0)
)
