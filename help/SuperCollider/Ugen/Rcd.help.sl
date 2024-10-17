/* Rcd ; div16 */
let trig = LfPulse(8, 0, 0.001);
let freqs = 1:8 * 100;
let rotate = 0;
let div = 1;
let pulses = Rcd(trig, rotate, 0, div, 0, 0, 0, 0, 0);
let out = Ringz(pulses, freqs, [2, 1, 0.5, 0.3, 0.2, 0.3, 0.5, 1]) * 0.05;
Splay2(out)

/* Rcd ; rotation */
let freqs = 1:8 * 100;
let decays = 8 / 1:8;
let trig = LfPulse(5, 0, 0.005);
let rotate = LfNoise0(0.3) * 8 + 8;
let reset = 0;
let spread = 1;
let metronome = Ringz(trig, 6000, 0.01) * 0.03;
let pulses = Rcd(trig, rotate, reset, 3, spread, 0, 0, 0, 0);
let out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out * 0.7).Tanh + metronome

/* Rcd ; using 'reset' */
let clock = LfPulse(8, 0, 0.001);
let freqs = (0:7 * 4 + 50).MidiCps;
let rotate = 4;
let reset = CoinGate(0.05, clock);
let pulses = Rcd(clock, rotate, reset, 0, 0, 0, 0, 0, 0);
let out = Ringz(pulses, freqs, [1, 1, 0.5, 0.2, 0.2, 0.3, 0.5, 1]) * 0.05;
Splay2(out)

/* Rcd ; auto-reset on */
let freqs = 1:8 * 100;
let decays = 1 / 1:8;
let clock = LfPulse(8, 0, 0.001);
let rotate = 7;
let spread = 1;
let len = 23;
let pulses = Rcd(clock, rotate, 0, 0, spread, 1, len, 0, 0);
let out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out)

/* Rcd ; auto-reset off */
let freqs = 1:8 * 100;
let decays = 1 / 1:8;
let clock = LfPulse(8, 0, 0.001);
let rotate = 7;
let spread = 1;
let pulses = Rcd(clock, rotate, 0, 0, spread, 0, 0, 0, 0);
let out = Ringz(pulses, freqs, decays) * 0.05;
Splay2(out)

/* Rcd ; gates */
let freqs = (0:7 * 5 + 50).MidiCps;
let amps = [10 5 3 3 3 2 2 2] / 10;
let trig = LfPulse(7, 0, 0.01);
let rotate = -2;
let spread = TiRand(0, 1, Impulse(0.13, 0));
let div = TiRand(0, 3, Impulse(0.1, 0));
let pulses = Rcd(trig, rotate, 0, div, spread, 0, 0, 0, 1);
let oscs = SinOsc(freqs, 0) * pulses * amps;
let out = Splay2(oscs.rotatedLeft(3) * 0.5);
out + (CombN(out, 2, [2, 1], 3) * 0.3)
