/* http://sccode.org/1-5eo (bz) ; bohlen pierce scale ; graph edit ; requires=LfBrownNoise1 */
{ :tr |
	let dev = rand(0.2, 0.4);
	let root = tChoose(tr, [30, 32, 35, 37]);
	let buffer = [
		1, 9 / 7, 7 / 5, 5 / 3, 9 / 5, 15 / 7, 7 / 3, 25 / 9,
		3, 27 / 7, 21 / 5, 15 / 3, 27 / 5, 45 / 7, 21 / 3, 75 / 9,
		9
	].localBuf;
	let lfo = lfBrownNoise1(4, dev, 0) * 4 + 5;
	let index = indexInBetween(buffer, lfo).round(1);
	let intv = bufIndexClip(buffer, index);
	{
		let freq = lag(intv, 0.1) * root * (lfNoise2(12) * 0.02 + 1);
		let env = (lfNoise2(4) * 0.4 + 0.6) ^ 2;
		moogLadder(saw(freq) * env, lfNoise2(1) * 1700 + 2200, 0.3)
	} !^ 8 * 0.5
}.overlapTexture(4, 4, 3).mix
