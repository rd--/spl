/* pulseDivider */
let p = impulse(8, 0);
let d = pulseDivider(p, [4, 7], 0);
let a = sinOsc(1200, 0) * decay2(p, 0.005, 0.1);
let b = sinOsc(600, 0) * decay2(d, 0.005, 0.5);
(a + b) * 0.1
