/* http://twitter.com/redFrik/status/1235224072579100675 ; CRASH? */
let f = 9;
let e = (f % 1.pi).floor;
let b = [0 .. 8] - 1 + 1.pi.tanh * 1.pi.pi;
let c = 1 / b;
let j = sinOsc(b * f, c) * sinOsc(c, 0).max(0) + allpassC(localIn(f, 0), e, sinOsc(c / f, 0) / f + e / e, e) * e;
let o = bpf(normalizer(j, e / e , c), linExp(sinOsc(c, 0), -1, 1, f, e ^ f * f), 1);
o.splay2.sin <! localOut(o.rotateRight(1))
