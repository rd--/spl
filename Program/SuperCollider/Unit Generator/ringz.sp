/* https://github.com/redFrik/udk08-Soft_and_Hard/blob/master/121115soft */
let tick = impulse(30, 0);
let freq = tRand(400, 4000, tick);
let decay = tRand(0.2, 0.7, tick);
ringz(tick, freq, decay) * 0.1

/* https://github.com/redFrik/udk08-Soft_and_Hard/blob/master/121115soft */
let tick = impulse(line(3, 60, 10), 0);
let freq = tRand(line(4000, 100, 10), line(5000, 8000, 10), tick);
let decay = tRand(0.2, 0.7, tick);
ringz(tick, freq, decay) * 0.1

/* https://github.com/redFrik/udk08-Soft_and_Hard/blob/master/121115soft */
let tick = impulse(phasor(0, 0.001, 4, 40, 0), 0);
let freq = tRand(4000, 5000, tick);
let decay = tRand(0.2, 0.7, tick);
ringz(tick, freq, decay) * 0.1
