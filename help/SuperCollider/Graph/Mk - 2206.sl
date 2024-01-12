{- https://scsynth.org/t/share-your-delay-reverb-designs/2206 (mk) ; warning=feedback ; left=? -}
let numChans = 2;
let input = AudioIn([1 .. numChans]);
let localIn = LocalIn(numChans, 0 ! numChans);
let output = (1 .. numChans).collect { :cNum |
	let randScale = Rand(0.95, 1.0);
	let delayScale = cNum.odd.if {
		'delayWidth'.kr(0.1).LinLin(0, 1, 0.5, 1.5)
	} {
		1
	};
	let delayVal = (delayScale * randScale * delay.kr(0.1).LinLin(0, 1, 0.0001, 2)).Lag3(0.1);
	let phase = cNum.LinLin(1, numChans, -8.pi, 8.pi);
	let lfoFreq = (randScale * 'modFreq'.kr(0.1).LinExp(0, 1, 0.0001, 10)).Lag3(0.1);
	let minModAmount = 'modAmount'.kr(0.25).LinLin(0, 1, 1, 0.001).Lag(0.1) * delayVal;
	let delayValSig = LfTri(
		Rand(0.99, 1) * lfoFreq,
		phase
	).LinLin(-1, 1, minModAmount, delayVal);
	let fb0 = (1.1 * localIn[cNum] * 'delayFb'.kr(0.33)).Tanh;
	let fb1 = DelayL(fb0, 0.2, Rand(0.1, 0.2));
	let fb2 = Lpf(
		fb1,
		Rand(0.99, 1.0) * 'fbLowCut'.kr(0.5).LinExp(0, 1, 40, 12000)
	);
	let sig = AllpassC(
		input[cNum] + fb2,
		2,
		delayValSig,
		'decayTime'.kr(0.5).LinLin(0, 1, 0.1, 3).Lag3(0.1)
	);
	LeakDc(sig, 0.995)
};
output <! LocalOut(output)
