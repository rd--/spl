/* expRandN */
SinOsc(expRandN(2, 110, 220), 0) * RandN(2, 0.05, 0.10)

/* expRand ; duplicate */
{ SinOsc(expRand(110, 220), 0) * expRand(0.05, 0.10) } ! 2
