/* lorenzL ; vary frequency */
lorenzL(mouseX(20, sampleRate(), 0, 0.2), 10, 28, 2.667, 0.05, 0.1, 0, 0) * 0.1

/* lorenzL ; randomly modulate params */
let freq = sampleRate();
let s = lfNoise0(1) * 2 + 10;
let r = lfNoise0(1) * 20 + 38;
let b = lfNoise0(1) * 1.5 + 2;
lorenzL(freq, s, r, b, 0.05, 0.1, 0, 0) * 0.1

/* lorenzL ; as a frequency control */
sinOsc(lag(lorenzL(mouseX(1, 200, 0, 0.2), 10, 28, 2.667, 0.05, 0.1, 0, 0), 0.003) * 800 + 900, 0) * 0.1
