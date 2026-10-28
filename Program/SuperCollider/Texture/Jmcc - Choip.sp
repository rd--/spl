/* Choip (Jmcc) #10 */
{
	let t = 12;
	let i = Impulse(XLine(expRand(1, 30), expRand(1, 30), t), 0);
	let f = XLine(expRand(600, 8000), expRand(600, 8000), t);
	let a = SinOsc(Decay2(i, 0.05, 0.5) * (-0.9 * f) + f, 0);
	let l = line(Rand(-1, 1), Rand(-1, 1), t);
	let j = XLine(expRand(0.01, 0.5), expRand(0.01, 0.5), t);
	let z = EqPan(Decay2(i * j, 0.01, 0.2) * a, l);
	4.timesRepeat {
		z := AllpassN(z, 0.1, { Rand(0, 0.05) } ! 2, 4)
	};
	z
}.overlapTextureProgram(10, 1, 8)
