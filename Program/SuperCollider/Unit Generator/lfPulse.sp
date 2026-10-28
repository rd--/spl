/* lfPulse ; phase value = (0, 1), offset to lowest point */
lfPulse(110, 1 * 0.5, 0.5) * 0.1

/* lfPulse ; as envelope */
sinOsc(200, 0) * lag(lfPulse(7.83, 0, 0.5) > 0, 0.05) * 0.2

/* lfPulse ; as envelope */
sinOsc(230, 0) * lag(lfPulse(mouseX(2.3, 23, 1, 0.2), 0, 0.5).max(0), 0.01) * 0.2

/* lfPulse ; 50 Hz wave */
lfPulse(50, 0, 0.5) * 0.05

/* lfPulse ; modulating frequency */
lfPulse(xLine(1, 200, 10), 0, 0.2) * 0.05

/* lfPulse ; amplitude modulation */
lfPulse(xLine(1, 200, 10), 0, 0.2) * sinOsc(440, 0) * 0.1

/* lfPulse ; used as both oscillator and lfo */
lfPulse(lfPulse(3, 0, 0.3) * 200 + 200, 0, 0.2) * 0.05

/* lfPulse ; humm */
let freqBass = 50;
let freq = 50;
let pan = 0;
let amp = 0.1;
let snd = lfPulse(freq, 0, 0.5);
20.timesRepeat {
	snd := midEq(snd, expRand(300, 12000), 0.1, -20)
};
snd := hpf(snd * 3, mouseX(5000, 7000, 1, 0.2));
snd := lpf(snd, mouseY(9000, 11000, 1, 0.2));
snd := snd + sinOsc(freqBass, 0);
eqPan2(snd, pan) * amp

/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
let p = { :freq :lo :hi |
	lfPulse(freq, 0, 0.5).linLin(0, 1, lo, hi)
};
p(
	p(
		p(3, 4, 20),
		p(0.75, 50, 70),
		p(0.5, 100, 200)
	),
	-0.1,
	0.1
)
