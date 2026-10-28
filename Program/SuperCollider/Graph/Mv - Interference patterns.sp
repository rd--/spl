/* http://scsynth.org/t/5487 ; mv */
let prime = lfNoise0(1 / 19) * 8 + 300;
let diff = lfNoise0(1 / 29) + 10;
let fade = 10;
let primetime = 20;
let difftime = 30;
let level= 0.075;
let freqtransition = lag(prime, primetime);
let left = sinOsc(freqtransition, 0);
let right = sinOsc(freqtransition - lag(diff, difftime), 0);
let env = line(0, level, fade);
let brainwave = [left, right] * env;
let tr = dust(1 / 9);
let freq = tExpRand(285, 310, tr);
let amp = tRand(0.1, 0.2, tr);
let sustain = tRand(7, 14, tr);
let pan = tRand(-0.7, 0.7, tr);
let sig = sinOsc(freq, 0) * amp * decay2(tr, 0.01, sustain);
brainwave + eqPan(sig, pan)
