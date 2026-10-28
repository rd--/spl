/* vibrato ; note audio rate input */
sinOsc(vibrato(dc(400), 1, 0.02, 0, 0, 0.04, 0.1, 0, 0), 0) * 0.1

/* vibrato */
let x = mouseX(2, 100, 0, 0.2);
let y = mouseY(0, 1, 0, 0.2);
let v = vibrato(dc(400), x, 0.1, 1, 1, y, 0.1, 0, 0);
sinOsc(v, 0) * 0.1

/* vibrato */
let n = lfNoise1(1) * 3 + 7;
let x = mouseX(0, 1, 0, 0.2);
let y = mouseY(0, 1, 0, 0.2);
let v = vibrato(dc(400), n, x, 1, 1, y, 0.1, 0, 0);
sinOsc(v, 0) * 0.1
