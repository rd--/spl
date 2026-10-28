/* http://sccode.org/1-4Qy (F0) ; 0319 */
let b = [1 .. 8];
let c = sinOscFb(b / 16 / 16.16, 0) % 1;
let f = b.withIndexCollect { :x :i |
	[x, i + 6 / 6000 + x]
} * 60;
let e = (sinOscFb([3, 6], 1) * (lag(c, 0.1) / 3)).max(0);
let o = (sinOscFb(f, c) * e);
o.splay2.transpose.mix
