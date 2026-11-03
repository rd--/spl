/* expRandN */
sinOsc(expRandN(2, 110, 220), 0) * randN(2, 0.05, 0.10)

/* expRand ; duplicate */
{ sinOsc(expRand(110, 220), 0) * expRand(0.05, 0.10) } ! 2

/* sineCloud ; Jmcc */
let nc = 16;
let detune = [-1 1];
let freq = expRandN(8, 100, 600) + detune;
let ampPhase = randN(nc, 0, 1);
let ampFreq = expRandN(nc, 0.1, 0.5);
let amp = sinOsc(ampFreq, ampPhase).linLin(-1, 1, 0, 1);
let osc = sinOsc(freq, 0).cube * amp;
osc.reshape([8 2]).sum * line(0, 0.1, 2)
