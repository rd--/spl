/* http://recarteblog.wordpress.com/2021/05/05/gongfm_sc/ ; or ; texture (rd) */
let dur = 7;
{ :tr |
	let freq = [67, 70, 74].midiCps;
	let ratio3 = tRand(0.34, 1.35, tr);
	let op3 = [
		sinOsc(freq * ratio3, 0),
		freq,
		ratio3,
		tRand(3.29, 5.06, tr),
		linSeg(tr, [0, 0.4, 1, 0.3, 1, dur, 0])
	].product;
	let ratio2 = tRand(0.17, 0.55, tr);
	let op2 = [
		sinOsc(freq * ratio2 + op3, 0),
		freq,
		ratio2,
		tRand(1.33, 2.00, tr),
		linSeg(tr, [0, 0, 1, 0.3, 1, dur, 0])
	].product;
	let ratio1 = tRand(0.49, 1.11, tr);
	let op1 = [
		sinOsc(freq * ratio1 + op2, 0),
		linSeg(tr, [0, 0.003, 1, 0.3, 1, dur - 0.5, 0])
	].product;
	let sig = op1.splay2;
	eqBalance2(
		sig.first,
		sig.second,
		tRand(-0.75, 0.75, tr)
	) * 0.7
}.overlapTexture(dur, 0, 2).mix
