/* Sawed Cymbals (Jmcc) #9 */
let sustainTime = 4;
let transitionTime = 4;
let dur = transitionTime * 2 + sustainTime;
{
	let p = 15; /* number of partials per channel per 'cymbal' */
	let f1 = 500 + rand(0, 2000);
	let f2 = rand(0, 8000);
	let frequencies = { f1 + rand(0, f2) } ! p;
	let ringTimes = { 2 + rand(0, 4) } ! p;
	let osc = lfSaw(xLine(rand(0, 600), rand(0, 600), dur), 0) * 0.0005;
	ringzBank(osc, frequencies, nil, ringTimes)
}.overlapTextureProgram(sustainTime, transitionTime, 6)
