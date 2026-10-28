/* http://scsynth.org/t/time-varying-feedback-delay-network/5383/6 (dietcv) */
let rotatableMatrix = { :angle |
	let s = angle.sin;
	let c = angle.cos;
	let givens2x2 = [
		[c, s.-],
		[s, c]
	];
	let householder4x4 = [
		-0.5 0.5 0.5 0.5;
		0.5 -0.5 0.5 0.5;
		0.5 0.5 -0.5 0.5;
		0.5 0.5 0.5 -0.5
	];
	let kronecker = { :a :b |
		a.collect { :x |
			x.collect { :y |
				b * y
			}.reduce(+++)
		}.reduce(++)
	};
	kronecker(givens2x2, householder4x4)
};
let matrix = { :trig :rotateFreq :rotateAmount |
	let rotate = sinOsc(rotateFreq, 0).linLin(-1, 1, 0, rotateAmount);
	let angle = phasor(trig, rotate * sampleDur(), 0, 1, 0) * 2.pi;
	rotatableMatrix(angle)
};
let ctl = (
	trig: 1,
	size: 0.15,
	sizeEnvAmount: 0.65,
	feedback: 0.9,
	coef: 0.3,
	rotateFreq: 0.1,
	rotateAmount: 55
).localControls;
let delMod = sinOsc(2, 0).linLin(-1, 1, 1, 4);
let gainEnv = perc(ctl::trig, 0.001, 1, -4);
let modEnv = Env([0 1 0], [0.125 0.5], [-8 -4], nil, nil, 0).asEnvGen(ctl::trig);
let inSig = saw(xLine(100, 1000, 0.1)) * gainEnv;
let order = 8;
let size = ctl::size + modEnv.linLin(0, 1, 0, ctl::sizeEnvAmount);
let delTimes = {
	[1000 .. 4599].atRandom.nextPrime
} ! order;
let sampleRate = 48000;
let delTimesSec = (delTimes * delMod) / sampleRate;
let sig = inSig + localIn(order, [0] # order);
sig := delayC(sig, 0.5, delTimesSec * size - controlDur());
sig := sig * ctl::feedback;
sig := onePole(sig, ctl::coef);
sig := sig * matrix(ctl::trig, ctl::rotateFreq, ctl::rotateAmount).transpose;
sig := sig.sum;
(inSig + sig.splay2 <! localOut(sig)) * 0.5
