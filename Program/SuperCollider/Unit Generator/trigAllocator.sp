/* TrigAllocator ; no voice stealing */
let t = impulse(1, 0);
let d = tiRand(2, 9, t);
let w = trigAllocator(8, 0, t, d);
let e = asr(w, d / 3, d / 3, -4) * tRand(0.1, 0.2, w);
let f = tiRand(48, 72, w).midiCps + tRand(-9, 9, w);
let o = sinOsc(f, 0) * e;
o.splay

/* TrigAllocator ; voice stealing ; algorithm input selects rule */
let t = impulse(4, 0);
let d = tRand(0.2, 2, t);
let w = trigAllocator(5, 1, t, d);
let e = asr(w, 0.01, d / 2, -4) * tRand(0.1, 0.2, w);
let f = tiRand(48, 72, w).midiCps + tRand(-9, 9, w);
let o = sinOsc(f, 0) * e;
o.splay
