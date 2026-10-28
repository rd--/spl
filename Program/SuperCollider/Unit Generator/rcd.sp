/* rcd ; div16 */
let trig = lfPulse(8, 0, 0.001);
let freqs = [1 .. 8] * 100;
let rotate = 0;
let div = 1;
let pulses = rcd(trig, rotate, 0, div, 0, 0, 0, 0, 0);
let out = ringz(pulses, freqs, [2, 1, 0.5, 0.3, 0.2, 0.3, 0.5, 1]) * 0.05;
splay2(out)

/* rcd ; rotation */
let freqs = [1 .. 8] * 100;
let decays = 8 / [1 .. 8];
let trig = lfPulse(5, 0, 0.005);
let rotate = lfNoise0(0.3) * 8 + 8;
let reset = 0;
let spread = 1;
let metronome = ringz(trig, 6000, 0.01) * 0.03;
let pulses = rcd(trig, rotate, reset, 3, spread, 0, 0, 0, 0);
let out = ringz(pulses, freqs, decays) * 0.05;
splay2(out * 0.7).tanh + metronome

/* rcd ; using 'reset' */
let clock = lfPulse(8, 0, 0.001);
let freqs = ([0 .. 7] * 4 + 50).midiCps;
let rotate = 4;
let reset = coinGate(0.05, clock);
let pulses = rcd(clock, rotate, reset, 0, 0, 0, 0, 0, 0);
let out = ringz(pulses, freqs, [1, 1, 0.5, 0.2, 0.2, 0.3, 0.5, 1]) * 0.05;
splay2(out)

/* rcd ; auto-reset on */
let freqs = [1 .. 8] * 100;
let decays = 1 / [1 .. 8];
let clock = lfPulse(8, 0, 0.001);
let rotate = 7;
let spread = 1;
let len = 23;
let pulses = rcd(clock, rotate, 0, 0, spread, 1, len, 0, 0);
let out = ringz(pulses, freqs, decays) * 0.05;
splay2(out)

/* rcd ; auto-reset off */
let freqs = [1 .. 8] * 100;
let decays = 1 / [1 .. 8];
let clock = lfPulse(8, 0, 0.001);
let rotate = 7;
let spread = 1;
let pulses = rcd(clock, rotate, 0, 0, spread, 0, 0, 0, 0);
let out = ringz(pulses, freqs, decays) * 0.05;
splay2(out)

/* rcd ; gates */
let freqs = ([0 .. 7] * 5 + 50).midiCps;
let amps = [10 5 3 3 3 2 2 2] / 10;
let trig = lfPulse(7, 0, 0.01);
let rotate = -2;
let spread = tiRand(0, 1, impulse(0.13, 0));
let div = tiRand(0, 3, impulse(0.1, 0));
let pulses = rcd(trig, rotate, 0, div, spread, 0, 0, 0, 1);
let oscs = sinOsc(freqs, 0) * pulses * amps;
let out = splay2(oscs.rotateLeft(3) * 0.5);
out + (combN(out, 2, [2, 1], 3) * 0.3)
