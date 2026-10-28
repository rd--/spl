/* miClouds ; requires=keywords ; requires>#14 */
let pit = lfNoise1(0.3) * 12;
let pos = lfNoise2(0.4) * 0.5 + 0.5;
let size = lfNoise1(0.3) * 0.5 + 0.5;
let dens = lfNoise1(0.3) * 0.5 + 0.5;
let tex = lfNoise1(0.3) * 0.5 + 0.5;
let freeze = lfClipNoise(0.3);
let tr = dust([0.8, 1.1]);
let freq = latch(pinkNoise() * 24 + 80, tr).midiCps;
let inputList = rlpf(tr, freq, 0.002) * 4;
miClouds(
	pit: pit,
	pos: pos,
	size: size,
	dens: dens,
	tex: tex,
	dryWet: 0.5,
	inGain: 2,
	spread: 0.5,
	rvb: 0.3,
	fb: 0.8,
	freeze: freeze,
	mode: 0,
	lofi: 1,
	trig: 0,
	inputList: inputList
)
