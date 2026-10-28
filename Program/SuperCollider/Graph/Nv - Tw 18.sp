/* Sc-140 ; 18 ; Nathaniel Virgo (Nv) */
let p = pinkNoise([1] # 2, 0);
let a = brf(p + blip(p + 2, 400), 150, 2) * 0.1;
let l = lpf(p + 0.2 * dust(0.1), 60);
let b = lpf((freeVerb2(l.first, l.second, 1, 1, 0.2) * 10000).tanh, 2000);
a + b
