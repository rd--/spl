/* http://github.com/schollz/18000/blob/main/drone/toshiya.scd */
let f0 = 440;
let mnn0 = f0.cpsMidi;
let amp = 1.0;
let osc = {
	let mnn = tChoose(impulse(rand(1 / 30, 1 / 5), 0), [0 9 4 14 5 2 17]);
	let sig = sinOsc((mnn0 + mnn).midiCps, 0);
	sig := lpf(
		sig,
		linExp(sinOsc(rand(1 / 30, 1 / 10), rand(0, 2.pi)), -1, 1, 20, 12000)
	) * 2;
	sig := delayC(
		sig,
		rand(0.01, 0.03),
		(lfNoise1(rand(5, 10)) * 0.01 + 0.02) / nRand(10, 20, 3)
	);
	eqPan(sig, lag(lfNoise0(1 / 3), 3)) / 12 * amp
} !+ 12 + eqPan(
	sinOsc((mnn0 - 12).midiCps, linLin(lfTri(0.5, 0), -1, 1, 0.2, 0.8)) / 12 * amp,
	sinOsc(0.1, 0) * 0.2
);
let snd = moogLadder(osc.tanh, linExp(lag(lfNoise0(1 / 6), 6), -1, 1, f0 * 2, f0 * 10), 0);
let z = delayN(snd, 0.048, 0.048);
let y = {
	combL(z, 0.1, lfNoise1(rand(0, 0.1)) * 0.04 + 0.05, 15)
} !+ 7;
4.timesRepeat {
	y := allpassN(y, 0.050, [rand(0, 0.050), rand(0, 0.050)], 1)
};
snd := snd + (linLin(lag(lfNoise0(1 / 10), 10), -1, 1, 0.01, 0.06) * y);
snd := snd + [
	amplitudeFollower(snd, 0.01, 0.01),
	linLin(lag(lfNoise0(1 / 1), 1), -1, 1, 0, 1),
	ringzBank(
		{ pinkNoise() * 0.007 } ! 2,
		[f0, f0 * 2 + 23, f0 * 4 + 53, f0 * 8 + 23],
		[1] # 4,
		[1] # 4
	)
].product;
snd := lpf(snd, 10000);
snd := hpf(snd.tanh, 20);
snd * -10.dbAmp
