/* schmidt ; threshold octave jumps */
let in = lfNoise1(3);
let octave = schmidt(in, [-0.15, -0.1], [0.15, 0.1]) + 1;
sinOsc(in * 200 + 500 * octave, 0) * 0.1
