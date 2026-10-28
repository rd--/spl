/* Noise modulated sawtooths (Jmcc) #6 */
let a = { :tr |
	let f = tRand(60, 100, tr).midiCps;
	lfSaw([f, f + 0.2], 0) * lfNoise2(f * [0.15, 0.16]) * 0.05
}.overlapTexture(4, 4, 4).mix;
combC(a, 0.5, 0.5, 4) + a.reverse
