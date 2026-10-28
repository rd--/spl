/* sweep verb (Jmcc) #5 ; requires=AudioIn */
let s = audioIn([1, 2]) * 0.01;
let z = delayC(s.sum, 0.048, 0.048); /* reverb predelay time */
let y = combC(z, 0.1, lfNoise1({ rand(0, 0.1) } ! 6) * 0.04 + 0.05, 15).sum; /* six modulated comb delays in parallel */
4.timesRepeat {
	y := allpassC(y, 0.050, { rand(0, 0.05) } ! 2, 1) /* allpass delays on each of two channels */
};
leakDc(y, 0.995)
