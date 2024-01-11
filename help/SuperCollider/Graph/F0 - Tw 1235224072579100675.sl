{- ---- CRASH? ---- https://twitter.com/redFrik/status/1235224072579100675 -}
let f = 9;
let e = (f % pi).Floor;
let b = [0 .. 8] - 1 + pi.Tanh * pi * pi;
let c = 1 / b;
let j = SinOsc(b * f, c) * SinOsc(c, 0).Max(0) + AllpassC(LocalIn(f, 0), e, SinOsc(c / f, 0) / f + e / e, e) * e;
let o = Bpf(Normalizer(j, e / e , c), LinExp(SinOsc(c, 0), -1, 1, f, e ^ f * f), 1);
o.Splay2.Sin <! LocalOut(o.rotatedRight(1))
