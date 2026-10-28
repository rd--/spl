/* Rukano; apr 22, 2012; re: epic pads */
let freq = {
	[60 64 65 67].atRandom.midiCps * (lfNoise2(1) * 0.01 + 1)
} ! 24;
let gen = lfSaw(freq, 0) * 0.1;
let fmod = linLin(lfCub(1 / 12, 0), -1, 1, 1, mouseX(2, 16, 0, 0.2));
let rqmod = linLin(lfNoise2(1 / 8), -1, 1, 0.1, 1.0);
rlpf(gen, freq * fmod, rqmod).splay
