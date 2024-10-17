/* choip (jmcc) #10 */
{
	let t = 12;
	let i = Impulse(XLine(ExpRand(1, 30), ExpRand(1, 30), t), 0);
	let f = XLine(ExpRand(600, 8000), ExpRand(600, 8000), t);
	let a = SinOsc(Decay2(i, 0.05, 0.5) * (-0.9 * f) + f, 0);
	let l = Line(1.Rand2, 1.Rand2, t);
	let j = XLine(ExpRand(0.01, 0.5), ExpRand(0.01, 0.5), t);
	let z = EqPan(Decay2(i * j, 0.01, 0.2) * a, l);
	4.timesRepeat {
		z := AllpassN(z, 0.1, { 0.05.Rand0 } ! 2, 4)
	};
	z
}.overlap(10, 1, 8)
