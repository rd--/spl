/* controlIn ; read from control bus */
let writer = controlOut(7, lfNoise2(1) * 0.5 + 0.5);
let reader = sinOsc(controlIn(1, 7) * 100 + 200, 0) * 0.1;
reader <! writer

/* controlIn ; read from control bus ; stereo */
let writer = controlOut(7, lfNoise2([1, 3]) * 0.5 + 0.5);
let reader = sinOsc(controlIn(2, 7) * 100 + 200, 0) * 0.1;
reader <! writer
