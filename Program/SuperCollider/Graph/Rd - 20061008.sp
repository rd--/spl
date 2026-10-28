/* 20061008 ; rd */
let t = dust(9);
let u = pulseDivider(t, 9, 0);
let k = [0 2 3.2 5 7 9 10].localBuf.degreeToKey(
	tiRand(mouseX(15, 0, 0, 0.1), mouseY(15, 27, 0, 0.1), t),
	12
);
let m = lfNoise1([3, 3.05]) * 0.04 + tChoose(t, [36 48 60 72]) + k;
let o = sinOsc(m.midiCps, 0) * decay2(t, 0.005, tRand(0.05, 0.175, t)) * 0.2;
o * 0.5 + allpassC(o, 0.15, tRand(0.0075, 0.125, u), tRand(0.05, 0.15, u))
