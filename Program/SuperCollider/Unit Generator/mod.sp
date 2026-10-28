/* % = floating point modulo */
let f = lfCub(mouseY(0.25, [3, 5], 0, 0.2), 0) * 200 + 400 % mouseX([30, 70], 600, 0, 0.2);
sinOsc(f, 0) * 0.1
