/* expRandN */
sinOsc(expRandN(2, 110, 220), 0) * randN(2, 0.05, 0.10)

/* expRand ; duplicate */
{ sinOsc(expRand(110, 220), 0) * expRand(0.05, 0.10) } ! 2
