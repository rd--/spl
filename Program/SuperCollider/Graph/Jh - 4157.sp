/* Jh ; http://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit) ; packet size */
let tr = Impulse(0.1, 0);
let sinOsc = { :freq |
	(Phasor(tr, freq * SampleDur(), 0, 1, 0) * 2.pi).sin
};
let k = 160;
let b = TRand(2, 2.25, tr);
let n = TRand(0.002, 0.02, tr);
let f0 = TRand(90, 180, tr);
let fMul = b ^ k.arithmeticProgression(0, n);
let e = Decay2(tr, 1, 10) * 0.1;
sinOsc(f0 * fMul).Splay * e
