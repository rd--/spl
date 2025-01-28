/* https://sccode.org/1-50L (mk) */
let z = PinkNoise();
16.timesRepeat {
	z := Brf(z, { Rand(100, 15000) } ! 2, 1)
};
z

/* https://sccode.org/1-50L (mk) */
let z = PinkNoise();
let lfo = { :rt | LfNoise1(rt # 2) };
16.timesRepeat {
	z := Brf(
		z,
		Rand(100, 15000) * (0.75 + (lfo(Rand(0, 8)) * 0.25)),
		lfo(Rand(0, 8)).LinLin(-1, 1, 0.05, 1)
	)
};
z

/* https://sccode.org/1-50L (mk) */
let z = PinkNoise();
let lfo = { :rt | LfPulse(rt # 2, 0, 0.5) };
16.timesRepeat {
	z := Brf(
		z,
		Rand(100, 15000) * (0.75 + (lfo(Rand(0, 0.5)) * 0.25)),
		lfo(Rand(0, 0.5)).LinLin(-1, 1, 0.05, 1)
	)
};
z

/* https://sccode.org/1-50L (Mk) */
let freq = 100;
let rt = 0.5;
let z = PinkNoise(1 # 2, 0);
let rw = { :f1 :f2 :q |
	4.timesRepeat {
		z := Brf(
			z,
			Rand(f1, f2).RoundTo(10) + (freq * LfNoise1(Rand(0, rt) # 2)),
			q
		)
	}
};
rw(100, 500, 0.1);
rw(1000, 2500, 0.2);
rw(250, 750, 0.1);
rw(2500, 5000, 0.2);
z := FreqShift(
	z,
	Duty(8, 0, Dwhite(Infinity, -1 * freq * 10, freq * 10).RoundTo(freq / 2)),
	0
) * 0.25 + z;
z := CombC(z, 1, 1, 8);
Lpf(z, LfNoise1(Rand(0, rt) # 2) * 1250 + 2500)
