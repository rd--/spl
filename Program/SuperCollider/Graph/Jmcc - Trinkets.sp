/* Trinkets (1 & 2) (Jmcc) ; http://www.iamas.ac.jp/~aka/dspss2004/materials/ */
let amp = 0.2;
let gate = 1;
let tr = [dust(4), impulse(16, 0)].atRandom;
let x = sinOsc(tRand([400, 2000].atRandom, 12000, tr), 0) * decay2(tr, 0.002, 0.04);
x := eqPan(x, tRand(-1, 1, tr));
x := combN(x, 0.2, { rand(0.04, 0.2) } ! 4, 2);
x * linen(gate, 0.1, amp, 0.3, 2)
