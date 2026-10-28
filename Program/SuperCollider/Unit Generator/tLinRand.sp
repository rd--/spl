/* tLinRand ; n linearly distributed random numbers every second ; note .kr */
let n = 12;
let tr = impulse(1, 0).kr;
splay(sinOsc({ tLinRand(440, 880, 0, tr) } ! n, 0) * 0.1)
