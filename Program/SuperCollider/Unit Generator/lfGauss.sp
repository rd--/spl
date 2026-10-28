/* lfGauss */
sinOsc(220, 0) * lfGauss(1.5, 0.5, 0, 0, 0) * 0.1

/* lfGauss */
let h = [100 800 3000].atRandom;
let o = { sinOsc(60.expRand(h), 0) * 0.1 } ! 40;
splay(o) * lfGauss(6, 0.5, 0, 0, 0)
