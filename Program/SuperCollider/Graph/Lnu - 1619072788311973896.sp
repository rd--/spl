/* http://twitter.com/lukiss163/status/1619072788311973896 ; Lnu */
let c = [0 .. 8].collect { :n |
	let d = Dust(1);
	TRand(0.5, 2.5, d).Lag3(1 / 16) ^ n
};
let m = c.last;
let n = c / c.sum;
let o = SinOsc(c.log10 * c, 0);
let r = TChoose(
	Dust(1 + m),
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
let e = ((LfSaw(c.tan / m, 0).abs ^ r.max(0)).log10.sin.abs ^ 10).tanh;
Splay(
	o * e,
	SinOsc(m * m, 0)
)
