/* clip ; https://scsynth.org/t/5208/2 (sp) */
let freq = 10;
let osc = sinOsc(freq, 0);
let interp = (mouseX(1, 0, 0, 0.2) ^ 8) * 50 + 1;
let sig = (osc * interp).clip * 0.5 + 0.5;
sinOsc(200 + (sig * 1000), 0) * 0.1
