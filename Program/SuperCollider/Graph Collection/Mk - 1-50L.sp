/* https://sccode.org/1-50L (mk) */
let z = pinkNoise();
16.timesRepeat {
	z := brf(z, { rand(100, 15000) } ! 2, 1)
};
z

/* https://sccode.org/1-50L (mk) */
let z = pinkNoise();
let lfo = { :rt | lfNoise1([rt rt]) };
16.timesRepeat {
	z := brf(
		z,
		rand(100, 15000) * (0.75 + (lfo(rand(0, 8)) * 0.25)),
		lfo(rand(0, 8)).linLin(-1, 1, 0.05, 1)
	)
};
z

/* https://sccode.org/1-50L (mk) */
let z = pinkNoise();
let lfo = { :rt | lfPulse([rt rt], 0, 0.5) };
16.timesRepeat {
	z := brf(
		z,
		rand(100, 15000) * (0.75 + (lfo(rand(0, 0.5)) * 0.25)),
		lfo(rand(0, 0.5)).linLin(-1, 1, 0.05, 1)
	)
};
z

/* https://sccode.org/1-50L (Mk) */
let freq = 100;
let rt = 0.5;
let z = pinkNoise([1 1], 0);
let rw = { :f1 :f2 :q |
	4.timesRepeat {
		z := brf(
			z,
			rand(f1, f2).round(10) + (freq * lfNoise1([rand(0, rt)] # 2)),
			q
		)
	}
};
rw(100, 500, 0.1);
rw(1000, 2500, 0.2);
rw(250, 750, 0.1);
rw(2500, 5000, 0.2);
z := freqShift(
	z,
	duty(8, 0, dwhite(Infinity, -1 * freq * 10, freq * 10).round(freq / 2)),
	0
) * 0.25 + z;
z := combC(z, 1, 1, 8);
lpf(z, lfNoise1([rand(0, rt)] # 2) * 1250 + 2500)
