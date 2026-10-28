/* Modal space (Jmcc) #8 */
let b = [0 2 3.2 5 7 9 10].localBuf;
let k = degreeToKey(b, mouseX(0, 15, 0, 0.2), 12);
let c = { :n :r |
	let o = sinOsc((r + k + (n * 0.04)).midiCps, 0) * 0.1;
	let t = lfPulse([48, 55].midiCps, 0, 0.15);
	let f = (sinOsc(0.1, 0) * 10 + r).midiCps;
	let d = rlpf(t, f, 0.1) * 0.1;
	let m = o + d;
	combN(m, 0.31, 0.31, 2) + m
};
let n = lfNoise1([3, 3]);
(c(n, 48) + c(n, 72)) * 0.25
