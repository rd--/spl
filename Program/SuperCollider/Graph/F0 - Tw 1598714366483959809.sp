/* http://twitter.com/redFrik/status/1598714366483959809 */
let b = [1 .. 9];
let l = sinOsc(9 ^ sinOsc(1 / 99, 0) / b, 0);
let p = localIn(9, 0);
let t = 1 - amplitude(p, 0.01, 0.01).lag(1 / 99);
let o = sinOsc(99 + l, l - t ^ sinOsc(t ^ 9 * 999 / b, 0) * 9) * t;
let v = 0.9 ^ 9;
[0 .. 2].do { :i |
	p := p.rotateRight(1);
	o := o + combC(p, 0.9, sinOsc(1 / b / 9, 0).linLin(-1, 1, b ^ i / (99 + 9), b ^ i / 99), i + 1)
};
o := hpf(o * l.max(0) * v, 9).tanh;
splay(o * v) <! localOut(o)
