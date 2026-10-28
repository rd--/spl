/* quadC ; default params */
quadC(sampleRate() / 4, 1, -1, -0.75, 0) * 0.2

/* quadC ; logistic map ; equation: x1 = -r * x0 ^ 2 + r * x0 */
let r = mouseX(3.5441, 4, 0, 0.2);
quadC(sampleRate() / 4, r.-, r, 0, 0.1) * 0.4

/* quadC ; logistic map as frequency control */
let r = mouseX(3.5441, 4, 0, 0.2);
sinOsc(quadC(40, r.-, r, 0, 0.1) * 800 + 900, 0) * 0.4

/* quadC ; as simple oscillator */
let f1 = mouseX(110, 880, 1, 0.2);
let f2 = mouseY(110, 440, 1, 0.2);
quadC([f1, f2], 1, -1, -0.75, 0) * 0.1
