/* Event control ; Kyma pen name notation */
[1 .. 16].collect { :vc |
	let n = lpf(whiteNoise(), penRadius(vc) + 1 * 6000) * penZ(vc) * 2;
	let dlMax = 1 / 110;
	let dl = dlMax * (1 - penX(vc).round(0.025) * 0.9);
	let p = pluck(n, penDown(vc), dlMax, dl, 10, penY(vc) / 3);
	eqPan2(p, penAngle(vc) * 2 - 1)
}.mix
