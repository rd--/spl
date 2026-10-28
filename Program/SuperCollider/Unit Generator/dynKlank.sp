/* dynRingzBank ; c.f. DynKlank */
let tr = dust(25);
let k = dynRingzBank(trig(tr, sampleDur()), [1 .. 5] * 2700, { tRand(0.025, 0.04, tr) } ! 5, [0.1]);
let n = k + (brownNoise() * 0.075 * trig(tr, tRand(0.01, 0.03, tr)));
let f = lpf(hpf(n, lag(tRand(6000, 7500, tr), 0.01)), lag(tRand(4000, 5500, tr), 0.01));
pan2(f, lag(tRand(-0.5, 0.5, tr), 0.01), 1)
