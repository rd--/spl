/* http://github.com/pangrus/hachi/blob/master/lib/engine_hachi.sc ; yh (yoshinosuke horiuchi) */
let amp = 2;
let tone = 340;
let tone2 = 189;
let snappy = 0.3;
let amp2 = 1;
let tr = impulse(lfNoise2(1) + 1.5, 0);
let noiseEnv = perc(tr, 0.001, 4.2, -115);
let atkEnv = perc(tr, 0.001, 0.8, -95);
let noise = lpf(hpf(whiteNoise(), 1800), 8850) * noiseEnv * snappy;
let osc1 = sinOsc(tone2, 1/2.pi) * 0.6;
let osc2 = sinOsc(tone, 1/2.pi) * 0.7;
let sum = (osc1 + osc2) * atkEnv * amp2;
hpf(pan2(noise + sum, 0, amp), 340)
