/* Sawed Cymbals (Jmcc) #9 */
let sustainTime = 4;
let transitionTime = 4;
let dur = transitionTime * 2 + sustainTime;
{
	let p = 15; /* number of partials per channel per 'cymbal' */
	let f1 = 500 + Rand(0, 2000);
	let f2 = Rand(0, 8000);
	let frequencies = { f1 + Rand(0, f2) } ! p;
	let ringTimes = { 2 + Rand(0, 4) } ! p;
	let osc = LfSaw(XLine(Rand(0, 600), Rand(0, 600), dur), 0) * 0.0005;
	RingzBank(osc, frequencies, nil, ringTimes)
}.overlapTextureProgram(sustainTime, transitionTime, 6)
