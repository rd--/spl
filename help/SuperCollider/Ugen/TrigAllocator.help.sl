{- TrigAllocator ; no voice stealing -}
let t = Impulse(1, 0);
let d = TiRand(2, 9, t);
let w = TrigAllocator(8, 0, t, d);
let e = Asr(w, d / 3, d / 3, -4) * TRand(0.1, 0.2, w);
let f = TiRand(48, 72, w).MidiCps + TRand(-9, 9, w);
let o = SinOsc(f, 0) * e;
o.Splay

{- TrigAllocator ; voice stealing ; algorithm input selects rule -}
let t = Impulse(4, 0);
let d = TRand(0.2, 2, t);
let w = TrigAllocator(5, 1, t, d);
let e = Asr(w, 0.01, d / 2, -4) * TRand(0.1, 0.2, w);
let f = TiRand(48, 72, w).MidiCps + TRand(-9, 9, w);
let o = SinOsc(f, 0) * e;
o.Splay
