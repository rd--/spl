/* Sc-140 ; 19 ; MCLD */
let a = [0.02 0.1 1 2 3 4];
let k = lfPar(a + 0.5, 0).sum;
let f = latch(k, impulse(a, 0));
splay(sinOsc(f * 100 + 300, 0) / 5)
