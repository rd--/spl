/* lag */
let f1 = linLin(sinOsc(0.05, 0), -1, 1, 220, 440);
let o1 = sinOsc(f1, 0);
let f2 = lag(f1, 1);
let o2 = sinOsc(f2, 0);
[o1, o2] * 0.1
