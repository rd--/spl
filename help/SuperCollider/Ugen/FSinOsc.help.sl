{- FSinOsc -}
let freq = [LfNoise0([3, 5]), FSinOsc([3, 5], 0)].atRandom * 500 + 800;
let amp = [LfNoise1(2.2).Max(0) * 0.5, FSinOsc(2.2, 0) * 0.25 + 0.25].atRandom;
[SinOsc(freq, 0), Blip(freq, 8)].atRandom * amp * 0.2

{- additive synthesis of bell (Risset) -}
let pFreqList = [
	0.56 0.56 0.92 0.92 1.25 1.7 2 2.74 3 3.76 4.07;
	0.24 0.64 1.23 2 2.91 3.96 5.12 6.37
];
let pDetune = [0 1 0 1.7 0 0 0 0 0 0 0];
let pAmp = [1 0.67 1 1.8 2.67 1.67 1.46 1.33 1.33 1 1.33];
let pDur = [1 0.9 0.65 0.55 0.325 0.35 0.25 0.2 0.15 0.1 0.075];
{
	let pFreq = pFreqList.atRandom;
	let tr = Impulse(0, 0) + Dust(1 / 13);
	let freq = TRand(220, 440, tr);
	let amp = TRand(0.1, 0.2, tr);
	let dur = 13;
	let pan = TRand(-1, 1, tr);
	let osc = (1 .. pFreq.size).collect { :index |
		FSinOsc(
			pFreq[index] * freq + pDetune[index],
			0
		) * Perc(tr, 0.01, pDur[index] * dur, -4) * pAmp[index] * (amp / 11)
	}.Sum;
	EqPan2(osc, pan)
} !> 5
