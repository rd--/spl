/* Rukano; apr 22, 2012; re: epic pads */
let freq = {
	[60 64 65 67].atRandom.midiCps * (LfNoise2(1) * 0.01 + 1)
} ! 24;
let gen = LfSaw(freq, 0) * 0.1;
let fmod = linLin(LfCub(1 / 12, 0), -1, 1, 1, MouseX(2, 16, 0, 0.2));
let rqmod = linLin(LfNoise2(1 / 8), -1, 1, 0.1, 1.0);
Rlpf(gen, freq * fmod, rqmod).Splay
