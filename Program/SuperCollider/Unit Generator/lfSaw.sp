/* lfSaw ; phase value = (0, 2), offset to lowest and midpoint ascending */
lfSaw(110, 2 * [0.5, 0]) * 0.1

/* lfSaw ; as phasor */
(lfSaw(220, 0).pi + 1.pi).sin * 0.1

/* lfSaw ; as phase input to sin ; scale using linLin */
linLin(lfSaw(440, 0), -1, 1, 0, 2.pi).sin * 0.1

/* lfSaw ; as phasor */
let freq = lfNoise2(3) * 110 + 220;
[(lfSaw(freq, 0).pi + 1.pi).sin, sinOsc(freq, 0)] * 0.1

/* lfSaw */
lfSaw(500, 1) * 0.05

/* lfSaw ; used as both oscillator and lfo */
lfSaw(lfSaw(4, 0) * 400 + 400, 0) * 0.05

/* lfSaw ; output range is bi-polar */
let f = [linLin(lfSaw(0.5, 1), -1, 1, 200, 1600), 200, 1600];
(sinOsc(f, 0) * [0.1, 0.05, 0.05]).sum

/* lfSaw ; mixed with sin, then with distortions */
let f = xLine(220, 440, 10);
let o1 = sinOsc(f + [0, 0.7], 0);
let o2 = lfSaw (f + [0, 0.7], 0) * 0.3;
let o3 = o1 + o2;
o3.distort.distort.cube * 0.5

/* lfSaw ; https://scsynth.org/t/6320/2 (nh) ; Event control */
Voicer(1, 16) { :e |
	let freq = e.p.unitCps;
	let auto = sinOsc(e.z * 2, 0).linLin(-1, 1, 1, 1 + e.y);
	let formantTable = [400 1600 2700; 830 1200 4000; 325 600 2530].localBuf;
	let formants = bufRd(1, formantTable, e.y * 3, 1, 2).kr * [1 / auto, auto, auto ^ 0.5];
	let phase = lfSaw(freq, 0).linLin(-1, 1, 0, 1);
	let snd = (phase * formants / freq * 2.pi).sin;
	eqPan2(
		(snd.first + (snd.second.sign * 0.25)) * e.z * 2 * e.w,
		e.i * 2 - 1
	)
}.mix
