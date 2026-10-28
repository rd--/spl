/* scm */
let tick = lfPulse(3.1, 0, 0.5);
let rotate = lfNoise0(0.3) * 3.5 + 3.5;
let pulses = scm(0, 80, rotate, 100, 40, 100, 3);
let freqs = [60, 67, 72, 75, 79, 81, 84, 86].midiCps;
let out = ringz(pulses, freqs, 0.08);
splay2(out)
