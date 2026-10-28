/* latch */
sinOsc(latch(sinOsc([13.3, 13.7], 0), impulse([9, 11], 0)) * 200 + 300, 0) * 0.1

/* latch */
blip(latch(whiteNoise(), impulse(9, 0)) * 400 + 500, 4) * 0.2

/* latch */
let l = latch(whiteNoise (), impulse(9, 0));
sinOsc(l * 400 + 500, 0) * 0.2
