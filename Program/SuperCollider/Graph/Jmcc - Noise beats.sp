/* Noise beats (Jmcc) */
let imp = impulse(8, 0);
let trig = demand(imp, 0, dseq(Infinity, [0.2, 0.1, 0.1, 0.2, 0.1, 0.1, 0.2, 0.1])) * imp;
let amp = decay2(trig, 0.0004, 0.2);
let x = resonz(greyNoise([amp] # 2, 0), 5200, 0.2);
4.timesRepeat {
	x := allpassN(x, 0.05, { rand(0, 0.05) } ! 2, 4)
};
x
