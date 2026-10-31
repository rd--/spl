/* http://scsynth.org/t/share-your-delay-reverb-designs/2206 (mk) ; warning=feedback ; left=? */
let ctl = (
	delay: 0.1,
	delayFb: 0.33,
	decayTime: 0.5,
	delayWidth: 0.1,
	modFreq: 0.1,
	modAmount: 0.25,
	fbLowCut: 0.5
).localControls;
let numChans = 2;
let input = audioIn([1 .. numChans]);
let localIn = localIn(numChans, [0] # numChans);
let output = [1 .. numChans].collect { :cNum |
	let randScale = rand(0.95, 1.0);
	let delayScale = cNum.isOdd.if {
		ctl['delayWidth'].linLin(0, 1, 0.5, 1.5)
	} {
		1
	};
	let delayVal = (delayScale * randScale * ctl['delay'].linLin(0, 1, 0.0001, 2)).lag3(0.1);
	let phase = cNum.linLin(1, numChans, -8.pi, 8.pi);
	let lfoFreq = (randScale * ctl['modFreq'].linExp(0, 1, 0.0001, 10)).lag3(0.1);
	let minModAmount = ctl['modAmount'].linLin(0, 1, 1, 0.001).lag(0.1) * delayVal;
	let delayValSig = lfTri(
		rand(0.99, 1) * lfoFreq,
		phase
	).linLin(-1, 1, minModAmount, delayVal);
	let fb0 = (ctl['delayFb'] * 1.1 * localIn[cNum]).tanh;
	let fb1 = delayL(fb0, 0.2, rand(0.1, 0.2));
	let fb2 = lpf(
		fb1,
		rand(0.99, 1.0) * ctl['fbLowCut'].linExp(0, 1, 40, 12000)
	);
	let sig = allpassC(
		input[cNum] + fb2,
		2,
		delayValSig,
		ctl['decayTime'].linLin(0, 1, 0.1, 3).lag3(0.1)
	);
	leakDc(sig, 0.995)
};
output <! localOut(output)
