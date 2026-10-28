/* impulseSequencer ; Jmcc */
let trig = impulseSequencer([2 1 1 2 1 1 2 1] / 10, impulse(8, 0));
let amp = decay2(trig, 0.0004, 0.2);
let x = resonz(greyNoise([amp] # 2, 0), 5200, 0.2);
4.timesRepeat {
	x := allpassN(x, 0.05, { rand(0, 0.05) } ! 2, 4)
};
x
