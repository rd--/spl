{- Sawed Cymbals (Jmcc) #9 -}
let sustainTime = 4;
let transitionTime = 4;
let dur = transitionTime * 2 + sustainTime;
{
	let p = 15; {- number of partials per channel per 'cymbal' -}
	let f1 = 500 + 2000.Rand0;
	let f2 = 8000.Rand0;
	let frequencies = { f1 + f2.Rand0 } ! p;
	let ringTimes = { 2 + 4.Rand0 } ! p;
	let osc = LfSaw(XLine(600.Rand0, 600.Rand0, dur), 0) * 0.0005;
	RingzBank(osc, frequencies, nil, ringTimes)
}.overlap(sustainTime, transitionTime, 6)
