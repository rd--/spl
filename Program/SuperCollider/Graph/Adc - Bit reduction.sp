/* Bit-reduction ; adc */
let f = lfNoise2(8) * 200 + 300;
let nh = lfNoise2(3) * 10 + 20;
let src = blip(f, nh);
let sr = mouseX(1000, sampleRate() * 0.1, 1, 0.2);
let bitSize = mouseY(1, 24, 1, 0.2);
let downSample = latch(src, impulse(sr, 0));
let bitRedux = downSample.round(0.5 ^ bitSize);
[downSample, bitRedux]
