/* stepper */
sinOsc(stepper(impulse(10, 0), 0, 4, 16, 1, 0) * 100, 0) * 0.05

/* stepper */
let x = mouseX(-3, 4, 0, 0.1);
sinOsc(stepper(impulse(10, 0), 0, 4, 16, x, 0) * 100, 0) * 0.05

/* stepper */
let scale = [0 2 4 5 7 9 11 12] + 60;
let clock = impulse(3, 0);
let index = stepper(clock, 1, 0, scale.size - 1, 1, 0);
let freq = multiplexer(index, scale).midiCps;
sinOsc(freq, 0) * 0.1

/* stepper */
let b = [43 55 72 70 55 58 41 67 41 60 55 39 58 55 43 51].localBuf;
let rate = mouseX(1, 3, 1, 0.2);
let clock = impulse(rate, 0);
let env = decay2(clock, 0.002, 2.5);
let index = stepper(clock, 0, 0, 15, 1, 0);
let freq = lag2(bufRd(1, b, index, 1, 1).midiCps, 0.1) + [0, 0.3];
let ffreq = lag2(freq, 0.1) + [0, 0.3];
let lfo = sinOsc(0.2, [0, 0.5.pi]) * 0.0024 + 0.0025;
let rvb = { :in |
	let echo = combL(in, 1, 0.66 / rate, 2) * 0.8 + in;
	let z = echo;
	5.timesRepeat {
		z := allpassN(z, 0.05, { rand(0, 0.05) } ! 2, rand(1.5, 2))
	};
	echo + (0.3 * z)
};
let out = lfPulse(freq * [1, 3 / 2, 2], 0, 0.3).sum;
out := rlpf(out, ffreq, 0.3) * env;
out := rlpf(out, ffreq, 0.3) * env;
out := leakDc(rvb(out * 0.02), 0.995);
1.timesRepeat {
	out := delayL(out, 0.1, lfo) + out /* flanger */
};
onePole(out, 0.9) * 0.5
